from __future__ import annotations

from pathlib import Path
from textwrap import wrap
import subprocess
import zipfile
from xml.etree import ElementTree as ET

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(r"D:\file\study\XDU_CS\毕业设计\rl_vehicle_avoidance")
OUT_DIR = ROOT / "midterm_ppt_assets"
PPT_PATH = ROOT / "王舒贤-毕业设计中期答辩.pptx"
FIXED_PPT_PATH = ROOT / "王舒贤-毕业设计中期答辩-修正版.pptx"
MD_PATH = OUT_DIR / "slides.md"

WIDTH = 1600
HEIGHT = 900
BLUE = (11, 76, 140)
LIGHT_GRAY = (220, 220, 220)
WHITE = (255, 255, 255)
BLACK = (20, 20, 20)
GRAY = (80, 80, 80)


def font(path: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(path, size=size)


TITLE_FONT = font(r"C:\Windows\Fonts\simhei.ttf", 34)
SUBTITLE_FONT = font(r"C:\Windows\Fonts\msyhbd.ttc", 24)
BODY_FONT = font(r"C:\Windows\Fonts\msyh.ttc", 24)
SMALL_FONT = font(r"C:\Windows\Fonts\msyh.ttc", 20)
CODE_FONT = font(r"C:\Windows\Fonts\consola.ttf", 19)
EN_FONT = font(r"C:\Windows\Fonts\timesbd.ttf", 28)
COVER_TITLE_FONT = font(r"C:\Windows\Fonts\simhei.ttf", 38)


def draw_school_header(draw: ImageDraw.ImageDraw, cover: bool) -> None:
    if cover:
        y0 = 620
        for i in range(5):
            draw.rectangle([0, y0 + i * 65, 65, y0 + 22 + i * 65], fill=BLUE)
        logo_center = (115, 100)
    else:
        for i in range(4):
            draw.rectangle([0, i * 28, 65, 18 + i * 28], fill=BLUE)
        draw.rectangle([500, 0, WIDTH, 95], fill=BLUE)
        draw.rectangle([500, 95, WIDTH, 110], fill=LIGHT_GRAY)
        logo_center = (120, 80)

    x, y = logo_center
    draw.ellipse([x - 42, y - 42, x + 42, y + 42], outline=BLUE, width=4)
    draw.text((x - 24, y - 16), "XDU", font=SUBTITLE_FONT, fill=BLUE)
    draw.text((195, 48 if cover else 34), "西安电子科技大学", font=COVER_TITLE_FONT, fill=BLACK)
    draw.text((210, 106 if cover else 88), "XIDIAN UNIVERSITY", font=EN_FONT, fill=BLACK)


def new_slide(cover: bool = False) -> tuple[Image.Image, ImageDraw.ImageDraw]:
    img = Image.new("RGB", (WIDTH, HEIGHT), WHITE)
    draw = ImageDraw.Draw(img)
    draw_school_header(draw, cover)
    return img, draw


def draw_title(draw: ImageDraw.ImageDraw, title: str) -> None:
    draw.text((90, 140), title, font=TITLE_FONT, fill=BLUE)
    draw.line((90, 188, 470, 188), fill=BLUE, width=3)


def draw_bullets(draw: ImageDraw.ImageDraw, items: list[str], start_y: int = 230, line_gap: int = 20) -> None:
    x = 110
    y = start_y
    max_width = 44
    for item in items:
        lines = wrap(item, width=max_width)
        draw.ellipse([x - 28, y + 10, x - 14, y + 24], fill=BLUE)
        draw.text((x, y), lines[0], font=BODY_FONT, fill=BLACK)
        y += 34
        for line in lines[1:]:
            draw.text((x, y), line, font=BODY_FONT, fill=BLACK)
            y += 34
        y += line_gap


def draw_code_block(draw: ImageDraw.ImageDraw, title: str, lines: list[str], x: int, y: int, w: int) -> int:
    draw.rounded_rectangle([x, y, x + w, y + 34 + 34 * len(lines) + 20], radius=12, outline=BLUE, width=2, fill=(245, 249, 253))
    draw.rectangle([x, y, x + w, y + 38], fill=BLUE)
    draw.text((x + 16, y + 6), title, font=SMALL_FONT, fill=WHITE)
    ty = y + 52
    for line in lines:
        draw.text((x + 16, ty), line, font=CODE_FONT, fill=BLACK)
        ty += 30
    return ty + 10


def save_slide(index: int, img: Image.Image) -> Path:
    path = OUT_DIR / f"slide_{index:02d}.png"
    img.save(path)
    return path


def create_cover(index: int) -> Path:
    img, draw = new_slide(cover=True)
    draw.text((430, 310), "毕业设计中期答辩", font=font(r"C:\Windows\Fonts\simhei.ttf", 44), fill=BLUE)
    draw.line((430, 375, 1060, 375), fill=BLUE, width=3)
    draw.text((430, 420), "基于深度强化学习的无人智能车辆避障方法研究", font=font(r"C:\Windows\Fonts\msyhbd.ttc", 28), fill=BLACK)
    draw.text((430, 510), "计算机科学与技术学院", font=SUBTITLE_FONT, fill=GRAY)
    draw.text((430, 555), "答辩人：王舒贤", font=SUBTITLE_FONT, fill=GRAY)
    draw.text((430, 600), "时间：2026年3月", font=SUBTITLE_FONT, fill=GRAY)
    return save_slide(index, img)


def create_text_slide(index: int, title: str, bullets: list[str]) -> Path:
    img, draw = new_slide()
    draw_title(draw, title)
    draw_bullets(draw, bullets)
    return save_slide(index, img)


def create_model_slide(index: int) -> Path:
    img, draw = new_slide()
    draw_title(draw, "深度强化学习避障模型构建")
    left_items = [
        "环境建模：二维平面场景，包含起点、目标点、边界与障碍物。",
        "状态空间：车辆位置、目标相对位置、边界距离、最近3个障碍物的位置/半径/速度。",
        "动作空间：8个离散方向动作，便于快速完成训练验证。",
        "奖励设计：趋近目标正奖励、步长惩罚、接近障碍惩罚、碰撞大惩罚、到达目标大奖励。",
        "场景设置：static_easy、static_dense、mixed_dynamic，对应静态和动态障碍验证需求。",
    ]
    draw_bullets(draw, left_items, start_y=220, line_gap=14)
    draw.rounded_rectangle([930, 220, 1490, 700], radius=16, outline=BLUE, width=2, fill=(248, 250, 252))
    draw.text((960, 245), "模型训练流程", font=SUBTITLE_FONT, fill=BLUE)
    steps = [
        "1. 读取场景配置",
        "2. 初始化 VehicleAvoidanceEnv",
        "3. 使用 PPO 与环境交互采样",
        "4. 更新策略网络和价值网络",
        "5. 保存模型、日志、曲线与摘要",
    ]
    y = 300
    for step in steps:
        draw.text((980, y), step, font=BODY_FONT, fill=BLACK)
        y += 68
    return save_slide(index, img)


def create_code_slide(index: int) -> Path:
    img, draw = new_slide()
    draw_title(draw, "代码结构、训练、测试与演示")
    draw.text((105, 220), "项目关键文件", font=SUBTITLE_FONT, fill=BLUE)
    left = [
        "src/envs/scenario_library.py：定义3个测试场景",
        "src/envs/vehicle_avoidance_env.py：环境、奖励、碰撞与渲染",
        "src/training/ppo_trainer.py：PPO训练逻辑与结果保存",
        "src/evaluation/evaluator.py：批量测试并输出成功率/碰撞率",
        "demo.py：加载模型进行可视化答辩演示",
    ]
    draw_bullets(draw, left, start_y=260, line_gap=10)

    draw_code_block(
        draw,
        "训练简单静态场景",
        ["python train.py --scenario static_easy --timesteps 50000"],
        920,
        220,
        560,
    )
    draw_code_block(
        draw,
        "训练密集静态场景",
        ["python train.py --scenario static_dense --timesteps 50000"],
        920,
        350,
        560,
    )
    draw_code_block(
        draw,
        "训练动静混合场景",
        ["python train.py --scenario mixed_dynamic --timesteps 80000"],
        920,
        480,
        560,
    )
    draw_code_block(
        draw,
        "测试与演示",
        [
            r"python evaluate.py --model artifacts\ppo_mixed_dynamic\final_model.zip --episodes 30",
            r"python demo.py --model artifacts\ppo_static_easy\final_model.zip --scenario static_easy --delay 0.12",
        ],
        920,
        610,
        560,
    )
    return save_slide(index, img)


def create_progress_slide(index: int) -> Path:
    img, draw = new_slide()
    draw_title(draw, "当前进展与下一阶段计划")
    left = [
        "已完成：项目工程搭建、强化学习环境构建、3个典型场景设计。",
        "已完成：PPO训练入口、评估入口、可视化演示入口搭建。",
        "已完成：论文前4章主体草稿、实验方案与论文提纲整理。",
        "当前问题：动态障碍场景训练难度较高，模型仍需更长步数进一步收敛。",
        "下一步：完成50k/80k正式训练，统计成功率、碰撞率、平均奖励并形成实验表格。",
    ]
    draw_bullets(draw, left, start_y=230, line_gap=18)
    draw.rounded_rectangle([980, 240, 1480, 650], radius=16, outline=BLUE, width=2, fill=(247, 249, 252))
    draw.text((1010, 275), "中期答辩目标", font=SUBTITLE_FONT, fill=BLUE)
    goals = [
        "说明选题背景与研究价值",
        "展示深度强化学习建模思路",
        "展示训练、测试、演示主流程",
        "说明已完成工作与后续安排",
    ]
    y = 335
    for g in goals:
        draw.text((1030, y), "• " + g, font=BODY_FONT, fill=BLACK)
        y += 72
    return save_slide(index, img)


def build_slides() -> list[Path]:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    slides: list[Path] = []
    slides.append(create_cover(1))
    slides.append(
        create_text_slide(
            2,
            "研究背景与中期工作概述",
            [
                "无人智能车辆需要在复杂环境中完成安全自主导航，避障决策是关键能力之一。",
                "传统A*、人工势场、DWA等方法在静态环境中有效，但在动态障碍物场景中存在局限。",
                "本课题选择深度强化学习路线，在Python平台下构建仿真环境并训练车辆避障策略。",
                "中期阶段重点完成：理论调研、环境建模、PPO训练主线、测试评估与演示链路。",
            ],
        )
    )
    slides.append(
        create_text_slide(
            3,
            "深度强化学习研究现状",
            [
                "深度强化学习将强化学习的序列决策能力与深度神经网络的特征表达能力结合起来。",
                "典型算法包括 DQN、DDPG、A3C、PPO 等，已广泛应用于机器人控制与自主导航任务。",
                "当前研究重点包括：训练稳定性、样本利用效率、泛化能力以及仿真到现实迁移。",
                "在避障任务中，深度强化学习能够直接从状态输入中学习动作策略，减少人工规则依赖。",
            ],
        )
    )
    slides.append(
        create_text_slide(
            4,
            "无人智能车辆决策方法研究现状",
            [
                "传统决策方法主要包括 A*、Dijkstra、人工势场法和动态窗口法（DWA）。",
                "这些方法在地图已知、障碍静止的场景中效果较好，但面对动态环境时建模成本较高。",
                "学习型方法通过数据和交互学习策略，能够提升复杂环境中的适应性和实时性。",
                "因此，基于深度强化学习的动态避障已成为无人智能车辆决策研究的重要方向。",
            ],
        )
    )
    slides.append(
        create_text_slide(
            5,
            "深度强化学习基本原理",
            [
                "强化学习由智能体、环境、状态、动作、奖励和策略构成，可抽象为马尔可夫决策过程（MDP）。",
                "智能体通过不断试错，学习在不同状态下选择最优动作，以最大化长期累计奖励。",
                "在本课题中，车辆作为智能体，环境为二维避障场景，目标是在不碰撞的前提下到达终点。",
                "深度强化学习使用神经网络逼近策略或价值函数，从而处理高维状态输入问题。",
            ],
        )
    )
    slides.append(
        create_text_slide(
            6,
            "PPO 算法原理",
            [
                "PPO（Proximal Policy Optimization）属于 Actor-Critic 框架，兼顾训练稳定性与实现复杂度。",
                "Actor 网络负责输出动作策略，Critic 网络负责评估当前状态或动作的价值。",
                "PPO 通过裁剪目标函数限制新旧策略差异，避免参数更新过大引起训练震荡。",
                "相较于 DQN，PPO 更适合本课题这种连续交互式避障决策问题。",
            ],
        )
    )
    slides.append(create_model_slide(7))
    slides.append(create_code_slide(8))
    slides.append(
        create_text_slide(
            9,
            "训练结果查看方式",
            [
                "final_model.zip：训练好的模型文件，供 evaluate.py 和 demo.py 加载。",
                "monitor.csv：每个回合的原始日志，包含奖励 r、步数 l 等数据。",
                "training_curve.png：训练奖励曲线图，用于判断模型是否在逐步学习和趋于稳定。",
                "training_summary.json：训练摘要，重点关注 final_mean_reward_10 与 best_reward 两个指标。",
                "evaluate.py 输出 success_rate、collision_rate、avg_reward、avg_steps，用于论文实验结果分析。",
            ],
        )
    )
    slides.append(create_progress_slide(10))
    return slides


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


def slide_xml() -> bytes:
    xml = """<?xml version="1.0" encoding="UTF-8"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
       xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
       xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr>
        <p:cNvPr id="1" name=""/>
        <p:cNvGrpSpPr/>
        <p:nvPr/>
      </p:nvGrpSpPr>
      <p:grpSpPr>
        <a:xfrm>
          <a:off x="0" y="0"/>
          <a:ext cx="0" cy="0"/>
          <a:chOff x="0" y="0"/>
          <a:chExt cx="0" cy="0"/>
        </a:xfrm>
      </p:grpSpPr>
      <p:pic>
        <p:nvPicPr>
          <p:cNvPr id="2" name="FullSlideImage"/>
          <p:cNvPicPr>
            <a:picLocks noGrp="1" noChangeAspect="1"/>
          </p:cNvPicPr>
          <p:nvPr/>
        </p:nvPicPr>
        <p:blipFill>
          <a:blip r:embed="rId2"/>
          <a:stretch><a:fillRect/></a:stretch>
        </p:blipFill>
        <p:spPr bwMode="auto">
          <a:xfrm>
            <a:off x="0" y="0"/>
            <a:ext cx="9144000" cy="5143500"/>
          </a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:noFill/>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
      </p:pic>
    </p:spTree>
  </p:cSld>
</p:sld>
"""
    return xml.encode("utf-8")


def slide_rels_xml(image_index: int) -> bytes:
    xml = f"""<?xml version="1.0" encoding="UTF-8"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout2.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="../media/image{image_index}.png"/>
</Relationships>
"""
    return xml.encode("utf-8")


def rebuild_pptx_with_all_images(slides: list[Path], base_pptx: Path, out_pptx: Path) -> None:
    ns_ct = {"ct": "http://schemas.openxmlformats.org/package/2006/content-types"}
    ns_p = {"p": "http://schemas.openxmlformats.org/presentationml/2006/main", "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships"}
    ns_rel = {"rel": "http://schemas.openxmlformats.org/package/2006/relationships"}
    app_ns = {
        "ep": "http://schemas.openxmlformats.org/officeDocument/2006/extended-properties",
        "vt": "http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes",
    }

    with zipfile.ZipFile(base_pptx, "r") as zin, zipfile.ZipFile(out_pptx, "w", zipfile.ZIP_DEFLATED) as zout:
        keep_prefixes = (
            "ppt/slideLayouts/",
            "ppt/slideMasters/",
            "ppt/theme/",
            "ppt/_rels/",
            "ppt/printerSettings/",
            "ppt/presProps.xml",
            "ppt/viewProps.xml",
            "ppt/tableStyles.xml",
            "_rels/",
            "docProps/",
        )
        skip_prefixes = ("ppt/slides/", "ppt/media/")
        skip_exact = ("ppt/presentation.xml", "ppt/_rels/presentation.xml.rels", "[Content_Types].xml", "docProps/app.xml")

        for item in zin.infolist():
            name = item.filename
            if name in skip_exact or name.startswith(skip_prefixes):
                continue
            if name.startswith(keep_prefixes) or not name.startswith("ppt/"):
                zout.writestr(name, zin.read(name))

        for idx, slide_path in enumerate(slides, start=1):
            zout.writestr(f"ppt/media/image{idx}.png", slide_path.read_bytes())
            zout.writestr(f"ppt/slides/slide{idx}.xml", slide_xml())
            zout.writestr(f"ppt/slides/_rels/slide{idx}.xml.rels", slide_rels_xml(idx))

        # presentation.xml
        pres_root = ET.fromstring(zin.read("ppt/presentation.xml"))
        sld_id_lst = pres_root.find("p:sldIdLst", ns_p)
        for child in list(sld_id_lst):
            sld_id_lst.remove(child)
        for idx in range(1, len(slides) + 1):
            el = ET.Element("{http://schemas.openxmlformats.org/presentationml/2006/main}sldId")
            el.set("id", str(255 + idx))
            el.set("{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id", f"rId{idx+1}")
            sld_id_lst.append(el)
        zout.writestr("ppt/presentation.xml", ET.tostring(pres_root, encoding="utf-8", xml_declaration=True))

        # presentation rels
        rels_root = ET.Element("{http://schemas.openxmlformats.org/package/2006/relationships}Relationships")
        def add_rel(rid: str, typ: str, target: str) -> None:
            rel = ET.SubElement(rels_root, "{http://schemas.openxmlformats.org/package/2006/relationships}Relationship")
            rel.set("Id", rid)
            rel.set("Type", typ)
            rel.set("Target", target)
        add_rel("rId1", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster", "slideMasters/slideMaster1.xml")
        for idx in range(1, len(slides) + 1):
            add_rel(f"rId{idx+1}", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide", f"slides/slide{idx}.xml")
        add_rel("rId20", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/presProps", "presProps.xml")
        add_rel("rId21", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/viewProps", "viewProps.xml")
        add_rel("rId22", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme", "theme/theme1.xml")
        add_rel("rId23", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/tableStyles", "tableStyles.xml")
        zout.writestr("ppt/_rels/presentation.xml.rels", ET.tostring(rels_root, encoding="utf-8", xml_declaration=True))

        # content types
        ct_root = ET.fromstring(zin.read("[Content_Types].xml"))
        for override in list(ct_root.findall("ct:Override", ns_ct)):
            part = override.attrib.get("PartName", "")
            if part.startswith("/ppt/slides/slide"):
                ct_root.remove(override)
        for idx in range(1, len(slides) + 1):
            el = ET.Element("{http://schemas.openxmlformats.org/package/2006/content-types}Override")
            el.set("PartName", f"/ppt/slides/slide{idx}.xml")
            el.set("ContentType", "application/vnd.openxmlformats-officedocument.presentationml.slide+xml")
            ct_root.append(el)
        zout.writestr("[Content_Types].xml", ET.tostring(ct_root, encoding="utf-8", xml_declaration=True))

        # app.xml
        app_root = ET.fromstring(zin.read("docProps/app.xml"))
        slides_el = app_root.find("ep:Slides", app_ns)
        if slides_el is not None:
            slides_el.text = str(len(slides))
        heading_pairs = app_root.find("ep:HeadingPairs/vt:vector", app_ns)
        if heading_pairs is not None and len(list(heading_pairs)) >= 6:
            heading_pairs[5].text = str(len(slides))
        titles = app_root.find("ep:TitlesOfParts/vt:vector", app_ns)
        if titles is not None:
            for child in list(titles):
                titles.remove(child)
            for item in ["Arial", "Calibri", "Office Theme"] + [f"Slide {i}" for i in range(1, len(slides) + 1)]:
                el = ET.Element("{http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes}lpstr")
                el.text = item
                titles.append(el)
            titles.set("size", str(3 + len(slides)))
        zout.writestr("docProps/app.xml", ET.tostring(app_root, encoding="utf-8", xml_declaration=True))


if __name__ == "__main__":
    build_pptx()
