from __future__ import annotations

import json
import subprocess
from pathlib import Path
from textwrap import wrap

from PIL import Image, ImageDraw, ImageFont

from generate_midterm_ppt import rebuild_pptx_with_all_images


ROOT = Path(r"D:\file\study\XDU_CS\毕业设计\rl_vehicle_avoidance")
OUT_DIR = ROOT / "final_defense_ppt_assets"
PPT_PATH = ROOT / "王舒贤-毕业设计答辩.pptx"
FIXED_PPT_PATH = ROOT / "王舒贤-毕业设计答辩-最终版.pptx"
MD_PATH = OUT_DIR / "slides.md"

WIDTH = 1600
HEIGHT = 900
BLUE = (13, 79, 143)
DEEP_BLUE = (5, 48, 92)
LIGHT_BLUE = (232, 241, 249)
PALE_BLUE = (246, 250, 253)
GRAY = (84, 94, 108)
LIGHT_GRAY = (226, 232, 240)
BLACK = (20, 25, 31)
WHITE = (255, 255, 255)
GREEN = (35, 132, 85)
RED = (190, 64, 64)
ORANGE = (215, 132, 35)


def font(path: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(path, size=size)


FONT_DIR = Path(r"C:\Windows\Fonts")
TITLE_FONT = font(str(FONT_DIR / "simhei.ttf"), 42)
SUBTITLE_FONT = font(str(FONT_DIR / "msyhbd.ttc"), 28)
BODY_FONT = font(str(FONT_DIR / "msyh.ttc"), 25)
SMALL_FONT = font(str(FONT_DIR / "msyh.ttc"), 20)
TINY_FONT = font(str(FONT_DIR / "msyh.ttc"), 16)
CODE_FONT = font(str(FONT_DIR / "consola.ttf"), 18)
COVER_FONT = font(str(FONT_DIR / "simhei.ttf"), 50)
EN_FONT = font(str(FONT_DIR / "timesbd.ttf"), 30)


def load_eval_results() -> dict[tuple[str, str], dict]:
    path = ROOT / "artifacts" / "eval_reports" / "ppo_dqn_comparison_summary.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    return {(r["algorithm"], r["scenario"]): r for r in data["results"]}


def load_training_summaries() -> dict[tuple[str, str], dict]:
    summaries: dict[tuple[str, str], dict] = {}
    for path in (ROOT / "artifacts").glob("*_*/*training_summary.json"):
        algo = path.parent.name.split("_", 1)[0]
        data = json.loads(path.read_text(encoding="utf-8"))
        summaries[(algo, data["scenario"])] = data
    return summaries


def new_slide(title: str | None = None) -> tuple[Image.Image, ImageDraw.ImageDraw]:
    img = Image.new("RGB", (WIDTH, HEIGHT), WHITE)
    draw = ImageDraw.Draw(img)
    draw.rectangle([0, 0, WIDTH, 86], fill=BLUE)
    draw.rectangle([0, 86, WIDTH, 96], fill=LIGHT_GRAY)
    draw.text((72, 25), "西安电子科技大学  XIDIAN UNIVERSITY", font=SMALL_FONT, fill=WHITE)
    if title:
        draw.text((76, 132), title, font=TITLE_FONT, fill=DEEP_BLUE)
        draw.line((76, 190, 520, 190), fill=BLUE, width=4)
    return img, draw


def save_slide(index: int, img: Image.Image) -> Path:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    path = OUT_DIR / f"slide_{index:02d}.png"
    img.save(path)
    return path


def draw_wrapped(draw: ImageDraw.ImageDraw, text: str, xy: tuple[int, int], max_chars: int, font_obj, fill=BLACK, line_gap=8) -> int:
    x, y = xy
    for line in wrap(text, width=max_chars):
        draw.text((x, y), line, font=font_obj, fill=fill)
        y += font_obj.size + line_gap
    return y


def draw_bullets(draw: ImageDraw.ImageDraw, items: list[str], x: int, y: int, max_chars: int = 34, gap: int = 18) -> int:
    for item in items:
        draw.ellipse([x, y + 10, x + 13, y + 23], fill=BLUE)
        y = draw_wrapped(draw, item, (x + 28, y), max_chars, BODY_FONT, BLACK, 7)
        y += gap
    return y


def draw_tag(draw, xy, text, fill=LIGHT_BLUE, outline=BLUE):
    x, y, w, h = xy
    draw.rounded_rectangle([x, y, x + w, y + h], radius=12, fill=fill, outline=outline, width=2)
    box = draw.textbbox((0, 0), text, font=SMALL_FONT)
    draw.text((x + (w - (box[2] - box[0])) / 2, y + (h - (box[3] - box[1])) / 2 - 2), text, font=SMALL_FONT, fill=DEEP_BLUE)


def fit_image(path: Path, box: tuple[int, int, int, int], bg=WHITE) -> Image.Image:
    canvas = Image.new("RGB", (box[2], box[3]), bg)
    image = Image.open(path).convert("RGB")
    image.thumbnail((box[2], box[3]))
    canvas.paste(image, ((box[2] - image.width) // 2, (box[3] - image.height) // 2))
    return canvas


def paste_image(draw_img: Image.Image, path: Path, box: tuple[int, int, int, int], border=True):
    x, y, w, h = box
    if border:
        d = ImageDraw.Draw(draw_img)
        d.rounded_rectangle([x - 8, y - 8, x + w + 8, y + h + 8], radius=16, fill=PALE_BLUE, outline=LIGHT_GRAY, width=2)
    fitted = fit_image(path, (0, 0, w, h), PALE_BLUE)
    draw_img.paste(fitted, (x, y))


def draw_table(draw: ImageDraw.ImageDraw, x: int, y: int, col_widths: list[int], rows: list[list[str]], row_h: int = 42, font_obj=SMALL_FONT):
    total_w = sum(col_widths)
    for i, row in enumerate(rows):
        fill = BLUE if i == 0 else (248, 250, 252) if i % 2 == 1 else WHITE
        text_fill = WHITE if i == 0 else BLACK
        draw.rectangle([x, y + i * row_h, x + total_w, y + (i + 1) * row_h], fill=fill, outline=LIGHT_GRAY)
        cx = x
        for j, cell in enumerate(row):
            draw.rectangle([cx, y + i * row_h, cx + col_widths[j], y + (i + 1) * row_h], outline=LIGHT_GRAY)
            draw.text((cx + 8, y + i * row_h + 9), str(cell), font=font_obj, fill=text_fill)
            cx += col_widths[j]


def create_cover(index: int) -> Path:
    img = Image.new("RGB", (WIDTH, HEIGHT), WHITE)
    draw = ImageDraw.Draw(img)
    draw.rectangle([0, 0, 450, HEIGHT], fill=BLUE)
    for i in range(8):
        draw.rectangle([0, 620 + i * 35, 90 + i * 12, 638 + i * 35], fill=(255, 255, 255))
    draw.text((90, 95), "XDU", font=font(str(FONT_DIR / "timesbd.ttf"), 58), fill=WHITE)
    draw.text((90, 170), "西安电子科技大学", font=SUBTITLE_FONT, fill=WHITE)
    draw.text((530, 250), "基于深度强化学习的", font=COVER_FONT, fill=DEEP_BLUE)
    draw.text((530, 325), "无人智能车辆避障方法研究", font=COVER_FONT, fill=DEEP_BLUE)
    draw.line((530, 410, 1330, 410), fill=BLUE, width=4)
    draw.text((535, 470), "毕业设计答辩", font=font(str(FONT_DIR / "simhei.ttf"), 40), fill=BLACK)
    draw.text((535, 555), "答辩人：王舒贤", font=SUBTITLE_FONT, fill=GRAY)
    draw.text((535, 605), "专业：计算机科学与技术", font=SUBTITLE_FONT, fill=GRAY)
    draw.text((535, 655), "时间：2026年5月", font=SUBTITLE_FONT, fill=GRAY)
    return save_slide(index, img)


def create_outline(index: int) -> Path:
    img, draw = new_slide("汇报提纲")
    items = ["研究背景与问题定义", "仿真环境与任务建模", "深度强化学习算法设计", "系统实现与训练流程", "实验结果与 PPO/DQN 对比", "总结与展望"]
    x0, y0 = 150, 240
    for i, item in enumerate(items, 1):
        y = y0 + (i - 1) * 86
        draw.ellipse([x0, y, x0 + 48, y + 48], fill=BLUE)
        draw.text((x0 + 15, y + 7), str(i), font=SUBTITLE_FONT, fill=WHITE)
        draw.text((x0 + 78, y + 8), item, font=SUBTITLE_FONT, fill=BLACK)
    return save_slide(index, img)


def create_background(index: int) -> Path:
    img, draw = new_slide("研究背景与问题定义")
    draw_bullets(
        draw,
        [
            "无人智能车辆在园区配送、仓储物流、巡检安防等场景中需要稳定自主避障能力。",
            "传统 A*、人工势场、DWA 等方法依赖规则或环境模型，面对动态障碍时泛化能力不足。",
            "深度强化学习能够通过交互学习策略，直接从状态信息映射到动作决策。",
            "本文目标：构建二维避障环境，训练无人车辆在静态、动态和复杂障碍场景中安全到达目标。",
        ],
        120,
        245,
        max_chars=36,
    )
    draw.rounded_rectangle([1030, 250, 1460, 640], radius=18, fill=PALE_BLUE, outline=LIGHT_GRAY, width=2)
    draw.text((1080, 295), "核心矛盾", font=SUBTITLE_FONT, fill=BLUE)
    draw.text((1085, 360), "接近目标", font=BODY_FONT, fill=GREEN)
    draw.text((1200, 420), "vs.", font=SUBTITLE_FONT, fill=GRAY)
    draw.text((1270, 485), "规避障碍", font=BODY_FONT, fill=RED)
    draw.line((1110, 405, 1350, 505), fill=ORANGE, width=5)
    return save_slide(index, img)


def create_route(index: int) -> Path:
    img, draw = new_slide("总体技术路线")
    steps = ["环境建模", "状态/动作/奖励设计", "PPO/DQN 训练", "多场景评估", "结果对比分析"]
    xs = [120, 420, 720, 1020, 1320]
    y = 330
    for i, (x, step) in enumerate(zip(xs, steps)):
        draw.rounded_rectangle([x, y, x + 200, y + 100], radius=18, fill=LIGHT_BLUE, outline=BLUE, width=3)
        draw.text((x + 42, y + 32), step, font=SMALL_FONT, fill=DEEP_BLUE)
        if i < len(xs) - 1:
            draw.line((x + 210, y + 50, xs[i + 1] - 15, y + 50), fill=BLUE, width=4)
            draw.polygon([(xs[i + 1] - 15, y + 50), (xs[i + 1] - 35, y + 38), (xs[i + 1] - 35, y + 62)], fill=BLUE)
    draw_bullets(
        draw,
        [
            "输入：车辆位置、目标位置、边界距离、障碍物位置/半径/速度。",
            "输出：8 个离散方向动作之一。",
            "评价：成功率、碰撞率、平均奖励、平均步数。",
        ],
        180,
        560,
        max_chars=52,
        gap=10,
    )
    return save_slide(index, img)


def create_env_model(index: int) -> Path:
    img, draw = new_slide("避障环境建模")
    draw_tag(draw, (110, 245, 330, 58), "状态空间")
    draw_bullets(draw, ["车辆当前位置", "目标点相对位置", "到边界的距离", "最近 3 个障碍物：位置、半径、速度"], 125, 330, max_chars=22, gap=10)
    draw_tag(draw, (610, 245, 330, 58), "动作空间")
    draw_bullets(draw, ["8 个离散方向动作", "方向向量归一化", "兼容 PPO 与 DQN", "便于路径可视化"], 625, 330, max_chars=22, gap=10)
    draw_tag(draw, (1110, 245, 330, 58), "奖励函数")
    draw_bullets(draw, ["接近目标：正奖励", "每步移动：小惩罚", "接近障碍：安全惩罚", "碰撞/到达：大惩罚/大奖励"], 1125, 330, max_chars=22, gap=10)
    return save_slide(index, img)


def create_action_scene(index: int) -> Path:
    img, draw = new_slide("动作空间与场景设计")
    center = (390, 470)
    dirs = [("右", (1, 0)), ("右上", (1, 1)), ("上", (0, 1)), ("左上", (-1, 1)), ("左", (-1, 0)), ("左下", (-1, -1)), ("下", (0, -1)), ("右下", (1, -1))]
    for label, (dx, dy) in dirs:
        end = (center[0] + dx * 135, center[1] - dy * 135)
        draw.line((center, end), fill=BLUE, width=5)
        draw.polygon([(end[0], end[1]), (end[0] - dx * 18 + dy * 8, end[1] + dy * 18 + dx * 8), (end[0] - dx * 18 - dy * 8, end[1] + dy * 18 - dx * 8)], fill=BLUE)
        draw.text((end[0] - 26, end[1] - 26), label, font=SMALL_FONT, fill=DEEP_BLUE)
    draw.ellipse([center[0] - 18, center[1] - 18, center[0] + 18, center[1] + 18], fill=ORANGE)
    draw.text((240, 690), "8 个动作覆盖主要运动方向，较 4 动作更灵活，较连续动作更易训练。", font=SMALL_FONT, fill=GRAY)
    rows = [
        ["场景", "类型", "验证重点"],
        ["static_easy", "简单静态", "基础绕障"],
        ["static_dense", "密集静态", "复杂路径选择"],
        ["mixed_dynamic", "动静混合", "动态决策"],
        ["narrow_passage", "窄通道", "安全通过狭窄区域"],
        ["dynamic_crossing", "动态交叉", "多动态障碍避让"],
    ]
    draw_table(draw, 790, 235, [220, 160, 300], rows, row_h=58)
    return save_slide(index, img)


def create_algorithm(index: int) -> Path:
    img, draw = new_slide("算法设计：以 PPO 为主，DQN 为对照")
    paste_image(img, ROOT / "thesis_assets" / "ppo_flowchart.png", (90, 245, 650, 245))
    draw_bullets(
        draw,
        [
            "PPO：策略梯度 + Actor-Critic，直接优化动作策略。",
            "裁剪目标函数限制新旧策略差异，降低训练震荡。",
            "DQN：学习 Q(s,a)，适用于离散动作，但在动态障碍和密集障碍中更依赖探索与价值估计。",
            "本文动作空间虽为离散，但复杂奖励与动态障碍使 PPO 的稳定性更有优势。",
        ],
        840,
        250,
        max_chars=31,
        gap=14,
    )
    return save_slide(index, img)


def create_implementation(index: int) -> Path:
    img, draw = new_slide("系统实现与训练流程")
    rows = [
        ["模块", "文件", "功能"],
        ["环境", "vehicle_avoidance_env.py", "状态更新、奖励、碰撞、渲染"],
        ["场景", "scenario_library.py", "维护 5 个实验场景"],
        ["训练", "ppo_trainer.py / dqn_trainer.py", "模型训练与日志保存"],
        ["评估", "evaluator.py", "成功率、碰撞率、平均奖励"],
        ["演示", "demo_runner.py", "PPO/DQN 可视化动画"],
    ]
    draw_table(draw, 105, 235, [150, 390, 620], rows, row_h=62, font_obj=TINY_FONT)
    draw_code = [
        r"python train.py --scenario mixed_dynamic --timesteps 80000",
        r"python train_dqn.py --scenario mixed_dynamic --timesteps 80000",
        r"python evaluate.py --compare-all --episodes 30",
        r"python demo.py --algo dqn --model artifacts\dqn_mixed_dynamic\final_model.zip --scenario mixed_dynamic",
    ]
    y = 640
    draw.rounded_rectangle([105, y, 1490, y + 150], radius=14, fill=(24, 35, 48))
    for i, line in enumerate(draw_code):
        draw.text((135, y + 18 + i * 32), line, font=CODE_FONT, fill=(223, 232, 240))
    return save_slide(index, img)


def create_training_overview(index: int, summaries: dict[tuple[str, str], dict]) -> Path:
    img, draw = new_slide("训练结果总览")
    rows = [["算法", "场景", "步数", "末10回合均值", "最佳奖励"]]
    for algo in ["ppo", "dqn"]:
        for sc in ["static_easy", "static_dense", "mixed_dynamic", "narrow_passage", "dynamic_crossing"]:
            s = summaries[(algo, sc)]
            rows.append([algo.upper(), sc, str(s["timesteps"]), f"{s['final_mean_reward_10']:.2f}", f"{s['best_reward']:.2f}"])
    draw_table(draw, 95, 220, [95, 240, 120, 210, 160], rows, row_h=48, font_obj=TINY_FONT)
    draw_bullets(
        draw,
        [
            "PPO 在 5 个场景中最终均能形成可用策略，训练后期奖励整体更稳定。",
            "DQN 在简单场景可学到有效策略，但在密集、混合动态和窄通道场景中波动较大。",
            "训练曲线与最终评估共同说明：PPO 更适合作为本文主算法。",
        ],
        1030,
        270,
        max_chars=25,
        gap=16,
    )
    return save_slide(index, img)


def create_eval_table(index: int, results: dict[tuple[str, str], dict]) -> Path:
    img, draw = new_slide("多场景评估结果")
    rows = [["算法", "场景", "成功率", "碰撞率", "平均奖励", "平均步数"]]
    for algo in ["ppo", "dqn"]:
        for sc in ["static_easy", "static_dense", "mixed_dynamic", "narrow_passage", "dynamic_crossing"]:
            r = results[(algo, sc)]
            rows.append([algo.upper(), sc, f"{r['success_rate']:.2f}", f"{r['collision_rate']:.2f}", f"{r['avg_reward']:.2f}", f"{r['avg_steps']:.0f}"])
    draw_table(draw, 90, 220, [90, 235, 125, 125, 145, 130], rows, row_h=50, font_obj=TINY_FONT)
    draw.rounded_rectangle([1070, 260, 1470, 630], radius=18, fill=PALE_BLUE, outline=LIGHT_GRAY, width=2)
    draw.text((1105, 300), "关键结论", font=SUBTITLE_FONT, fill=BLUE)
    draw_bullets(draw, ["PPO：5/5 场景成功率 100%，碰撞率 0%。", "DQN：仅 2/5 场景成功，复杂场景失效。", "PPO 平均步数更少，路径效率更好。"], 1110, 370, max_chars=22, gap=14)
    return save_slide(index, img)


def create_curve_pair(index: int) -> Path:
    img, draw = new_slide("PPO 与 DQN 训练曲线对比（一）")
    paste_image(img, ROOT / "artifacts" / "comparisons" / "static_dense_ppo_vs_dqn.png", (85, 230, 680, 430))
    paste_image(img, ROOT / "artifacts" / "comparisons" / "mixed_dynamic_ppo_vs_dqn.png", (835, 230, 680, 430))
    draw.text((210, 705), "密集静态场景：PPO 稳定到达高奖励区间，DQN 最终碰撞失败。", font=SMALL_FONT, fill=GRAY)
    draw.text((920, 735), "动静混合场景：PPO 成功避障，DQN 对动态障碍适应不足。", font=SMALL_FONT, fill=GRAY)
    return save_slide(index, img)


def create_curve_triplet(index: int) -> Path:
    img, draw = new_slide("PPO 与 DQN 训练曲线对比（二）")
    paste_image(img, ROOT / "artifacts" / "comparisons" / "static_easy_ppo_vs_dqn.png", (80, 230, 470, 310))
    paste_image(img, ROOT / "artifacts" / "comparisons" / "narrow_passage_ppo_vs_dqn.png", (565, 230, 470, 310))
    paste_image(img, ROOT / "artifacts" / "comparisons" / "dynamic_crossing_ppo_vs_dqn.png", (1050, 230, 470, 310))
    labels = [
        "简单静态：两者均可完成，PPO 更短路径",
        "窄通道：DQN 保守停滞，PPO 通过",
        "动态交叉：DQN 成功但步数更多",
    ]
    for x, label in zip([105, 590, 1075], labels):
        draw_wrapped(draw, label, (x, 575), 20, SMALL_FONT, GRAY)
    return save_slide(index, img)


def create_why_ppo(index: int) -> Path:
    img, draw = new_slide("为什么选择 PPO 更合适")
    cards = [
        ("安全性", "PPO 五个场景均 0 碰撞；DQN 在密集静态和动静混合场景中碰撞失败。", GREEN),
        ("稳定性", "裁剪目标限制策略更新幅度，训练曲线更容易保持高奖励区间。", BLUE),
        ("效率", "PPO 平均步数集中在 34-39 步；DQN 在动态交叉需 65 步，窄通道达到 320 步。", ORANGE),
        ("扩展性", "PPO 可自然扩展到连续动作控制，适合后续加入速度和转向角。", DEEP_BLUE),
    ]
    for i, (title, text, color) in enumerate(cards):
        x = 110 + (i % 2) * 730
        y = 240 + (i // 2) * 230
        draw.rounded_rectangle([x, y, x + 620, y + 160], radius=18, fill=PALE_BLUE, outline=color, width=3)
        draw.text((x + 28, y + 24), title, font=SUBTITLE_FONT, fill=color)
        draw_wrapped(draw, text, (x + 28, y + 78), 28, SMALL_FONT, BLACK)
    return save_slide(index, img)


def create_demo_summary(index: int) -> Path:
    img, draw = new_slide("演示方式与系统输出")
    draw_bullets(
        draw,
        [
            "PPO 演示：python demo.py --model artifacts\\ppo_mixed_dynamic\\final_model.zip --scenario mixed_dynamic --delay 0.12",
            "DQN 演示：python demo.py --algo dqn --model artifacts\\dqn_dynamic_crossing\\final_model.zip --scenario dynamic_crossing --delay 0.12",
            "演示窗口展示车辆、目标点、静态障碍物、动态障碍物及运动轨迹。",
            "终端输出 steps、total_reward、reached_goal、collision、distance_to_goal 等指标。",
        ],
        100,
        250,
        max_chars=58,
        gap=18,
    )
    return save_slide(index, img)


def create_conclusion(index: int) -> Path:
    img, draw = new_slide("总结与展望")
    draw_tag(draw, (120, 240, 290, 58), "已完成工作")
    draw_bullets(draw, ["构建二维无人车辆避障仿真环境。", "设计状态、动作、奖励和五类测试场景。", "实现 PPO 与 DQN 训练、评估、演示和对比曲线。", "完成多场景实验并验证 PPO 更适合作为主算法。"], 130, 330, max_chars=28, gap=12)
    draw_tag(draw, (880, 240, 290, 58), "后续展望")
    draw_bullets(draw, ["引入随机起点、目标点和障碍物布局。", "扩展连续动作控制，加入速度和转向角。", "融合激光雷达/视觉等更真实感知输入。", "结合传统规划或安全约束提升可解释性。"], 890, 330, max_chars=28, gap=12)
    draw.text((660, 790), "恳请各位老师批评指正", font=SUBTITLE_FONT, fill=BLUE)
    return save_slide(index, img)


def build_slides() -> list[Path]:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    results = load_eval_results()
    summaries = load_training_summaries()
    creators = [
        lambda i: create_cover(i),
        create_outline,
        create_background,
        create_route,
        create_env_model,
        create_action_scene,
        create_algorithm,
        create_implementation,
        lambda i: create_training_overview(i, summaries),
        lambda i: create_eval_table(i, results),
        create_curve_pair,
        create_curve_triplet,
        create_why_ppo,
        create_demo_summary,
        create_conclusion,
    ]
    return [creator(i) for i, creator in enumerate(creators, 1)]


def build_markdown(slides: list[Path]) -> None:
    lines = []
    for idx, slide in enumerate(slides):
        if idx > 0:
            lines.append("\n---\n")
        lines.append("# \n\n")
        lines.append(f"![]({slide.name}){{width=13.333in height=7.5in}}\n")
    MD_PATH.write_text("".join(lines), encoding="utf-8")


def build_pptx() -> None:
    slides = build_slides()
    build_markdown(slides)
    subprocess.run(
        ["pandoc", "-f", "markdown-yaml_metadata_block", str(MD_PATH), "-o", str(PPT_PATH)],
        check=True,
        cwd=str(OUT_DIR),
    )
    rebuild_pptx_with_all_images(slides, PPT_PATH, FIXED_PPT_PATH)
    print(FIXED_PPT_PATH)


if __name__ == "__main__":
    build_pptx()
