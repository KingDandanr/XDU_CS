import argparse
from pathlib import Path

from stable_baselines3.common.monitor import Monitor

from src.training.ppo_trainer import build_env, save_training_artifacts


def train_dqn(scenario_name: str, timesteps: int, output_dir: Path):
    try:
        from stable_baselines3 import DQN
    except ImportError as exc:
        raise RuntimeError(
            "Missing stable-baselines3 or its dependencies. Run `pip install -r requirements.txt` first."
        ) from exc

    output_dir.mkdir(parents=True, exist_ok=True)
    env = Monitor(build_env(scenario_name), filename=str(output_dir / "monitor.csv"))

    try:
        import tensorboard  # noqa: F401

        tensorboard_log = str(output_dir / "tb_logs")
    except ImportError:
        tensorboard_log = None

    model = DQN(
        policy="MlpPolicy",
        env=env,
        verbose=1,
        learning_rate=1e-4,
        buffer_size=50000,
        learning_starts=1000,
        batch_size=64,
        gamma=0.99,
        train_freq=4,
        gradient_steps=1,
        target_update_interval=1000,
        exploration_fraction=0.25,
        exploration_final_eps=0.05,
        tensorboard_log=tensorboard_log,
    )
    model.learn(total_timesteps=timesteps, progress_bar=False)
    model.save(output_dir / "final_model")
    save_training_artifacts(output_dir, scenario_name, timesteps)
    env.close()
    return output_dir / "final_model.zip"


def main():
    parser = argparse.ArgumentParser(description="Train DQN for vehicle avoidance.")
    parser.add_argument("--scenario", default="mixed_dynamic", help="Scenario name.")
    parser.add_argument("--timesteps", type=int, default=50000, help="Training timesteps.")
    parser.add_argument(
        "--output-dir",
        default=None,
        help="Output directory. Default: artifacts/dqn_<scenario>",
    )
    args = parser.parse_args()

    output_dir = (
        Path(args.output_dir)
        if args.output_dir
        else Path("artifacts") / f"dqn_{args.scenario}"
    )
    saved_path = train_dqn(args.scenario, args.timesteps, output_dir)
    print(f"Model saved to: {saved_path}")


if __name__ == "__main__":
    main()
