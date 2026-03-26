import argparse
import time
from pathlib import Path

from src.envs.scenario_library import get_scenario
from src.envs.vehicle_avoidance_env import VehicleAvoidanceEnv


def run_demo(model_path: Path, scenario_name: str, delay: float):
    try:
        from stable_baselines3 import PPO
    except ImportError as exc:
        raise RuntimeError(
            "缺少 stable-baselines3 或其依赖，请先执行 `pip install -r requirements.txt`。"
        ) from exc

    env = VehicleAvoidanceEnv(
        config=get_scenario(scenario_name),
        render_mode="human",
    )
    model = PPO.load(model_path)

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
    print(f"scenario       : {scenario_name}")
    print(f"steps          : {steps}")
    print(f"total_reward   : {total_reward:.2f}")
    print(f"reached_goal   : {info['reached_goal']}")
    print(f"collision      : {info['collision']}")
    print(f"distance_to_goal: {info['distance_to_goal']:.4f}")

    input("Press Enter to close the window...")
    env.close()


def main():
    parser = argparse.ArgumentParser(description="Run a visual demo for a trained PPO model.")
    parser.add_argument("--model", required=True, help="Path to PPO model zip file.")
    parser.add_argument("--scenario", default="mixed_dynamic", help="Scenario name.")
    parser.add_argument(
        "--delay",
        type=float,
        default=0.08,
        help="Delay in seconds between steps for visualization.",
    )
    args = parser.parse_args()

    run_demo(Path(args.model), args.scenario, args.delay)
