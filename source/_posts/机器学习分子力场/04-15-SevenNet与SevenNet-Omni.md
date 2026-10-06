---
title: SevenNet 与 SevenNet-Omni：从 MPtrj 到 COSMOS 数据配方
mathjax: true
date: 2026-08-30 13:00:00
tags: [机器学习, 分子力场, 通用势, SevenNet, COSMOS]
categories: 机器学习分子力场
cover:
---

- [一句话定位](#一句话定位)
- [SevenNet：NequIP的并行化改造](#sevennetnequip的并行化改造)
- [COSMOS 数据集：十五库合一](#cosmos-数据集十五库合一)
- [Omni：多任务 + 数据整合时代](#omni多任务--数据整合时代)
- [榜单成绩](#榜单成绩)
- [局限与影响](#局限与影响)
- [参考文献](#参考文献)

# 一句话定位

**SevenNet-Omni 是"超大整合数据集 + 多任务训练"配方的第一个成功案例**——它用 COSMOS 数据集（十五库合一、2.43 亿构型）训出 CPS 0.873 的通用势，宣告了数据整合时代的到来。

# SevenNet：NequIP的并行化改造

SevenNet（arXiv:2402.03789）是韩国首尔国立大学（MDIL, Park 组）对 {% post_link '机器学习分子力场/02-01-NequIP' %} 的工程化改造：

- 保留 NequIP 的等变消息传递核心；
- 重写实现，针对**多 GPU 大规模并行**做了优化（工业级数据加载、分布式训练）；
- 主打"GPU 集群上跑百万原子 MD"。

它最初的模型 SevenNet-l3i5 用 MPtrj 训练，在 2024 年底就以 1.17M 参数的极致规模拿到 CPS 0.714，展示了参数效率。

# COSMOS 数据集：十五库合一

真正让 SevenNet 封神的是它背后的 **COSMOS 数据集**（详见 {% post_link '机器学习分子力场/04-01-通用势数据集' %} ）：KAIST + SNU 整合了 MPtrj、Alexandria、OMat24、OC20、MatterSim 等十五个公开库，去重清洗后得到 **2.43 亿构型**——比任何单一数据集都大一个量级。

这个数据集本身就是一个产品：它回答了"为什么单个库里总差一口气"——因为化学空间被割裂（晶体归晶体、分子归分子）。COSMOS 想用一个库吃下全部。

# Omni：多任务 + 数据整合时代

**SevenNet-Omni**（arXiv:2510.11241）在 COSMOS 上做多任务训练：

- **多任务**：能量、力、应力、磁矩等多个物理量联合监督；
- **整合**：15 个库的异构标签（不同理论水平）统一处理；
- **规模**：54.9M 参数（i12 版本），是 SevenNet 家族迄今最大。

它是"COSMOS 配方"的第一个完整成功案例——不是简单堆数据，而是证明了**跨库整合 + 多任务学习**可以同时吃下晶体、表面、分子、界面，且不偏科。

# 榜单成绩

在 MatBench Discovery 榜单上（数据截至 2026-09-23）：

| 指标 | SevenNet-Omni-i12 |
|---|---|
| CPS | 0.873 |
| F1（稳定性分类） | 0.906 |
| κSRME | 0.192 |
| 参数 | 54.9M |
| 训练数据 | COSMOSDataset（2.43亿构型） |

注意它的训练数据列与其他头部模型（OAM 配方）完全不同——它是**唯一靠专有整合数据集而非标准三件套**进入 Top12 的模型。这从另一个角度印证了 {% post_link '机器学习分子力场/04-02-通用势benchmark' %} 的观察：数据的贡献已经超过架构。

# 局限与影响

局限：

1. **数据整合的标签异构**——十五库的理论水平参差（PBE/r2SCAN/ωB97M-V 混杂），多任务学习如何对齐仍是个开放问题；
2. **54.9M 参数的精度上限**——头部 200M+ 模型更高；
3. **COSMOS 数据集未完全公开**——复现门槛较高。

影响：

1. **证明"数据整合"是通用势的下一个战场**——此后大量团队转向构建更大的整合库；
2. **为大规模 MD 提供了可靠底座**——SevenNet 家族在 GPU 集群场景的工程优势显著；
3. **"十五库合一"思路**被多家后继工作（如未来专有整合模型）继承。

# 参考文献

1. Park, Y., et al. *SevenNet: A Universal Parallel Neural Network Potential...*. arXiv:2402.03789, 2024.
2. Park, J., et al. *SevenNet-Omni: Integrating Fifteen Public Databases for a Universal Omni-modal Potential*. arXiv:2510.11241, 2025.
3. Park, J., et al. *COSMOS: A 0.243 billion-structure database...*. 见 {% post_link '机器学习分子力场/04-01-通用势数据集' %} 引用。
