# 基于深度强化学习的无人智能车辆避障项目

本项目严格按以下任务要求启动：

1. 调研深度强化学习与无人智能车辆决策方法。
2. 掌握深度强化学习基本概念与训练方法。
3. 构建无人车辆避障深度强化学习模型，并在静态、动态障碍场景中训练至收敛。
4. 在 Python 平台实现模型，并在不少于 3 个场景中完成测试验证。

## 当前版本已完成的内容

- 搭建了二维无人车避障仿真环境。
- 支持静态障碍物和动态障碍物。
- 预置了 3 个测试场景：
  - `static_easy`
  - `static_dense`
  - `mixed_dynamic`
- 提供了 PPO 训练入口和评估入口。
- 提供了基础可视化与指标统计逻辑。

## 项目结构

```text
rl_vehicle_avoidance/
├── README.md
├── requirements.txt
├── train.py
├── evaluate.py
├── demo.py
├── src/
│   ├── envs/
│   │   ├── scenario_library.py
│   │   └── vehicle_avoidance_env.py
│   ├── training/
│   │   └── ppo_trainer.py
│   └── evaluation/
│       ├── demo_runner.py
│       └── evaluator.py
└── artifacts/
```

## 环境设计

- 状态：
  - 车辆当前位置
  - 目标点相对位置
  - 车辆到边界的距离
  - 最近 3 个障碍物的相对位置、半径和速度
- 动作：
  - 8 个离散动作，表示 8 个移动方向
- 奖励：
  - 朝目标靠近获得正奖励
  - 每一步有微小时间惩罚
  - 靠近障碍物有额外惩罚
  - 碰撞大惩罚
  - 到达目标大奖励

## 三个测试场景

1. `static_easy`：少量静态障碍物
2. `static_dense`：较密集静态障碍物
3. `mixed_dynamic`：静态 + 动态障碍物混合

## 安装依赖

```bash
pip install -r requirements.txt
```

当前机器尚未安装 `torch`、`gymnasium`、`stable-baselines3`，因此训练前需要先安装依赖。

## 训练

```bash
python train.py --scenario mixed_dynamic --timesteps 50000
```

训练结果会保存在 `artifacts/ppo_<scenario>` 目录。

## 评估

```bash
python evaluate.py --model artifacts/ppo_mixed_dynamic/final_model.zip --episodes 20
```

## 演示

答辩演示

```bash
python demo.py --model artifacts/ppo_mixed_dynamic/final_model.zip --scenario mixed_dynamic
```

```bash
python train.py --scenario static_easy --timesteps 50000
python train.py --scenario static_dense --timesteps 50000
python train.py --scenario mixed_dynamic --timesteps 80000
python evaluate.py --model artifacts\ppo_mixed_dynamic\final_model.zip --episodes 30
python demo.py --model artifacts\ppo_static_easy\final_model.zip --scenario static_easy --delay 0.12
```

- `--scenario`：选择演示场景
- `--delay`：控制动画播放速度

## 配套文档

- `EXPERIMENT_PLAN.md`：实验设计与评价指标

## 对应论文章节建议

- 第 1 章：研究背景、国内外现状
- 第 2 章：深度强化学习与避障理论
- 第 3 章：环境建模与奖励函数设计
- 第 4 章：模型训练与实验设计
- 第 5 章：测试结果与分析
