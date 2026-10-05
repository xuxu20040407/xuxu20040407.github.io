---
title: GRACE / TACE / TECE：等变 ACE 系与高阶张量积系
mathjax: true
date: 2026-08-30 16:00:00
tags: [机器学习, 分子力场, 通用势, GRACE, TACE]
categories: 机器学习分子力场
cover:
---

- [一句话定位](#一句话定位)
- [GRACE：把CG张量积换成可学习基函数](#grace把cg张量积换成可学习基函数)
- [TACE：高阶张量积的正统进化](#tace高阶张量积的正统进化)
- [TECE：加入旋转不变注意力的集大成者](#tece加入旋转不变注意力的集大成者)
- [榜单成绩](#榜单成绩)
- [三者的技术脉络](#三者的技术脉络)
- [参考文献](#参考文献)

# 一句话定位

**GRACE / TACE / TECE 是德国鲁尔大学 Bochum（ICAMS, Drautz 组）与中国上海科技大学（Zemin Zhang）分别在"等变 + ACE"两条子路线上打出的组合拳**：GRACE 用可学习基函数把推理做快，TACE 用高阶张量积把精度做高，TECE 再把旋转不变注意力加进来冲刺榜首。

# GRACE：把CG张量积换成可学习基函数

**GRACE（Graph-based ACE）** 的核心洞见：等变网络的精度瓶颈不在"等变"，而在 CG 张量积的昂贵。它做了两件事：

1. **用 ACE（原子簇展开）的可学习径向基函数**替代球谐张量积——等价于在 ACE 框架内引入等变基函数，保持等变性的同时把计算复杂度降下来；
2. **多层堆叠**（GRACE-1L/2L/3L），把 ACE 的单层描述扩展为可堆叠的深度网络。

结果：推理速度比同精度等变模型快数倍，参数量却极小（GRACE-1L 仅 3.45M 参数、GRACE-3L-OAM-L 42.1M 参数）。GRACE 长期霸榜"性价比之王"。

# TACE：高阶张量积的正统进化

**TACE（Tensor-based ACE）** 走的是另一条路：坚持显式的高阶张量积（球谐张量积 + CG 耦合），通过**张量化**（把大参数矩阵分解成若干低秩张量因子）来控制计算和参数量。它用 82.9M 参数拿到 0.889 CPS。

TACE 与 GRACE 的对比是"精度 vs 速度"的经典权衡：

| 模型 | CPS | 参数 | 路线 |
|---|---|---|---|
| GRACE-1L-OAM | 0.761 | 3.45M | 快而小 |
| GRACE-2L-OAM | 0.837 | 12.6M | 均衡 |
| GRACE-2L-OAM-L | 0.865 | 26.4M | 均衡+ |
| GRACE-3L-OAM-L | 0.900 | 42.1M | 快而准 |
| TACE-OAM-L | 0.889 | 82.9M | 高精度正统 |

# TECE：加入旋转不变注意力的集大成者

**TECE（Tensor Equivariant transformer with Compression-Expansion? / 或 Tensorized Equivariant Convolution...）** 是这条线的最新进化，arXiv:2607.10664。它在张量等变框架内引入**旋转不变注意力**（对 $l=0$ 标量片做注意力加权，类似 DPA-4 的包络门控注意力思想），配合超大数据量（OAM 配方 + 额外数据），以 222M 参数拿到 0.908 CPS——曾长期占据榜首梯队。

TECE-OAM-RRA-1.0 的关键指标：CPS 0.908、F1 0.929、**κSRME 0.093（力质量达到 eSEN 的一半）**、RMSD 0.058。它在"精度-力质量-结构弛豫"三个维度同时登顶，是 2026 年综合最强者之一。

# 榜单成绩

在 MatBench Discovery 榜单上（数据截至 2026-09-23）：

| 模型 | CPS | F1 | κSRME | 参数 | 训练数据 |
|---|---|---|---|---|---|
| TECE-OAM-RRA-1.0 | 0.908 | 0.929 | 0.093 | 222M | MPtrj+OMat24+sAlex |
| GRACE-3L-OAM-L | 0.900 | 0.925 | 0.121 | 42.1M | MPtrj+OMat24+sAlex |
| TACE-OAM-L | 0.889 | 0.910 | 0.126 | 82.9M | MPtrj+OMat24+sAlex |
| GRACE-2L-OAM-L | 0.865 | 0.883 | 0.169 | 26.4M | MPtrj+OMat24+sAlex |
| GRACE-2L-OAM | 0.837 | 0.880 | 0.294 | 12.6M | MPtrj+OMat24+sAlex |

注意：GRACE/TACE 系列清一色使用 OAM 配方（MPtrj+OMat24+sAlex），**没有用更大的专有数据就挤进头部**——这是"算子效率 + 数据配方"双优的范例。

# 三者的技术脉络

从理论源头看，这条线可以追溯到 **ACE（原子簇展开）** 与 Drautz 组的 **MTP（矩张量势）** 传统——德国学派从手工描述符时代就深耕"以张量/簇展开显式编码多体关联"的思路。GRACE/TACE/TECE 是把这套哲学带进深度等变网络：

1. **GRACE**：ACE 基函数 + 深度网络 = 快；
2. **TACE**：显式张量积 + 低秩张量化 = 准；
3. **TECE**：+ 旋转不变注意力 = 又快又准。

这条线与 {% post_link '机器学习分子力场/02-03-MACE' %} 的 ACE 思想一脉相承，可以对照阅读。

# 参考文献

1. Bochkarev, A., Lysogorskiy, Y., Sarhangi, S. M., Drautz, R. *Graph Neural Networks with Learnable and Customizable Radial Basis Functions* (GRACE). Phys. Rev. X 14, 021036 (2024). arXiv:2303.11467.
2. Bochkarev, A., et al. *GRACE-2L / GRACE-3L: Scaling Graph-based ACE to Large Foundation Models*. arXiv:2508.17936, 2025.
3. Zhang, Z., et al. *TACE: Tensorized Graph-based ACE...*. arXiv:2509.14961, 2025.
4. Zhang, Z., et al. *TECE: ... Rotation-Invariant Attention for Tensor Equivariant Potentials*. arXiv:2607.10664, 2026.
