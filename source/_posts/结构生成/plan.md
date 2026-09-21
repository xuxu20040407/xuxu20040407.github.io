# 结构生成 (Structure Generation: Molecules & Crystals)

## 领域概述

结构生成是利用深度生成模型从头设计具有特定性质的分子或晶体结构。分子方向涵盖2D分子图生成与3D构型生成，晶体方向则面向无机材料与分子晶体的周期结构预测。它是药物设计与材料发现的生成式核心，也是本博客"力场—哈密顿量—结构生成"三部曲的最后一环：力场负责评估，生成模型负责提出。

## 专栏框架

按以下主线组织（与机器学习分子力场专栏同构）：

**序列时代的开启 → 图的直接生成 → 等变扩散 → 条件生成与大模型 → 扩散之外的新范式**

- **序列时代的开启**：SMILES字符串+RNN/VAE（Gómez-Bombarelli 2018），REINVENT引入强化学习目标导向优化；
- **图的直接生成**：JT-VAE（2018）绕开SMILES语法直接操作分子图，GraphAF/GraphDF补齐流模型路线；
- **等变扩散**：EDM（2022）/GeoDiff把E(n)等变性引入3D生成，联合采样原子类型、坐标与键——与力场专栏的等变脉络呼应；
- **条件生成与大模型**：口袋条件下的靶向设计（TargetDiff/3D-SBDD）、晶体生成（CDVAE/DiffCSP/MatterGen）、化学大模型（GP-MolFormer）；
- **扩散之外**：等变流匹配（SemlaFlow）以20步采样快两个数量级，分子晶体CSP进入生成式时代（OXtal/Clari/MolCrystalFlow/PackFlow），RL对齐成为新的后训练手段。

### 文章列表

| 文件 | 内容 | 状态 |
|------|------|------|
| `00-结构生成综述.md` | 总览：任务定义、两大表征（SMILES/图/点云）、发展主线、全系列导航（含post_link软链接） | 🔶 已有初版，需按新框架重写 |
| `01-序列时代.md` | SMILES+VAE（Gómez-Bombarelli）、REINVENT强化学习、MolGPT | ⬜ 待写作 |
| `02-Junction-Tree-VAE.md` | 子结构树+图装配的两阶段解码，100%化学有效性 | 🔶 已有初版，需按用户语气重写并软链接 |
| `03-EDM.md` | E(n)等变扩散模型，原子类型/坐标/键的联合去噪 | 🔶 已有初版，需重写；GeoDiff与G-SchNet在此篇对比带过 |
| `04-靶向3D生成.md` | 口袋条件的等变扩散：TargetDiff、3D-SBDD、DecompDiff | ⬜ 待写作 |
| `05-晶体生成.md` | CDVAE、DiffCSP(+ +)、MatterGen（Nature 2025）：无机材料的属性条件生成 | ⬜ 待写作 |
| `06-流匹配.md` | SemlaFlow（AISTATS 2025）；分子晶体CSP四杰：OXtal、Clari、MolCrystalFlow、PackFlow | ⬜ 待写作 |
| `07-生成评测.md` | MOSES/GuacaMol指标、PoseBusters物理合理性、CCDC盲测；有效性≠可合成性的反思 | ⬜ 待写作 |

> 注：现有文件 `02-EDM.md` 将更名为 `03-EDM.md` 以匹配叙事顺序。

### 软链接格式

```
{% post_link '结构生成/03-EDM' %}
```

## 关键事实速查（写作时点：2026-08）

- **MatterGen**（Zeni et al., Nature 2025, Microsoft）：Alex-MP-20训练（参考集84.6万结构），可微调至化学体系/空间群/带隙/磁密度/体积模量等条件；新颖且稳定的结构比此前生成模型多一倍以上，距局域能量极小近10倍；已实验合成验证（实测性质在目标20%以内）
- **SemlaFlow**（Irwin et al., AISTATS 2025）：Semla等变消息传递架构+等变流匹配，20步采样达SOTA，比扩散SOTA快约两个数量级；同时指出现有3D生成评测的缺陷并提出新指标
- **分子晶体CSP（2026爆发期）**：
  - OXtal（ICLR 2026）：全原子扩散，AlphaFold3式triangle layer，分钟级/分子
  - Clari：单元胞flow matching+pair-bias DiT（弃用triangle layer），快15–30×，配合UMA能量排序做推理时扩展，CSP盲测超过DFT参赛者均值
  - MolCrystalFlow：刚体近似+黎曼流匹配（质心/朝向在原生流形上测地线流）
  - PackFlow：flow matching预训练+GRPO物理对齐后训练（以MLIP能量/力为奖励）
- **经典锚点**：JT-VAE（ICML 2018）在ZINC250k上100%有效；EDM（ICML 2022）联合生成原子类型+坐标+键；GeoDiff（ICLR 2022）构象生成
- **数据集/基准**：QM9、ZINC250k、GEOM-Drugs、MOSES（2019）、GuacaMol（2019）、PoseBusters、CCDC CSP盲测（第5、7次）

## PDF目录结构

```
结构生成/
├── plan.md
├── 00-结构生成综述.md
├── 01-序列时代.md
├── 02-Junction-Tree-VAE.md
├── 03-EDM.md
├── 04-靶向3D生成.md
├── 05-晶体生成.md
├── 06-流匹配.md
└── 07-生成评测.md
```

## 参考文献

1. Jin, W., Barzilay, R. & Jaakkola, T. Junction Tree Variational Autoencoder for Molecular Graph Generation. *ICML*, 2018.
2. Olivecrona, M. et al. Molecular de-novo design through deep reinforcement learning. *J. Cheminf.*, 2017, 9, 48.
3. Gómez-Bombarelli, R. et al. Automatic chemical design using a data-driven continuous representation of molecules. *ACS Cent. Sci.*, 2018, 4, 268-276.
4. Hoogeboom, E. et al. Equivariant Diffusion for Molecule Generation in 3D. *ICML*, 2022.
5. Xu, M. et al. GeoDiff: A Geometric Diffusion Model for Molecular Conformation Generation. *ICLR*, 2022.
6. Guan, J. et al. 3D Equivariant Diffusion for Target-Aware Molecule Generation and Affinity Prediction (TargetDiff). *arXiv:2303.03543*, 2023.
7. Xie, T., Fu, X., Ganea, O.-E., Barzilay, R. & Jaakkola, T. Crystal Diffusion Variational Autoencoder for Periodic Material Design (CDVAE). *ICLR*, 2022.
8. Jiao, R. et al. Crystal Structure Prediction by Joint Equivariant Diffusion (DiffCSP). *NeurIPS*, 2023.
9. Zeni, C. et al. A generative model for inorganic materials design (MatterGen). *Nature*, 2025, 639, 624-632.
10. Irwin, R., Tibo, A., Janet, J. P. & Olsson, S. SemlaFlow – Efficient 3D Molecular Generation with Latent Attention and Equivariant Flow Matching. *AISTATS*, 2025.
11. Jin, E. et al. OXtal: An All-Atom Diffusion Model for Organic Crystal Structure Prediction. *ICLR*, 2026.
12. Polyakovskiy et al./Anon. Clari: Fast Organic Crystal Structure Prediction with Unit Cell Flow Matching. arXiv:2606.03199, 2026.
13. Zeng, C. et al. MolCrystalFlow: Molecular Crystal Structure Prediction via Flow Matching. arXiv:2602.16020, 2026.
14. Subramanian, A. et al. PackFlow: Generative Molecular Crystal Structure Prediction via Reinforcement Learning Alignment. arXiv:2602.20140, 2026.
15. Polykovskiy, D. et al. Molecular Sets (MOSES): A Benchmarking Platform for Molecular Generation Models. *Front. Pharmacol.*, 2020.

---
*更新日期：2026-08-24*
*状态：规划完成，待逐篇写作*
