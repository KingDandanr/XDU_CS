import argparse
import json
import os
import tempfile
from pathlib import Path

import numpy as np

os.environ.setdefault("MPLCONFIGDIR", os.path.join(tempfile.gettempdir(), "rl_vehicle_mplconfig"))

import matplotlib.pyplot as plt

from src.envs.scenario_library import SCENARIOS, get_scenario
from src.envs.vehicle_avoidance_env import VehicleAvoidanceEnv


def load_model(model_path: Path, algo: str):
    try:
        from stable_baselines3 import DQN, PPO
    except ImportError as exc:
        raise RuntimeError(
            "Missing stable-baselines3 or its dependencies. Run `pip install -r requirements.txt` first."
        ) from exc

    if algo == "ppo":
        return PPO.load(model_path)
    if algo == "dqn":
        return DQN.load(model_path)
    raise ValueError(f"Unknown algorithm: {algo}")


def evaluate_model(model_path: Path, scenario_name: str, episodes: int, render: bool, algo: str):
    env = VehicleAvoidanceEnv(
        config=get_scenario(scenario_name),
        render_mode="human" if render else None,
    )
    model = load_model(model_path, algo)

    rewards = []
    successes = 0
    collisions = 0
    steps_list = []

    for _ in range(episodes):
        obs, _ = env.reset()
        done = False
        truncated = False
        total_reward = 0.0
        steps = 0
        info = {"reached_goal": False, "collision": False}

        while not done and not truncated:
            action, _ = model.predict(obs, deterministic=True)
            obs, reward, done, truncated, info = env.step(action)
            total_reward += reward
            steps += 1

        rewards.append(total_reward)
        steps_list.append(steps)
        successes += int(info["reached_goal"])
        collisions += int(info["collision"])

    env.close()
    return {
        "algorithm": algo,
        "model_path": str(model_path),
        "scenario": scenario_name,
        "episodes": episodes,
        "success_rate": successes / episodes,
        "collision_rate": collisions / episodes,
        "avg_reward": float(np.mean(rewards)),
        "avg_steps": float(np.mean(steps_list)),
        "rewards": rewards,
    }


def save_report(result: dict, report_dir: Path):
    report_dir.mkdir(parents=True, exist_ok=True)

    prefix = f"{result['algorithm']}_{result['scenario']}"
    report_file = report_dir / f"{prefix}_report.json"
    with report_file.open("w", encoding="utf-8") as file:
        json.dump(result, file, ensure_ascii=False, indent=2)

    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(result["rewards"], marker="o")
    ax.set_title(f"Rewards per Episode - {result['algorithm'].upper()} {result['scenario']}")
    ax.set_xlabel("Episode")
    ax.set_ylabel("Reward")
    ax.grid(True, linestyle="--", alpha=0.3)
    fig.tight_layout()
    fig.savefig(report_dir / f"{prefix}_rewards.png", dpi=150)
    plt.close(fig)


def print_summary(results: list[dict], skipped: list[tuple[str, str, Path]]):
    if skipped:
        print("Skipped missing models:")
        for algo, scenario_name, model_path in skipped:
            print(f"  [{algo.upper()} {scenario_name}] {model_path}")

    if not results:
        print("No models evaluated.")
        return

    print()
    print("Evaluation summary:")
    print(f"{'ALGO':<6} {'SCENARIO':<18} {'SUCCESS':>8} {'COLLISION':>10} {'AVG_REWARD':>12} {'AVG_STEPS':>10}")
    print("-" * 70)
    for result in results:
        print(
            f"{result['algorithm'].upper():<6} "
            f"{result['scenario']:<18} "
            f"{result['success_rate']:>8.2f} "
            f"{result['collision_rate']:>10.2f} "
            f"{result['avg_reward']:>12.2f} "
            f"{result['avg_steps']:>10.2f}"
        )


def evaluate_compare_all(episodes: int, render: bool, report_dir: Path):
    results = []
    skipped = []
    for algo in ("ppo", "dqn"):
        for scenario_name in SCENARIOS:
            model_path = Path("artifacts") / f"{algo}_{scenario_name}" / "final_model.zip"
            if not model_path.exists():
                skipped.append((algo, scenario_name, model_path))
                continue
            result = evaluate_model(model_path, scenario_name, episodes, render, algo)
            save_report(result, report_dir)
            results.append(result)

    report_dir.mkdir(parents=True, exist_ok=True)
    summary_file = report_dir / "ppo_dqn_comparison_summary.json"
    with summary_file.open("w", encoding="utf-8") as file:
        json.dump({"results": results}, file, ensure_ascii=False, indent=2)

    print_summary(results, skipped)
    print(f"\nSummary saved to: {summary_file}")


def main():
    parser = argparse.ArgumentParser(description="Evaluate PPO or DQN model.")
    parser.add_argument("--model", default=None, help="Path to model zip file.")
    parser.add_argument(
        "--algo",
        choices=["ppo", "dqn"],
        default="ppo",
        help="Algorithm used by --model. Default: ppo.",
    )
    parser.add_argument("--scenario", default=None, help="Single scenario name.")
    parser.add_argument("--episodes", type=int, default=20, help="Episodes per scenario.")
    parser.add_argument("--render", action="store_true", help="Render evaluation.")
    parser.add_argument("--report-dir", default="artifacts/eval_reports", help="Report directory.")
    parser.add_argument(
        "--compare-all",
        action="store_true",
        help="Evaluate artifacts/ppo_<scenario> and artifacts/dqn_<scenario> models on their own scenarios.",
    )
    args = parser.parse_args()

    report_dir = Path(args.report_dir)

    if args.compare_all:
        evaluate_compare_all(args.episodes, args.render, report_dir)
        return

    if args.model is None:
        raise SystemExit("--model is required unless --compare-all is used.")

    scenarios = [args.scenario] if args.scenario else list(SCENARIOS.keys())
    results = []
    for scenario_name in scenarios:
        result = evaluate_model(Path(args.model), scenario_name, args.episodes, args.render, args.algo)
        save_report(result, report_dir)
        results.append(result)

    print_summary(results, [])
