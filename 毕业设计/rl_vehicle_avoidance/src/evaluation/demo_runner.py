import argparse
import time
from pathlib import Path

from src.envs.scenario_library import get_scenario
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


def run_demo(model_path: Path, scenario_name: str, delay: float, algo: str):
    env = VehicleAvoidanceEnv(
        config=get_scenario(scenario_name),
        render_mode="human",
    )
    model = load_model(model_path, algo)

    obs, info = env.reset()
    done = False
    truncated = False
    total_reward = 0.0
    steps = 0

    while not done and not truncated:
        action, _ = model.predict(obs, deterministic=True)
        obs, reward, done, truncated, info = env.step(action)
        total_reward += reward
        steps += 1
        if delay > 0:
            time.sleep(delay)

    print("Demo finished")
    print(f"algorithm      : {algo.upper()}")
    print(f"scenario       : {scenario_name}")
    print(f"steps          : {steps}")
    print(f"total_reward   : {total_reward:.2f}")
    print(f"reached_goal   : {info['reached_goal']}")
    print(f"collision      : {info['collision']}")
    print(f"distance_to_goal: {info['distance_to_goal']:.4f}")

    input("Press Enter to close the window...")
    env.close()


def main():
    parser = argparse.ArgumentParser(description="Run a visual demo for a trained PPO or DQN model.")
    parser.add_argument("--model", required=True, help="Path to model zip file.")
    parser.add_argument(
        "--algo",
        choices=["ppo", "dqn"],
        default="ppo",
        help="Algorithm used by the model. Default: ppo.",
    )
    parser.add_argument("--scenario", default="mixed_dynamic", help="Scenario name.")
    parser.add_argument(
        "--delay",
        type=float,
        default=0.08,
        help="Delay in seconds between steps for visualization.",
    )
    args = parser.parse_args()

    run_demo(Path(args.model), args.scenario, args.delay, args.algo)
