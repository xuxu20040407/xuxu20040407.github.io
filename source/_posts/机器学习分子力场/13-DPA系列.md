---
title: DPA系列：从注意力势到大模型时代的精度-成本前沿
mathjax: true
date: 2026-08-30 10:00:00
tags: [机器学习, 分子力场, 通用势, DPA]
categories: 机器学习分子力场
cover:
---

- [引言：一条贯穿四代的演进线](#引言一条贯穿四代的演进线)
- [DPA-1：注意力机制的试水（2022）](#dpa-1注意力机制的试水2022)
- [DPA-2：双网络架构（2024）](#dpa-2双网络架构2024)
- [DPA-3：LiGS与Scaling Law（2025/2026）](#dpa-3ligs与scaling-law20252026)
- [DPA-4：EMFA SO(2)卷积与机器精度等变（2026）](#dpa-4emfa-so2卷积与机器精度等变2026)
- [DPA-4 vs eSEN：两条平滑路线的对决](#dpa-4-vs-esen两条平滑路线的对决)
- [DPA-4的训练栈：HybridMuon + WSD](#dpa-4的训练栈hybridmuon--wsd)
- [参考](#参考)

# 引言：一条贯穿四代的演进线

DPA（Deep Potential for All）是 DeepModeling / AI for Science Institute / DP Technology 推出的通用原子势家族，目标是"一个模型覆盖元素周期表"。从 DPA-1 到 DPA-4，这条线展现了清晰的演进逻辑：

| 代 | 年份 | 核心贡献 | 关键词 |
|---|---|---|---|
| DPA-1 | 2022 | 注意力机制试水，初步通用 | attention, pretraining |
| DPA-2 | 2024 | 双网络架构，多源数据 | summary + fitting |
| DPA-3 | 2025/26 | LiGS 线图级数，Scaling Law | line graph, scaling |
| DPA-4 | 2026 | EMFA 卷积 + WBN，精度-成本前沿 | SO(2), Wigner, ZBL |

前三代把 DPA 从"能用"推向"通用"；DPA-4 则在精度、速度、平滑性三个维度同时登顶——尤其是它用纯保守训练击败了 eSEN 的"直接力预训练拐杖"路线，这条对比值得单独讲透。

# DPA-1：注意力机制的试水（2022）

DPA-1 首次把注意力机制引入 Deep Potential 框架，用自注意力建模原子间的远程关联，在 56 种元素的 MP 数据上预训练出初步的通用模型。它的意义在于证明了"注意力+预训练"这条路线可行——为后续的架构升级奠定了范式基础。这一代模型在今天看精度有限，更多是路线验证。

# DPA-2：双网络架构（2024）

DPA-2 的核心创新是**双网络 + 多任务学习**：一个"汇总网络"（summary network）学习整个体系的平均物理（整体的排斥/吸引基线），一个"拟合网络"（fitting network）只学残差修正。这样做的直接收益是**可迁移性**——拟合网络的任务从"从头学整个势能面"简化为"学小残差"，对陌生元素体系的迁移更鲁棒。DPA-2 把自己定位为**大原子模型（LAM）的原型**，在多学科数据上用多任务方式预训练，再通过微调和蒸馏适配下游任务。它在多种数据源（晶体、表面、团簇、分子）上联合训练，把 DPA 从"材料通用"推向"跨域通用"。

# DPA-3：LiGS与Scaling Law（2025/2026）

DPA-3（Duo Zhang et al., arXiv:2506.01686, "A Graph Neural Network for the Era of Large Atomistic Models"）是为大原子模型（LAM）时代设计的架构，三大贡献：

**1. LiGS（Line Graph Series）线图级数**。对原子图 $G^{(1)}$ 递归做线图变换，得到 $G^{(2)}, G^{(3)}, \dots$：

| 阶 | 顶点对应 | 几何实体 |
|---|---|---|
| $G^{(1)}$ | 原子 | 原子本身 |
| $G^{(2)}$ | 键（原子对） | 两体距离 |
| $G^{(3)}$ | 角（三体） | 键角 |
| $G^{(4)}$ | 二面角（四体） | 二面角 |

关键：$G^{(k)}$ 的顶点特征 = $G^{(k-1)}$ 的边特征，消息在相邻图上互相传递。消融显示 $K=2$（到键角为止）最优——二面角（$K=3$）信息冗余且训练更慢。这让 DPA-3 能**显式编码高阶几何结构**，而非靠等变表示的隐式耦合。

**2. Scaling Law**。在 OMat24 上验证了模型参数、数据量、计算预算三者的幂律——**加层不退化**（得益于 SiLUT 激活 + 残差更新，可堆到 24 层不出 oversmoothing）。这是"同数据下把信息榨得更干"的基础。

**3. 数据集编码**。用 one-hot 标识训练数据集，拼进描述符后再进拟合头——多任务训练多个数据集时不增加拟合头数量，开销不随数据集数增长。DPA-3.1-3M（OpenLAM-v1，31 个数据集，128 GPU×400 万步）在此框架下训练，在 12 个下游任务的 zero-shot 力场预测上取得最低平均误差。

# DPA-4：EMFA SO(2)卷积与机器精度等变（2026）

DPA-4（Tiancheng Li et al., arXiv:2606.02419, "DPA4: Pushing the Accuracy-Cost Frontier of Interatomic Potentials with EMFA SO(2) Convolution"）是这条线的集大成者。它跨越 0.48M 到 25M 六个规模档，核心架构创新有四项：

**A1. 低秩边-节点 SO(2) 等变阶耦合**。eSCN 把 SO(3) 卷积降到边局部 SO(2) 后，边特征只对角调制节点（第 $l$ 阶边只乘第 $l$ 阶节点）；DPA-4 用低秩分解让**每条边的每个角动量阶都耦合所有节点阶**——把 eSCN 丢掉的那些跨阶耦合捡了回来，找回表达力。这正是 eSCN 那个"稀疏化"动作的代价补偿（见 {% post_link '机器学习分子力场/07-eSCN' %}）。

**A2. Multi-Focus 消息非线性**。把隐藏宽度切成 $F$ 条并行 focus 流，各自过独立的 SO(2) 栈，再经跨 focus softmax 竞争加权——用更少参数达到单 focus 基线的精度。

**A3. 包络门控注意力**。聚合邻居消息时用 $l=0$ 标量片算注意力权重，配合截断包络让边贡献在 $r_{ij}\to r_c$ 时 $C^3$ 平滑归零。

**A4. Wigner 双线性网络（WBN）**。等变 FFN 的实现方式：把节点特征展开为 SO(3) 旋转群上的两个标量函数、逐点相乘、再投影回不可约系数。一个乘法耦合所有角动量阶，无需枚举 CG 耦合路径、无需存储 CG 表。积分用 **Lebedev 正交**（74 点 × 4 角度 = 296 采样/原子），等变误差降到 $10^{-14}$（机器精度），而 Equiformer 的经纬网格只有 $10^{-6}$。保留 $k_{\max}=1$ 帧，重新打开了奇宇称耦合（如叉积 $\vec r_1\times\vec r_2$，这是 $k=0$ 纯球谐做不到的）。

在这四项之上，DPA-4 还解决了一个此前所有模型绕开的问题——**近距物理**。

## ZBL 原生桥接：消灭"切换力"

DPA-4 把能量分解为解析分支 + 学习分支：

$$E = E_\Theta^{\text{NN}} + E^{\text{ZBL}},\qquad E_{ij}^{\text{ZBL}}(r) = \frac{k_e Z_i Z_j}{r}\,\Phi(r/a_{ij})$$

其中 $E^{\text{ZBL}}$ 是 Ziegler-Biersack-Littmark 屏蔽库仑对势（高能辐照、近距碰撞场景的物理正确形式）。传统做法是后验把 ZBL 拼到能量上，但坐标依赖的 splice 权重会引入一个"切换力"（正比于两分支能量差，没有物理对应）。DPA-4 的解法是**原生桥接**：

- **clamped distance** $\tilde r(r)$：当 $r < r_{\text{in}}$ 时 $\tilde r$ 冻结为常数，学习分支对 $r$ 无梯度；
- **source-freeze gate** $\eta_j$：邻居进入内区时，该邻居发出的消息被平滑冻结。

结果是内区纯 ZBL 力、外区纯学习力、桥接区无伪影切换力——C–Si 双原子扫描证实了这一点。这层处理让 DPA-4 既能做常规 MD，也能做辐照损伤、近距碰撞模拟。

## 纯保守训练：不需要直接力预训练拐杖

eSEN 用"直接力预训练 60 ep → 保守微调 40 ep"绕开 double-backward 的高成本；DPA-4 的回应是**让保守训练本身变快**：用 torch.compile 编译 force-loss 的双重反向传播路径，得到 3.1× 训练加速、峰值显存降到 FP32 基线的 40%。于是全部 DPA-4 变体**只用保守能量梯度路径训练，不用 DeNS、不用直接力预训练**——架构够好，就不需要拐杖。

# DPA-4 vs eSEN：两条平滑路线的对决

eSEN 与 DPA-4 是当前"平滑 + 保守"路线的两个代表，但策略截然不同：

| 维度 | eSEN | DPA-4 |
|---|---|---|
| 平滑阶数 | $C^2$（多项式包络） | **$C^3$**（septic Hermite 包络 $s_5, s_7$ + 桥接窗口 $h_c, h_w$） |
| 力的来源 | 保守（微调后） | 保守（全程） |
| 训练协议 | 直接力预训练 60ep → 保守微调 40ep | **纯保守训练**（torch.compile 加速 3.1×） |
| 去噪辅助 | DeNS | 无 |
| 非线性 | SiLU 等变 Gated（球谐空间） | **Wigner 双线性网络**（机器精度等变） |
| 近距物理 | 无专门处理 | **ZBL 原生桥接** |
| 优化器 | AdamW + cosine | **HybridMuon + WSD** |

**$\kappa_\text{SRME}$（热导率误差，越低越好）是这场对决的裁判**——它衡量声子热导率预测，对势能面的平滑性和保守性极其敏感：

| 模型 | $\kappa_\text{SRME}$↓ | CPS↑ | 参数 | 训练算力(GPU-day) | DeNS |
|---|---|---|---|---|---|
| **DPA4-Pro** | **0.227** | **0.842** | 25.2M | 233 | ✗ |
| DPA4-Plus | 0.240 | 0.829 | 8.8M | 31 | ✗ |
| DPA4-Air | 0.267 | 0.816 | 5.1M | 16 | ✗ |
| EquiformerV3+DeNS | 0.275 | 0.830 | 30.3M | 157 | ✓ |
| **eSEN-30M-MP** | 0.340 | 0.797 | 30.1M | 335 | ✓ |
| DPA4-Neo | 0.353 | 0.782 | 1.1M | 8.6 | ✗ |
| eqV2-S-DeNS（直接力） | 1.676 | 0.522 | 31.2M | 228 | ✓ |
| Orb v2（直接力） | 1.726 | 0.470 | 25.2M | — | ✗ |

几个值得咀嚼的点：

1. **DPA4-Pro 用更少参数、更少算力、不靠预训练，$\kappa_\text{SRME}$ 反而比 eSEN 低 33%**——说明 $C^3$ 平滑 + 机器精度等变带来的收益，超过了"直接力预训练 + $C^2$ 平滑"的组合。
2. **DPA4-Plus（8.8M）只用一个零头算力（31 GPU-day）就追平了 EquiformerV3+DeNS（0.240 vs 0.275）**——架构红利被放大了。
3. **直接力模型（eqV2、Orb）的 $\kappa_\text{SRME}$ 是保守模型的 5-7 倍**——再次印证 eSEN 论文的核心论点：test MAE 好 ≠ 物理好。三阶力常数靠有限差分，直接力在小位移下的力噪声直接毁掉声子。
4. **DPA4 的 C–Si 双原子近距扫描与声子验证**证实：$C^3$ 平滑让四阶导数也连续（声子-声子散射的关联量），这是 $C^2$ 的 eSEN 不具备的额外保障。

# DPA-4的训练栈：HybridMuon + WSD

DPA-4 的训练配置恰好是我们前两章（{% post_link '机器学习分子力场/11-优化器' %} 与 {% post_link '机器学习分子力场/12-调度器' %}）讲的两件套的落地实践：

**HybridMuon 优化器**：
- **矩阵参数走 Muon**：Nesterov 动量 + Newton-Schulz 极化迭代（8 次快迭代 $a,b,c=(3.4445,-4.7750,2.0315)$ + 2 次 Newton 抛光），更新 RMS 对齐到 $\gamma=0.18$（正是上一章说的"RMS 对齐到 Adam 尺度"）；
- **slice mode**：等变张量的 leading 维按不可约表示的度/阶切块，每块独立做 Muon，避免把不同表示层混进一个大矩阵；
- **标量/归一化/1D 参数走 AdamW**：这正是 ch11 的"混合方案"铁律——Muon 只管 2D 矩阵，1D 参数留 Adam 家族；
- **Magma-lite 阻尼**：按动量对齐度对 Muon 更新做连续阻尼（而非随机跳过），下限 $s_{\min}=0.1$ 防止块被冻结——这是对 Muon 在等变场景下梯度块间方差大的适配。

**WSD 学习率调度**：warmup → stable（常数 lr，主阶段）→ cosine decay（末尾）。消融显示 WSD 比全程 cosine 的能源和力 MAE 都更低——因为稳定期保持全速探索、末尾短促衰减压住振荡。这正是 ch12 里 WSD 那条曲线的工业验证。

**一句话**：DPA-4 把我们博客讲的"先进优化器（Muon/HybridMuon）+ 先进调度（WSD）"完整落地，并证明它们能实打实提高精度。当预条件够强、调度够巧时，连"直接力预训练"这个行业拐杖都可以扔掉。

# 参考

1. Zhang, D., Bi, H., Dai, F.-Z. et al. *DPA-1: Pretraining of Attention-based Deep Potential Model for Molecular Simulation*. arXiv:2208.08236, 2022.
2. Zhang, D., Liu, X., Zhang, X. et al. *DPA-2: a large atomic model as a multi-task learner*. arXiv:2312.15492, 2023; npj Comput. Mater. 10, 293 (2024).
3. Zhang, D., Peng, A., Cai, C. et al. *A Graph Neural Network for the Era of Large Atomistic Models* (DPA-3). arXiv:2506.01686, 2025/2026.
4. Li, T., Li, W., Peng, A. et al. *DPA4: Pushing the Accuracy-Cost Frontier of Interatomic Potentials with EMFA SO(2) Convolution*. arXiv:2606.02419, 2026.
5. Fu, X. et al. *Learning Smooth and Expressive Interatomic Potentials for Physical Property Prediction* (eSEN). arXiv:2502.12147, 2025.
6. Ziegler, J. F., Biersack, J. P. & Littmark, U. *The Stopping and Range of Ions in Solids*. Pergamon, 1985.
