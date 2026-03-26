import argparse
import json
import os
import tempfile
from pathlib import Path

import numpy as np

os.environ.setdefault("MPLCONFIGDIR", os.path.join(tempfile.gettempdir(), "rl_vehicle_mplconfig"))

import matplotlib.pyplot as plt

from src.envs.scenario_library import get_scenario
from src.envs.vehicle_avoidance_env import VehicleAvoidanceEnv


def build_env(scenario_name: str):
    config = get_scenario(scenario_name)
    return VehicleAvoidanceEnv(config=config)


def save_training_artifacts(output_dir: Path, scenario_name: str, timesteps: int):
    from stable_baselines3.common.results_plotter import load_results, ts2xy

    try:
        x, y = ts2xy(load_results(str(output_dir)), "timesteps")
    except Exception:
        return

    if len(x) == 0:
        return

    summary = {
        "scenario": scenario_name,
        "timesteps": timesteps,
        "episodes_logged": int(len(y)),
        "final_mean_reward_10": float(np.mean(y[-10:])),
        "best_reward": float(np.max(y)),
    }
    with (output_dir / "training_summary.json").open("w", encoding="utf-8") as file:
        json.dump(summary, file, ensure_ascii=False, indent=2)

    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(x, y, label="episode reward", alpha=0.6)
    if len(y) >= 5:
        window = min(10, len(y))
        kernel = np.ones(window) / window
        smooth = np.convolve(y, kernel, mode="valid")
        ax.plot(x[window - 1 :], smooth, label="moving average", linewidth=2)
    ax.set_title(f"Training Reward Curve - {scenario_name}")
    ax.set_xlabel("Timesteps")
    ax.set_ylabel("Episode Reward")
    ax.grid(True, linestyle="--", alpha=0.3)
    ax.legend()
    fig.tight_layout()
    fig.savefig(output_dir / "training_curve.png", dpi=150)
    plt.close(fig)


def train_ppo(scenario_name: str, timesteps: int, output_dir: Path):
    try:
        from stable_baselines3 import PPO
        from stable_baselines3.common.monitor import Monitor
    except ImportError as exc:
        raise RuntimeError(
            "缺少 stable-baselines3 或其依赖，请先执行 `pip install -r requirements.txt`。"
        ) from exc

    output_dir.mkdir(parents=True, exist_ok=True)
    os.environ.setdefault("MPLCONFIGDIR", str(output_dir / "mplconfig"))
    env = Monitor(build_env(scenario_name), filename=str(output_dir / "monitor.csv"))

    try:
        import tensorboard  # noqa: F401

        tensorboard_log = str(output_dir / "tb_logs")
    except ImportError:
        tensorboard_log = None

    model = PPO(
        policy="MlpPolicy",
        env=env,
        verbose=1,
        learning_rate=3e-4,
        n_steps=2048,
        batch_size=64,
        gamma=0.99,
        gae_lambda=0.95,
        ent_coef=0.01,
        clip_range=0.2,
        tensorboard_log=tensorboard_log,
    )
    model.learn(total_timesteps=timesteps, progress_bar=False)
    model.save(output_dir / "final_model")
    save_training_artifacts(output_dir, scenario_name, timesteps)
    env.close()
    return output_dir / "final_model.zip"


def main():
    parser = argparse.ArgumentParser(description="Train PPO for vehicle avoidance.")
    parser.add_argument("--scenario", default="mixed_dynamic", help="Scenario name.")
    parser.add_argument("--timesteps", type=int, default=50000, help="Training timesteps.")
    parser.add_argument(
        "--output-dir",
        default=None,
        help="Output directory. Default: artifacts/ppo_<scenario>",
    )
    args = parser.parse_args()

    output_dir = (
        Path(args.output_dir)
        if args.output_dir
        else Path("artifacts") / f"ppo_{args.scenario}"
    )
    saved_path = train_ppo(args.scenario, args.timesteps, output_dir)
    print(f"Model saved to: {saved_path}")
