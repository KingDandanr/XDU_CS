import argparse
from pathlib import Path

import numpy as np

import matplotlib.pyplot as plt
from matplotlib import font_manager
from stable_baselines3.common.results_plotter import load_results, ts2xy


SCENARIO_NAMES = {
    "static_easy": "简单静态障碍场景",
    "static_dense": "密集静态障碍场景",
    "mixed_dynamic": "动静混合障碍场景",
    "narrow_passage": "窄通道障碍场景",
    "dynamic_crossing": "动态交叉障碍场景",
}


def setup_chinese_font():
    candidates = [
        r"C:\Windows\Fonts\msyh.ttc",
        r"C:\Windows\Fonts\simhei.ttf",
        r"C:\Windows\Fonts\simsun.ttc",
    ]
    for path in candidates:
        if Path(path).exists():
            font_name = font_manager.FontProperties(fname=path).get_name()
            plt.rcParams["font.sans-serif"] = [font_name]
            break
    plt.rcParams["axes.unicode_minus"] = False


def load_curve(log_dir: Path):
    x, y = ts2xy(load_results(str(log_dir)), "timesteps")
    return np.asarray(x), np.asarray(y)


def plot_curve(ax, x, y, label: str):
    ax.plot(x, y, alpha=0.25, linewidth=1, label=f"{label} 回合奖励")
    if len(y) >= 5:
        window = min(10, len(y))
        kernel = np.ones(window) / window
        smooth = np.convolve(y, kernel, mode="valid")
        ax.plot(x[window - 1 :], smooth, linewidth=2, label=f"{label} 移动平均")


def save_comparison(scenario_name: str, ppo_dir: Path, dqn_dir: Path, output_path: Path):
    setup_chinese_font()
    ppo_x, ppo_y = load_curve(ppo_dir)
    dqn_x, dqn_y = load_curve(dqn_dir)

    if len(ppo_y) == 0:
        raise ValueError(f"No PPO monitor data found in {ppo_dir}")
    if len(dqn_y) == 0:
        raise ValueError(f"No DQN monitor data found in {dqn_dir}")

    output_path.parent.mkdir(parents=True, exist_ok=True)

    fig, ax = plt.subplots(figsize=(8, 4.5))
    plot_curve(ax, ppo_x, ppo_y, "PPO")
    plot_curve(ax, dqn_x, dqn_y, "DQN")
    scenario_label = SCENARIO_NAMES.get(scenario_name, scenario_name)
    ax.set_title(f"PPO 与 DQN 训练奖励对比 - {scenario_label}")
    ax.set_xlabel("训练步数")
    ax.set_ylabel("回合奖励")
    ax.grid(True, linestyle="--", alpha=0.3)
    ax.legend()
    fig.tight_layout()
    fig.savefig(output_path, dpi=150)
    plt.close(fig)
    return output_path


def main():
    parser = argparse.ArgumentParser(description="Plot PPO and DQN training reward curves.")
    parser.add_argument("--scenario", default="mixed_dynamic", help="Scenario name.")
    parser.add_argument("--ppo-dir", default=None, help="Default: artifacts/ppo_<scenario>")
    parser.add_argument("--dqn-dir", default=None, help="Default: artifacts/dqn_<scenario>")
    parser.add_argument(
        "--output",
        default=None,
        help="Default: artifacts/comparisons/<scenario>_ppo_vs_dqn.png",
    )
    args = parser.parse_args()

    ppo_dir = Path(args.ppo_dir) if args.ppo_dir else Path("artifacts") / f"ppo_{args.scenario}"
    dqn_dir = Path(args.dqn_dir) if args.dqn_dir else Path("artifacts") / f"dqn_{args.scenario}"
    output_path = (
        Path(args.output)
        if args.output
        else Path("artifacts") / "comparisons" / f"{args.scenario}_ppo_vs_dqn.png"
    )

    saved_path = save_comparison(args.scenario, ppo_dir, dqn_dir, output_path)
    print(f"Comparison curve saved to: {saved_path}")


if __name__ == "__main__":
    main()
