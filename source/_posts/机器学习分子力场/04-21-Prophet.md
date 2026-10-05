---
title: Prophet：谱分解等变骨干 + 显式自旋，三亿构型的当前榜首
mathjax: true
date: 2026-09-23 09:00:00
tags: [机器学习, 分子力场, 通用势, Prophet, 自旋]
categories: 机器学习分子力场
cover:
---

- [一句话定位](#一句话定位)
- [背景：数据集先验的极限](#背景数据集先验的极限)
- [架构：Multi-Cutoff Spectral Decomposition](#架构multi-cutoff-spectral-decomposition)
- [Prophet-Spin：把自旋变成显式变量](#prophet-spin把自旋变成显式变量)
- [训练数据：ELEMENTA 与三亿构型](#训练数据elementa-与三亿构型)
- [榜单成绩](#榜单成绩)
- [局限与影响](#局限与影响)
- [参考文献](#参考文献)

# 一句话定位

**Prophet（Kairos Materials, 2026）是当前 MatBench Discovery 的榜首**（CPS 0.912），也是首个把"谱分解等变骨干 + 显式自旋变量"放进同一框架的原子级基础模型。它以 62.3M 参数、三亿级构型训练，把对称相对热导率误差压到 0.065——比最强基线再低约 30%。

它代表了一个新方向：**基础模型的"规模"不再只靠堆数据，而是把覆盖维度从"化学空间"扩到"构型分辨率 + 物理自由度（自旋）"。**

# 背景：数据集先验的极限

论文的出发点是一个清醒的观察：**现有通用势的"通用"其实很偏**。训练数据普遍来自已知晶体结构、原型替换和稳定性筛选（MPtrj、Alexandria 都是如此），这带来两个问题：

1. **先验偏置**：模型在"熟悉的化学空间"里越练越熟，但从未见过的新组合、竞争结构附近的分辨率很差；
2. **物理自由度缺失**：同样的原子构型可以有不同的局域磁矩和自旋序，能量、力、热力学行为截然不同——但标准模型把能量写成"原子种类 + 几何"的函数，这个坐标根本没有表示。**无论几何分辨率多高，都救不回来一个模型里不存在的自由度。**

CHGNet 曾用局域磁矩做中间表示（见 {% post_link '机器学习分子力场/04-11-CHGNet' %}），但它的能量仍是"结构条件化"而非"显式自旋条件化"。Prophet 要做的，是把自旋从"副产品"变成"输入变量"。

# 架构：Multi-Cutoff Spectral Decomposition

Prophet 的基础骨干是一个**谱分解的等变图神经网络**。核心思路是 MCSD（Multi-Cutoff Spectral Decomposition，来自其配套工作）：

**邻居聚合本质上是空间滤波**。一个特征加权原子密度 $\varrho$ 通过径向核 $g$ 做卷积：$\hat u_{\text{out}} \simeq \hat\varrho\,\hat g$。如果核的高频响应衰减太快，就会抹掉径向的精细差异。MCSD 用一族不同支撑尺度的径向滤波器线性叠加：

$$g_{\text{eff}}(r)=\sum_k \gamma_k g_k(r),$$

其中 $g_k$ 有自己的径向支撑范围，$\gamma_k$ 是学习到的混合系数。**短尺度滤波器提供精细变化，外层滤波器保留更宽的环境**——类似多分辨率小波。实现上用嵌套截断半径 $c_1<\cdots<c_K$，外层建图、内层各自聚合，每个截断一个独立的等变分支。

关键的正则性设计：

- **截断包络连前两阶导数一起消失**（二阶连续，$C^2$）；
- **径向网络无偏置且 $W(0)=0$**——边离开截断时相互作用平滑归零；
- 力和应力都来自同一个标量能量的梯度（**全程保守力**，公式见论文 Eq. 1）。

结果：能量在截断边界处二阶可导，力和应力由同一个势能面导出——这是它 $\kappa_\text{SRME}$ 极低的架构基础。

# Prophet-Spin：把自旋变成显式变量

磁学部分是 Prophet 最激进的设计。用户通常只知道初始磁矩猜测，而不是自洽收敛的磁态。Prophet-Spin 分两步解决：

**1. 自旋条件化的能量模型**：磁矩幅值 $a_i=|\mathbf S_i|$ 通过高斯编码进初始标量节点与边特征；方向信息走独立的**交换读出（exchange readout）**：

$$E_{\theta_s}^{\text{spin}}(X,\mathbf M)=E_{\text{trunk}}(X,a)+\tfrac12\sum_{(j\to i)} J_{ji}(X,a)\,\mathbf S_j\cdot\mathbf S_i\,f_{\text{ex}}(r_{ji}).$$

关键性质：**固定几何与磁矩幅值时，能量关于自旋方向恰好是双线性的——模型精确退化为经典 Heisenberg 哈密顿量**。于是磁态搜索、大规模自旋模拟成为同一框架的原生推理能力，而不是后处理。

**2. Seed Denoising（种子去噪）恢复头**：用便宜的初始猜测 $\tilde{\mathbf m}_0$ 学一个恢复映射到 DFT 收敛磁矩 $\mathbf m^*$，能量模型冻结不动。这样不需要昂贵的约束 DFT 全程监督，只需要从收敛端点做带噪恢复。

配合时间反演约束（整体翻转所有磁矩能量不变），模型能区分并搜索结构无关模型完全无法触及的磁态：在 188 个未见磁学材料上，能量误差从基线 63-72 meV/atom 降到 19.2 meV/atom（DFT 收敛磁矩）/ 30.7 meV/atom（去噪磁矩）。无需微调即可复现 LiMnAs 反铁磁基态、bcc Fe 的 Curie 转变、铁的压致 bcc→hcp 转变。

# 训练数据：ELEMENTA 与三亿构型

Prophet 在六个一性原理数据集上训练，合计超过 **3 亿标记构型**：

| 数据集 | 规模 | 作用 |
|---|---|---|
| OMat24 | ≈1.08 亿 | 主预训练，宽采样平衡/非平衡几何 |
| ELEMENTA | ≈2.10 亿 | 主预训练，84 元素、随机结构搜索、无原型模板 |
| MPtrj + sAlex | 1.58M + 10.4M | 能量参考对齐 |
| ELEMENTA Vib | >800 万 | 近平衡力/应力细化 |
| ELEMENTA Spin | 470 万 | 磁态监督（DFT 收敛自旋） |

**ELEMENTA 是整条路线的灵魂**：约 190 万还原式、970 万弛豫多形体、跨 84 元素，随机结构搜索生成且不用已知晶体原型作模板，且每个组分配对多个弛豫极小值——直接监督竞争结构的相对能量。这让模型对"竞争相之间的细微能量差"有第一手的监督信号，而非只见过稳定结构。

训练是分阶段推进的：OMat24 预训练 → ELEMENTA 继续预训练（得到 Prophet-OE）→ MPtrj/sAlex 参考对齐（得到 MP 兼容能量标度）→ ELEMENTA Vib 细化（得到登榜的 Prophet-OAME-MBD）。注意：**没有用任何 WBM 标签或榜单信息做训练或选模型。**

# 榜单成绩

在 MatBench Discovery 榜单上（数据截至 2026-09-23）：

| 指标 | Prophet-OAME-MBD |
|---|---|
| CPS | **0.912（榜首）** |
| F1（稳定性分类） | 0.928 |
| 精度 / 召回 | 0.927 / 0.928 |
| 准确率 | 0.978 |
| κSRME | **0.065（榜首）** |
| 能量 MAE | 0.018 eV/atom |
| RMSD | 0.059 |
| 参数 | 62.3M |
| 训练数据 | MPtrj+OMat24+sAlex+ELEMENTA |

三个维度的解读：

1. **$\kappa_\text{SRME}=0.065$ 全场最低**——约比最强基线（TECE 的 0.093）再低 30%，谱分解 + $C^2$ 平滑 + 保守力的组合在声子热导率上拉开了一个身位；
2. **CPS 0.912 综合登顶**，且没有牺牲稳定性分类（F1 0.928，前四）与几何优化（RMSD 0.059，前四）——是"全能型"而不是"偏科型"榜首；
3. **三亿构型 + 62.3M 参数**：数据量比标准 OAM 配方（约 1.13 亿）多出近两倍，但参数只比 eSEN（30M）大两倍——数据驱动的精度红利在这里被完整兑现。

# 局限与影响

局限：

1. **训练数据的可得性**——ELEMENTA 是 Kairos Materials 自建语料（210M 构型），外部团队难以复现；
2. **榜单外性能未知**——目前公开的评估集中在 MatBench Discovery 与其自报磁学任务，OC20/分子域的系统性对比尚未放出；
3. **CMDS 0.578（MD 单项中游）**——大规模动力学稳定性并未随 CPS 登顶而封神，仍属可优化空间。

影响：

1. **把"物理自由度"拉回基础模型议程**——自旋显式化 + Heisenberg 精确退化，让"磁态搜索"成为通用势的原生能力，这是 M3GNet/CHGNet 世代想都不敢想的事；
2. **数据策略的范式转移**——用"无原型模板的随机结构搜索语料"（ELEMENTA）对抗"已知结构的密度堆积"，直接挑战了 MPtrj 一家独大的数据格局（详见 {% post_link '机器学习分子力场/04-01-通用势数据集' %}）；
3. **给"精度-平滑-自旋"三线并进的综合模型立了标杆**——后续 EquFlashV2、Prophet 变体都在这条路上竞争。

# 参考文献

1. Kairos Materials. *Prophet: Scaling Atomistic Foundation Models Across Composition, Configuration, and Spin*. 2026. https://www.kairosmaterials.com/papers/Prophet.pdf
2. Tan, et al. *Multi-Cutoff Spectral Decomposition*（MCSD，配套工作）.
3. Deng, B., et al. *CHGNet as a pretrained universal neural network potential for charge-informed atomistic modelling*. arXiv:2302.14231（自旋/电荷感知的先行者）.
