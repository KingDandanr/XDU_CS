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


def evaluate_model(model_path: Path, scenario_name: str, episodes: int, render: bool):
    try:
        from stable_baselines3 import PPO
    except ImportError as exc:
        raise RuntimeError(
            "缺少 stable-baselines3 或其依赖，请先执行 `pip install -r requirements.txt`。"
        ) from exc

    env = VehicleAvoidanceEnv(
        config=get_scenario(scenario_name),
        render_mode="human" if render else None,
    )
    model = PPO.load(model_path)

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

    report_file = report_dir / f"{result['scenario']}_report.json"
    with report_file.open("w", encoding="utf-8") as file:
        json.dump(result, file, ensure_ascii=False, indent=2)

    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(result["rewards"], marker="o")
    ax.set_title(f"Rewards per Episode - {result['scenario']}")
    ax.set_xlabel("Episode")
    ax.set_ylabel("Reward")
    ax.grid(True, linestyle="--", alpha=0.3)
    fig.tight_layout()
    fig.savefig(report_dir / f"{result['scenario']}_rewards.png", dpi=150)
    plt.close(fig)


def main():
    parser = argparse.ArgumentParser(description="Evaluate PPO model.")
    parser.add_argument("--model", required=True, help="Path to PPO model zip file.")
    parser.add_argument("--scenario", default=None, help="Single scenario name.")
    parser.add_argument("--episodes", type=int, default=20, help="Episodes per scenario.")
    parser.add_argument("--render", action="store_true", help="Render evaluation.")
    parser.add_argument("--report-dir", default="artifacts/eval_reports", help="Report directory.")
    args = parser.parse_args()

    scenarios = [args.scenario] if args.scenario else list(SCENARIOS.keys())
    report_dir = Path(args.report_dir)

    for scenario_name in scenarios:
        result = evaluate_model(Path(args.model), scenario_name, args.episodes, args.render)
        save_report(result, report_dir)
        print(
            f"[{scenario_name}] success_rate={result['success_rate']:.2f}, "
            f"collision_rate={result['collision_rate']:.2f}, "
            f"avg_reward={result['avg_reward']:.2f}, avg_steps={result['avg_steps']:.2f}"
        )
