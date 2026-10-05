---
title: Equiformer系列：等变Transformer的三级跳
mathjax: true
date: 2026-08-24 12:30:00
tags: [机器学习, 分子力场, 等变网络, Transformer]
categories: 机器学习分子力场
cover:
---

- [引言](#引言)
- [Equiformer v1：等变注意力的可行性](#equiformer-v1等变注意力的可行性)
- [EquiformerV2：eSCN卷积与大规模化](#equiformerv2escn卷积与大规模化)
- [EquiformerV3：工程优化收官](#equiformerv3工程优化收官)
- [系列的意义](#系列的意义)

# 引言

NequIP、MACE这一脉是"卷积路线"的等变网络。与此同时，Meta FAIR的Liao和Smidt等人沿着"注意力路线"走出了一条平行线：把Transformer的架构红利（全局信息流、易扩展、成熟的基础设施）嫁接到$E(3)$等变性上。这个系列跨越四年，恰好对应了等变网络从概念验证到大模型底座的三个阶段。

# Equiformer v1：等变注意力的可行性

Equiformer（ICLR 2023）要回答的问题是：**标准Transformer的核心机制——自注意力——能否在等变约束下存活？**

困难在于，注意力的灵魂是内积打分：

$$\alpha_{ij}=\mathrm{softmax}\left(\frac{q_i\cdot k_j}{\sqrt{d}}\right)$$

但两个irrep特征的内积并不天然等变——不同阶分量之间的点积没有良定义的群作用。Equiformer的解法是用**张量积替代点积**来生成注意力分数：query与key先做CG耦合得到$l=0$的不变标量，再过softmax：

$$\alpha_{ij}=\mathrm{softmax}\left(\sum_l \phi_l\left[\left(q_i^{(l)}\otimes k_j^{(l)}\right)^{(0)}\right]\right)$$

注意力权重是不变标量，value路径保持等变，于是整个注意力层严格等变。配套地，文章还提出了可分离的层归一化和非线性（对每个irrep通道独立操作），以及SO(2)线性化的加速技巧。

v1在QM9、MD17上验证了等变Transformer不输卷积路线，并在OC20 S2EF任务上首次展示了该路线的可扩展性。但它的计算瓶颈也暴露无遗：稠密的SO(3)卷积/张量积使得$l_{\max}$被限制在2左右——再高就算不动了。

# EquiformerV2：eSCN卷积与大规模化

EquiformerV2（ICLR 2024）是系列的爆发点，而它的核心武器来自另一篇文章：Zitnick组的eSCN卷积。

**eSCN的思想**值得在这里展开。观察CG系数矩阵的结构：若先把坐标系旋转到使键方向沿$z$轴（所谓规范对齐，gauge alignment），则$m\neq 0$与$m'\neq 0$之间的耦合块全部为零——利用球谐函数绕$z$轴旋转时的简单相位结构，稠密的$(2l_1+1)\times(2l_2+1)$耦合矩阵坍缩成稀疏的分块结构，非零元素只剩$m'=m+m''$型的一条带。配合显式的稀疏乘法实现，同样精度的计算量可以下降一到两个数量级。于是$l_{\max}=8$从奢望变成了日常配置。

EquiformerV2在此之上做了三项适配：

1. **用eSCN卷积替换SO(3)卷积**作为注意力消息函数，支撑起高阶球谐；
2. **注意力重归一化**（attention re-normalization）：修正高阶通道上softmax的尺度失衡；
3. **可分离S²激活与可分离层归一化**：把激活和归一化搬到球面上逐点进行再变换回来，避免破坏等变性的同时增强表达力。

效果立竿见影：OC20 S2EF榜单上力误差较此前最优降低约15%、能量约4%，吸附能预测所需的DFT校验计算量减半；IS2RE任务同样登顶。EquiformerV2由此成为2023-2025年间催化领域事实上的基准架构，也是OMat24、OMol25等通用数据集论文的默认评测骨干之一。

# EquiformerV3：工程优化收官

EquiformerV3（2026, arXiv:2604.09130）没有引入激进的算法创新，而是做了一轮彻底的系统工程：

- **算子融合与内核优化**，训练吞吐提升1.75倍；
- **等变合并层归一化**（merged layer norm）：把跨irrep通道的归一化合并为单次kernel调用；
- **SwiGLU-S²激活**：把LLM社区验证过的SwiGLU门控结构搬进球面激活框架；
- **平滑截断注意力**（smooth radius cutoff attention）：消除截断半径处的能量不连续；
- **DeNS辅助任务**（denoising non-equivalent structures）：以去噪方式监督高阶特征，改善数据效率。

成绩单：OC20、OMat24、MatBench Discovery三个战场同时SOTA，MatBench Discovery上F1达到0.931（+DeNS配方），力误差进入0.018 eV/Å量级。截至写作时它仍稳居综合榜首梯队（榜首TECE、EquFlashV2与其差距在千分位）。关于这些榜单的含义见 {% post_link '机器学习分子力场/04-02-通用势benchmark' %} 。

# 系列的意义

回头看这三级跳：v1证明了等变注意力可行，V2解决了可扩展性并统治催化榜单，V3完成了大模型时代的工程闭环。Equiformer系列的价值在于示范了一条与MACE不同的路线：**不追求单步表达力的极限，而是押注架构通用性与基础设施红利**——事实证明，在大数据时代，后者同样是通往SOTA的大道。
