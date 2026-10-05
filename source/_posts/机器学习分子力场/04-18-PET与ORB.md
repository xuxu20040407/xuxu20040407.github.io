---
title: PET 与 ORB：放弃等变约束的非等变路线
mathjax: true
date: 2026-08-30 17:00:00
tags: [机器学习, 分子力场, 通用势, PET, ORB]
categories: 机器学习分子力场
cover:
---

- [一句话定位](#一句话定位)
- [非等变路线的赌注](#非等变路线的赌注)
- [PET：Point Edge Transformer](#petpoint-edge-transformer)
- [ORB：大规模数据 + 旋转增广](#orb大规模数据--旋转增广)
- [榜单成绩](#榜单成绩)
- [成功还是失败？](#成功还是失败)
- [参考文献](#参考文献)

# 一句话定位

**PET 和 ORB 是通用势里最"离经叛道"的一支——它们完全放弃显式等变约束，用纯 Transformer 直接处理点云，靠大规模数据和随机旋转增广隐式满足对称性**。结果证明了等变性是充分条件而非必要条件。

# 非等变路线的赌注

从 {% post_link '机器学习分子力场/02-等变神经网络' %} 以来，MLIP 社区的主流信念是：等变架构因内建对称性而数据高效。PET/ORB 的赌注是：**这个"数据高效"的优势可以被"数据管够 + 简单架构"抵消**——与其维护复杂的 CG 张量积，不如上更大规模的纯 Transformer。

这和视觉领域"ViT 战胜卷积的归纳偏置"是同一个剧本。

# PET：Point Edge Transformer

**PET**（EPFL, lab-cosmo）把等变消息传递的"卷积"替换成 Transformer 的注意力，但保留了点-边（point-edge）混合图结构：

- **点**：原子；
- **边**：键/近邻；
- **注意力**：标准 self-attention，用方向信息作为特征而非约束。

它最激进的地方在于规模：**PET-OAM-XL 用了 730M 参数**——几乎是头部等变模型的 10 倍。这既是它的特色也是它的命门。

# ORB：大规模数据 + 旋转增广

**ORB**（Orbital Materials）走得更纯粹：用等变风格之外的自定义 GNN/Transformer，靠**在训练中随机旋转所有结构**让模型见过各种姿态，从而隐式学会旋转不变。它的训练数据是 MPtrj + Alexandria + OMat24 的合并集。

ORB v3 以 25.5M 参数拿到 0.860 CPS，参数效率远好于 PET，证明"旋转增广 + 非等变架构"在中等规模下也成立。

# 榜单成绩

在 MatBench Discovery 榜单上（数据截至 2026-09-23）：

| 模型 | CPS | F1 | κSRME | 参数 | 训练数据 |
|---|---|---|---|---|---|
| PET-OAM-XL | 0.898 | 0.924 | 0.119 | 730M | MPtrj+OMat24+sAlex |
| ORB v3 | 0.860 | 0.905 | 0.210 | 25.5M | MPtrj+Alex+OMat24 |

# 成功还是失败？

两个角度都说得通：

**说成功**：PET-OAM-XL 挤进 CPS 前十，ORB v3 稳居中上——**在不写一行等变代码的情况下达到等变模型的精度**，这本身就是对"等变必须"论点的重击。ORB 还在 ORB-1/2 时代就证明了非等变模型能上榜。

**说失败**：PET 的参数效率惨不忍睹（730M 参数换 0.898，而 GRACE-3L 用 42.1M 就拿到 0.900）；ORB 的力质量（κSRME 0.210）明显不如同规模的保守力等变模型。**非等变路线的"成功"依赖超大规模数据与算力，这条路在等变模型不断提效的背景下逐渐失去性价比。**

结论：非等变路线证明了理论的"必要性问题"（等变不是必要的），但在工程上的性价比之争中，它并没有赢。

# 参考文献

1. *PET: Point Edge Transformer for machine-learning interatomic potentials*. Nat. Commun. 16 (2025). (OAM 榜单版见 MatBench Discovery 条目.)
2. Ashiotis, G., et al. *ORB: A Fast, Scalable Neural Network Potential* (ORB v2/v3). arXiv:2410.22570 (v2), arXiv:2504.06231 (v3), 2024/2025.
