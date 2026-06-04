



# 基于深度强化学习的无人智能车辆避障项目

本项目严格按以下任务要求启动：

1. 调研深度强化学习与无人智能车辆决策方法。
2. 掌握深度强化学习基本概念与训练方法。
3. 构建无人车辆避障深度强化学习模型，并在静态、动态障碍场景中训练至收敛。
4. 在 Python 平台实现模型，并在不少于 3 个场景中完成测试验证。

## 当前版本已完成的内容

- 搭建了二维无人车避障仿真环境。
- 支持静态障碍物和动态障碍物。
- 当前场景库共包含 5 个场景：
  
  1. `static_easy`：简单静态障碍物场景
  2. `static_dense`：密集静态障碍物场景
  3. `mixed_dynamic`：静态与动态障碍物混合场景
  4. `narrow_passage`：窄通道静态障碍物场景
  5. `dynamic_crossing`：动态交叉障碍物场景
- 提供了 PPO  DQN训练入口和评估入口。
- 提供了基础可视化与指标统计逻辑。

## 项目结构



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

## 安装依赖

```bash
pip install -r requirements.txt
```

当前机器尚未安装 `torch`、`gymnasium`、`stable-baselines3`，因此训练前需要先安装依赖。

## PPO训练

```bash
python train.py --scenario mixed_dynamic --timesteps 50000
```

训练结果会保存在 `artifacts/ppo_<scenario>` 目录。

## DQN 训练

DQN 训练入口为 `train_dqn.py`，默认输出目录为 `artifacts/dqn_<scenario>`。

```bash
python train_dqn.py --scenario mixed_dynamic --timesteps 50000
```

## PPO 与 DQN 训练曲线对比

先分别训练 PPO 和 DQN：

```bash
python train.py --scenario mixed_dynamic --timesteps 50000
python train_dqn.py --scenario mixed_dynamic --timesteps 50000
```

然后生成对比曲线：

```bash
python compare_training.py --scenario mixed_dynamic
```

默认输出：

```text
artifacts/comparisons/mixed_dynamic_ppo_vs_dqn.png
```

## 评估

```bash
python evaluate.py --compare-all --episodes 30 
```

这条命令会一次性扫描并评估：

```bash
artifacts/ppo_<scenario>/final_model.zip artifacts/dqn_<scenario>/final_model.zip 
```

也就是 PPO 和 DQN 在各个场景下训练出来的模型。它会输出一张汇总表，包括：

```bash
ALGO SCENARIO SUCCESS COLLISION AVG_REWARD AVG_STEPS 
```

结果会保存到：

```bash
artifacts/eval_reports/ppo_dqn_comparison_summary.json 
```

只评估**一个模型**，也就是 ppo_mixed_dynamic 这个模型

```bash
python evaluate.py --model artifacts\ppo_mixed_dynamic\final_model.zip --episodes 30 
```

如果只评估一个 DQN 模型：

```bash
python evaluate.py --algo dqn --model artifacts\dqn_mixed_dynamic\final_model.zip --scenario mixed_dynamic --episodes 30 
```

## 演示

```bash
python demo.py --model artifacts/ppo_mixed_dynamic/final_model.zip --scenario mixed_dynamic
```

## 完整过程

```bash
python train.py --scenario static_easy --timesteps 50000
python train.py --scenario static_dense --timesteps 50000
python train.py --scenario mixed_dynamic --timesteps 80000
python train.py --scenario narrow_passage --timesteps 80000
python train.py --scenario dynamic_crossing --timesteps 80000
python train_dqn.py --scenario static_easy --timesteps 50000
python train_dqn.py --scenario static_dense --timesteps 50000
python train_dqn.py --scenario mixed_dynamic --timesteps 80000
python train_dqn.py --scenario narrow_passage --timesteps 80000
python train_dqn.py --scenario dynamic_crossing --timesteps 80000
python compare_training.py --scenario static_easy
python compare_training.py --scenario static_dense
python compare_training.py --scenario mixed_dynamic
python compare_training.py --scenario narrow_passage
python compare_training.py --scenario dynamic_crossing
python evaluate.py --compare-all --episodes 30
python demo.py --algo dqn --model artifacts\dqn_mixed_dynamic\final_model.zip --scenario mixed_dynamic --delay 0.08
python demo.py --model artifacts\ppo_static_easy\final_model.zip --scenario static_easy --delay 0.12
```

- `--scenario`：选择演示场景
- `--delay`：控制动画播放速度
