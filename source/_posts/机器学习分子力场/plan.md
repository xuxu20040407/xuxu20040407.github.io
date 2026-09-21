# 机器学习分子力场 (Machine Learning Interatomic Potentials)

## 领域概述

机器学习分子力场（MLIP）是利用机器学习方法从第一性原理计算数据中学习原子间相互作用势能面，从而实现兼具量子力学精度和经典力场效率的分子模拟技术。

## 专栏框架

按以下主线组织：**消息传递框架提出 → 不变神经网络 → 等变神经网络 → 通用大模型 → EGNN之外其他框架**

### 文章列表

| 文件 | 内容 | 状态 |
|------|------|------|
| `00-机器学习分子力场综述.md` | 总览：精度-效率困境、发展脉络、全系列导航（含post_link软链接） | ✅ 已完成 |
| `01-不变神经网络.md` | SchNet / PhysNet / DimeNet / GemNet 整合篇 | ✅ 已完成 |
| `02-等变神经网络.md` | 小综述：E(3)群、irreps、球谐函数、CG张量积、发展简史 | ✅ 已完成 |
| `03-NequIP.md` | 等变消息传递开山之作，样本效率数量级提升 | ✅ 已完成 |
| `04-Allegro.md` | strictly-local架构，亿原子级模拟 | ✅ 已完成 |
| `05-MACE.md` | 高阶等变消息传递 + ACE + 对称收缩算子 | ✅ 已完成 |
| `06-Equiformer系列.md` | v1等变注意力 → V2 eSCN大规模化 → V3工程收官 | ✅ 已完成 |
| `07-eSCN.md` | eSCN稀疏卷积解决高阶SO(3)瓶颈（SO(3)→SO(2)降维） | ✅ 已完成 |
| `07-eSEN.md` | eSEN平滑能量网络：四层平滑防线、直接力vs保守力、κ_SRME | ✅ 已完成 |
| `08-通用势数据集.md` | MPtrj / OC20 / Alexandria(sAlex) / OMat24 / MatterSim / OMol25 / COSMOS | ✅ 已完成 |
| `09-通用势benchmark.md` | MatBench Discovery（WBM/F1/DAF/CPS）与OC20排行榜 | ✅ 已完成 |
| `10-通用势模型.md` | M3GNet/CHGNet/MACE-MP-0 → GRACE/PET/ORB/DPA/SevenNet → UMA；选型指南 | ✅ 已完成 |
| `11-优化器.md` | SGD/动量→AdamW→Shampoo/Muon/SOAP/SOAP-Muon公式推导 + numpy可视化实验 + 预条件阶梯统一视角 + 水与CDP训练实证 | ✅ 已完成 |
| `12-调度器.md` | 学习率调度族（常数/阶梯/线性/余弦/预热/WSD）+ 噪声地板 + Road Less Scheduled（线性=迭代平均）+ schedule-free + 调度器×优化器耦合 + numpy实验 | ✅ 已完成 |
| `13-DPA系列.md` | DPA-1/2/3/4 演进：LiGS+Scaling Law → EMFA SO(2)+WBN+ZBL桥接+C³平滑+HybridMuon+WSD，与eSEN的κ_SRME对决 | ✅ 已完成 |

### 软链接格式

文章间引用使用 Hexo 的 post_link：

```
{% post_link '机器学习分子力场/01-不变神经网络' %}
```

## 关键事实速查（写作时点：2026-08）

- **MatBench Discovery 榜首**：TECE-OAM-RRA-1.0 (CPS 0.908)、EquFlashV2 (0.907)、EquiformerV3+DeNS-OAM (F1 0.931)；前十全部采用 OAM 训练配方（MPtrj+OMat24+sAlex）
- **CPS 权重**：F1 50% + κSRME 40% + RMSD 10%；DAF 理论上限 ≈ 6.5
- **数据集规模**：MPtrj 158万 / OC20 1.3亿 / sAlex ~1100万 / OMat24 1亿 / MatterSim 1700万 / OMol25 1亿+（ωB97M-V）/ COSMOS 2.43亿（15库合一）
- **UMA**（Meta, Wood et al. 2025）：跨域基础模型，eSEN骨干，多任务适配头

## PDF目录结构

```
机器学习分子力场/
├── plan.md
├── 00-机器学习分子力场综述.md
├── 01-不变神经网络.md
├── 02-等变神经网络.md
├── 03-NequIP.md
├── 04-Allegro.md
├── 05-MACE.md
├── 06-Equiformer系列.md
├── 07-eSCN.md
├── 07-eSEN.md
├── 08-通用势数据集.md
├── 09-通用势benchmark.md
├── 10-通用势模型.md
├── 11-优化器.md
├── 12-调度器.md
└── 13-DPA系列.md
```

## 参考文献

1. Xia, J., Zhang, Y. & Jiang, B. The evolution of machine learning potentials for molecules, reactions and materials. *Chem. Soc. Rev.*, 2025, 54, 4790-4821.
2. Unke, O. T. et al. Machine learning force fields. *Chem. Rev.*, 2021, 121, 10142.
3. Behler, J. & Parrinello, M. Generalized Neural-Network Representation of High-Dimensional Potential-Energy Surfaces. *Phys. Rev. Lett.*, 2007, 98, 146401.
4. Schütt, K. T. et al. SchNet: A continuous-filter convolutional neural network for modeling quantum interactions. *Adv. Neural Inf. Process. Syst.*, 2017.
5. Unke, O. T. & Meuwly, M. PhysNet: A neural network for predicting energies, forces, dipole moments, and partial charges. *J. Chem. Theory Comput.*, 2019.
6. Klicpera, J. et al. Directional Message Passing for Molecular Graphs (DimeNet). *ICLR*, 2020.
7. Gasteiger, J. et al. GemNet: Universal directional graph neural networks for molecules. *NeurIPS*, 2021.
8. Batzner, S. et al. E(3)-equivariant graph neural networks for data-efficient and accurate interatomic potentials (NequIP). *Nat. Commun.*, 2022, 13, 2453.
9. Musaelian, A. et al. Learning local equivariant representations for large-scale atomistic dynamics (Allegro). *Nat. Commun.*, 2023, 14, 579.
10. Batatia, I. et al. MACE: Higher Order Equivariant Message Passing Neural Networks for Fast and Accurate Force Fields. *NeurIPS*, 2022; *Commun. Phys.*, 2023.
11. Passaro, S. & Zitnick, C. L. Reducing SO(3) Convolution to SO(2) Convolution for Equivariant Networks (eSCN). *ICML*, 2023.
12. Liao, Y.-L. et al. EquiformerV2 / eSEN / EquiformerV3 系列, arXiv:2604.09130 等.
13. Riebesell, J. et al. A framework to evaluate machine learning crystal stability predictions (Matbench Discovery). *Nat. Mach. Intell.*, 2025.
14. Barroso-Luque, L. et al. Open Materials 2024 (OMat24) datasets and models. arXiv:2411.11773, 2024.
15. Kim, Y. et al. SevenNet-Omni / COSMOS dataset. arXiv:2510.11241, 2025.
16. Wood, B. M. et al. UMA: A Family of Universal Models for Atoms. arXiv:2506.23971, 2025.
17. Harari, G., Zimmermann, Y., Kulseng, O. T. et al. Beyond Adam: SOAP and Muon for Faster, Label-Efficient Training of Machine Learning Interatomic Potentials. arXiv:2607.02499, 2026.
18. Li, T., Li, W., Peng, A. et al. DPA4: Pushing the Accuracy-Cost Frontier of Interatomic Potentials with EMFA SO(2) Convolution. arXiv:2606.02419, 2026.

---
*更新日期：2026-08-29*
*状态：专栏重构完成，新增优化器与调度器两章*
