# 机器学习哈密顿量 (Machine Learning Hamiltonian)

## 领域概述

本专栏聚焦**深度学习电子结构计算**中的主线：以清华徐勇/段文晖团队的 DeepH 家族为脉络，讲述如何用等变图神经网络直接预测 DFT 哈密顿量，从而绕过自洽场（SCF）迭代，把第一性原理电子结构计算的适用范围从上百原子推广到上万原子。它与机器学习分子力场专栏互为姊妹篇：MLIP（见 {% post_link '机器学习分子力场/00-机器学习分子力场综述' %} ）学的是标量势能面，这里要学的是作为算符的哈密顿量矩阵——对称性要求从"不变/等变的标量输出"升级为"整个矩阵块按不可约表示协变变换"，技术上也更依赖等变神经网络（原理详见 {% post_link '机器学习分子力场/02-等变神经网络' %} ）。

## 专栏框架

以 DeepH 为主要脉络组织：

**初代DeepH（局域性+规范协变性） → DeepH-E3（完整等变化） → DeepH-2（等变局域坐标Transformer） → DeepH-pack（工程化） → DeepH-Zero（无监督） → 应用延伸（hybrid泛函/通用模型/磁性） → 全景收官（DL-DFT vs DL-QMC）**

- **初代DeepH**：确立"近邻性原理 + 规范协变性经局部坐标变换处理 + MPNN"三件套，魔角TBG一万原子成为可能；
- **DeepH-E3**：放弃局部坐标技巧，所有特征按 E(3) 不可约表示严格等变，亚meV精度；
- **DeepH-2**：调和前两者的矛盾——只沿边取 z 轴，SO(3) 退化为阿贝尔 SO(2)，计算量 O(L⁶)→O(L³)，Transformer 架构直指通用模型；
- **DeepH-pack**：官方软件包，Preprocess→Train→Inference 三步流程，对接 ABACUS/OpenMX/FHI-aims/SIESTA；
- **DeepH-Zero**：换范式的尝试——把总能量泛函本身当作 loss（AI2DFT），物理信息驱动的无监督学习；
- **应用延伸**：DeepH-hybrid 把精度推到杂化泛函水平并首次研究魔角 TBG 的精确交换效应；UMM 用万级材料数据库训练出通用材料模型并演示微调；xDeepH 以 E(3)×{1,𝒯} 等变处理磁性超胞；
- **全景收官**：借 *Nat. Comput. Sci.* 2025 年综述纵览深度学习电子结构的两大支柱——深度学习 DFT（本专栏主线）与深度学习 QMC（神经波函数直解多体薛定谔方程），并展望大材料模型愿景；
- **其他工作**：HamGNN、QHNet 等非 DeepH 系的等变哈密顿量网络留作一篇推文。

### 文章列表

| 文件 | 内容 | 状态 |
|------|------|------|
| `00-机器学习哈密顿量综述.md` | 总览：DFT 的精度—效率困境、为什么学哈密顿量、规范协变性的挑战、全系列导航 | ✅ 已重写（2026-08-24） |
| `01-初代DeepH.md` | Li et al., Nat. Comput. Sci. 2022：局域性化解无限维度、局部坐标化解规范协变性、MPNN 实现、魔角 TBG 11164 原子应用 | ✅ 已完成 |
| `02-DeepH-E3.md` | Gong et al., Nat. Commun. 2023：Wigner-Eckart 定理参数化哈密顿子块、全 E(3) 等变、含 SOC 情形、moiré 材料数据库 | ✅ 已完成 |
| `03-DeepH-2.md` | Wang et al. 2024：ELCT 等变局域坐标 Transformer、SO(3)→SO(2)、O(L³) 复杂度、效率与精度双超前代 | ✅ 已完成 |
| `04-DeepH-pack.md` | 官方实现：Preprocess/Train/Inference 工作流、多 DFT 软件接口、大体系 overlap 矩阵免 SCF、稀疏对角化 | ✅ 已完成 |
| `05-DeepH-Zero.md` | Li et al. 2024 (AI2DFT)：能量泛函作 loss、可微 DFT、物理信息无监督学习、占据/非占据态难题与密度矩阵重构 | ✅ 已完成 |
| `06-DeepH-hybrid与UMM.md` | 应用篇上：Tang & Lin, Nat. Commun. 2024 杂化泛函哈密顿量（魔角 TBG 平带的精确交换效应）；Wang et al., Sci. Bull. 2024 通用材料模型（万级数据库、微调、scaling law 展望）；顺带提及 PW 基推广与 DDHT 数据库 | ✅ 已完成 |
| `07-xDeepH磁性超胞.md` | Li et al., Nat. Comput. Sci. 2023：输入原子+磁结构、E(3)×{1,𝒯} 等变、spin-spiral/纳米管/moiré 磁体、skyrmion 应用 | ✅ 已完成 |
| `08-深度学习电子结构全景.md` | 收官：Tang et al., Nat. Comput. Sci. 5, 1133 (2025) 综述解读——DL-DFT 与 DL-QMC 两大支柱对比、单粒子哈密顿量路线 vs 多体波函数路线、大材料模型展望 | ✅ 已完成 |
| `09-其他工作展望.md` | 推文：HamGNN（IST 参数化、SU(2) 扩展）、QHNet、SchNOrb/PhiSNet 分子系、QH9/nablaDFT 数据集、Uni-HamGNN、N2AMD 非绝热 MD 等 | ✅ 已完成 |

### 软链接格式

```
{% post_link '机器学习哈密顿量/02-DeepH-E3' %}
```

跨专栏复用：

```
{% post_link '机器学习分子力场/02-等变神经网络' %}
```

## 关键事实速查（写作时点：2026-08）

- **初代 DeepH**（He Li, Zun Wang, Nianlong Zou, Meng Ye, Runzhang Xu, Xiaoxun Gong, Wenhui Duan & Yong Xu, *Nat. Comput. Sci.* 2, 367–377, 2022）：
  - 动机：DFT 自洽迭代计算量大（>O(N³)），线性标度法又损精度——"accuracy–efficiency dilemma"；Hohenberg–Kohn 定理保证映射 $\{\mathcal{R}\}\mapsto \hat{H}_{\mathrm{DFT}}(\{\mathcal{R}\})$ 存在
  - 两大挑战：哈密顿矩阵维度无穷大 + 在坐标/基/规范变换下**协变**（比学不变标量能量难得多）
  - 方案：近邻性（nearsightedness，由多体本征态的相消干涉保证）+ 局域坐标系 + 局域基变换把协变化为不变；MPNN 消息传递实现；LCMP 层对精度至关重要
  - 结果：meV 级误差；时间随体系线性增长，MoS₂ 35×35 超胞提速三个数量级；魔角 TBG（11164 原子）轻松拿下且平带复现良好；TBB（双层铋烯）验证含 SOC 情形
  - 训练数据只需非扭转小超胞 + 层间滑移/随机扰动，即可外推到任意转角
- **DeepH-E3**（Xiaoxun Gong, He Li, Nianlong Zou, Runzhang Xu, Wenhui Duan & Yong Xu, *Nat. Commun.* 14, 2848, 2023）：
  - 所有输入/内部/输出特征均为 E(3) 等变向量，按角动量 $l$ 与宇称 e/o 标记，旋转时按 Wigner-D 矩阵变换
  - 哈密顿子块 $h\equiv[H_{ij}]_{p_1p_2}$ 视为 $l_1\otimes l_2=\lvert l_1-l_2\rvert\oplus\cdots\oplus(l_1+l_2)$ 表示的等变张量，依 Wigner–Eckart 定理由网络特征构造
  - 含 SOC 时同样保持欧几里得对称性；亚 meV 精度、可算 >10⁴ 原子超胞
  - 应用：构建 moiré-twisted materials database（后续发展为 DDHT）
  - 代价：等变约束限制表达力、张量积计算量 O(L⁶)
- **DeepH-2**（Yuxiang Wang, He Li, Zechen Tang, Honggeng Tao, Yanzhen Wang, Zilong Yuan, Zezhou Chen, Wenhui Duan & Yong Xu, arXiv:2401.17015）：
  - 诊断：初代 DeepH 的局部坐标依赖最近邻选取→不连续、不平滑，损害 MD 与泛化；DeepH-E3 全等变→表达力受限且贵
  - ELCT（equivariant local-coordinate transformer）：每条边只取沿键方向的局域 z 轴，非阿贝尔 SO(3) 约化为阿贝尔 SO(2)，不同角动量通道可直接混合，复杂度降至 O(L³)（思想源自力场领域的 eSCN/Passaro-Zitnick 约化）
  - Transformer 多头注意力提取多样特征；~10⁷ 参数量级；效率与精度均超前代，指向通用大模型
- **DeepH-pack**（deepmodeling/DeepH-pack；方法论文章 Yang Li et al., *npj Comput. Mater.* 2026, DOI:10.1038/s41524-026-02219-2）：
  - 初代 DeepH 官方统一实现；流程 Preprocess（单位转换/局部坐标生成/基变换）→ Train → Inference（预测 + 稀疏对角化算能带）
  - 支持 ABACUS、OpenMX、FHI-aims、SIESTA（计划支持 HONPAS）；大尺度结构只需算 overlap 矩阵 S（无需 SCF，ABACUS 中 `calculation get_S`）
  - 数据集设计原则：小体系非扭转超胞 + 充分覆盖局域化学环境
- **DeepH-Zero**（Yang Li, Zechen Tang, Zezhou Chen, Minghui Sun, Boheng Zhao, He Li 等, arXiv:2403.11287；代码 AI2DFT）：
  - 理念：变分原理 ↔ loss 最小化的同构；把总能量泛函写成 DFT 量的泛函 $E[Q]$，$Q$ 可取 $n,\{\psi_i\},\rho,H$，选 $H$ 以获得可迁移模型
  - 可微 DFT：Kohn–Sham 流程改写为可微计算图，自动微分+反向传播
  - 物理信息无监督学习，无需"DFT 先算数据再监督训练"的两步分离；精度与效率优于监督式
  - 关键发现：能量极小化能正确定出总能/电荷密度/占据流形，但**非占据态贡献为零能量、无法被唯一确定**→需以密度矩阵 ρ 重构哈密顿量 $\tilde{H}$
  - 思想源头类比 neural-network quantum states（NNQS/QMC）
- **DeepH-hybrid**（Zechen Tang, He Li, Peize Lin 共同一作；Xiaoxun Gong, Gan Jin, Lixin He, Hong Jiang, Xinguo Ren, Wenhui Duan & Yong Xu——清华×北大×中科大合作；*Nat. Commun.* 15, 8815, 2024）：
  - 学习杂化泛函的广义 KS 哈密顿量 $H^{\mathrm{DFThyb}}$；局域基下近视性保持→可直接沿用 DeepH-E3 架构
  - 非局域精确交换要求更大的截断半径；绕过 SCF 与四中心积分
  - 标志性应用：首次研究魔角 TBG 中精确交换（HSE）对平带的影响——平带性质发生剧烈改变，说明 exact exchange 对 MATBG 平带物理有定性影响；可处理 >10⁴ 原子 moiré 结构
- **UMM 通用材料模型**（Yuxiang Wang, Yang Li, Zechen Tang, He Li, …, Chen Si, Wenhui Duan & Yong Xu, *Sci. Bull.* 69, 2514–2521, 2024；arXiv:2406.10536）：
  - 万级 (>10000) 材料结构的大数据库 + 显著改进的 DeepH 方法（基于 DeepH-2 架构）
  - 单一模型覆盖周期表大部分元素与多样结构；测试材料性质预测精度高、鲁棒
  - 演示 fine-tuning：通用模型微调后可强化特定材料模型
  - 展望 scaling law、SOC/磁性扩展、借助 DeepH 高效建库反哺大模型（如 BCS 超导搜索）
- **xDeepH**（He Li, Xiaoxun Gong, Wenhui Duan 等, "Deep-learning electronic-structure calculation of magnetic superstructures", *Nat. Comput. Sci.* 3, 321–327, 2023）：
  - 任务：输入原子结构 + 磁结构（局域磁矩），输出磁超胞 DFT 哈密顿量
  - 对称群：E(3) × {1,𝒯}（欧几里得群 × 时间反演二阶群），磁矩按轴矢量/时间反演奇偶性进入表示
  - 磁矩严格局域输入；基于 DeepH-E3 代码库实现
  - 应用：spin-spiral、纳米管磁体、moiré 磁体；使磁性 skyrmion 的大规模第一性原理研究可行
- **收官综述**（Zechen Tang, Haoxiang Chen, Yang Li, …, Chen Si, Wenhui Duan & Yong Xu, "Deep-learning electronic structure calculations", *Nat. Comput. Sci.* 5, 1133–1146, 2025, DOI:10.1038/s43588-025-00932-4）：
  - 两大支柱：①深度学习 QMC——FermiNet/PsiFormer 等神经波函数 + VMC/DMC，直接攻关联电子（固体方向见 Qian, Li, Li, Ren, Chen 综述 arXiv:2407.00707）；②深度学习 DFT——本专栏主线
  - 共同主题：破解 first-principles 计算的 accuracy–efficiency dilemma，把量子力学的影响推向空前尺度
- **HamGNN**（Yingdong Zhong, Hongyu Yu, Mao Su, Xiaoxun Gong, Hongjun Xiang, *npj Comput. Mater.* 9, 182, 2023）：
  - 解析参数化哈密顿矩阵：每个子块分解为携带宇称的等变不可约球张量（IST）矢量耦合；可扩展至 SU(2)×时间反演（SOC）
  - 测试：QM9、426 种碳同素异形体、硅同素异形体、SiO₂ 同质异构体、BiₓSeᵧ；迁移到 moiré 扭转 MoS₂ 与位错缺陷硅超胞
  - 接口 OpenMX/SIESTA/HONPAS/ABACUS；GitHub: QuantumLab-ZY/HamGNN；后续 Uni-HamGNN 主打通用 SOC
- **其他可在推文/收官提及**：QHNet（Yu, Qian & Ji, ICML 2023, arXiv:2306.04922）；SchNOrb/PhiSNet（分子哈密顿量）；QH9 与 nablaDFT/∇²DFT 数据集（NeurIPS 2024 benchmark 显示哈密顿预测的泛化仍是难题）；PW 基推广（Xiaoxun Gong, Wenhui Duan & Yong Xu, *Nat. Comput. Sci.* 4, 752–760, 2024，实空间重构法）；DDHT 扭转材料数据库（Bao et al., arXiv:2404.06449，124+5 种双层的预训练模型库）；DeepH-r 实空间势（Yuan et al., arXiv:2407.14379）；N2AMD 非绝热分子动力学（Zhang et al., *Nat. Commun.* 16, 2033, 2025）；DeepH+HONPAS 杂化泛函万原子级计算（*Digital Discovery*, 2025, DOI:10.1039/D5DD00128E）

## PDF目录结构

```
机器学习哈密顿量/
├── plan.md
├── 00-机器学习哈密顿量综述.md          （重写）
├── 01-初代DeepH.md                    （新）
├── 02-DeepH-E3.md                     （新）
├── 03-DeepH-2.md                      （新）
├── 04-DeepH-pack.md                   （新）
├── 05-DeepH-Zero.md                   （新）
├── 06-DeepH-hybrid与UMM.md            （新）
├── 07-xDeepH磁性超胞.md               （新）
├── 08-深度学习电子结构全景.md         （新）
└── 09-其他工作展望.md                 （新）
```

删除项：`01-Hamiltonian-Neural-Networks.md`（经典 HNN 内容退出本专栏；经典力学方向若日后重启另立专栏）。

## 参考文献

1. Li, H., Wang, Z., Zou, N. et al. Deep-learning density functional theory Hamiltonian for efficient ab initio electronic-structure calculation. *Nat. Comput. Sci.*, 2022, 2, 367–377.
2. Gong, X., Li, H., Zou, N. et al. General framework for E(3)-equivariant neural network representation of density functional theory Hamiltonian. *Nat. Commun.*, 2023, 14, 2848.
3. Wang, Y., Li, H., Tang, Z. et al. DeepH-2: Enhancing deep-learning electronic structure via an equivariant local-coordinate transformer. arXiv:2401.17015, 2024.
4. Li, Y., Wang, Y., Zhao, B. et al. DeepH-pack: a general-purpose neural network package for deep-learning electronic structure calculations. *npj Comput. Mater.*, 2026. DOI:10.1038/s41524-026-02219-2.
5. Li, Y., Tang, Z., Chen, Z. et al. Neural-network density functional theory based on variational energy minimization (DeepH-Zero / AI2DFT). arXiv:2403.11287, 2024.
6. Tang, Z., Li, H., Lin, P. et al. A deep equivariant neural network approach for efficient hybrid density functional calculations (DeepH-hybrid). *Nat. Commun.*, 2024, 15, 8815. DOI:10.1038/s41467-024-53028-4.
7. Wang, Y., Li, Y., Tang, Z. et al. Universal materials model of deep-learning density functional theory Hamiltonian. *Sci. Bull.*, 2024, 69, 2514–2521.
8. Li, H. et al. Deep-learning electronic-structure calculation of magnetic superstructures (xDeepH). *Nat. Comput. Sci.*, 2023, 3, 321–327.
9. Tang, Z., Chen, H., Li, Y. et al. Deep-learning electronic structure calculations. *Nat. Comput. Sci.*, 2025, 5, 1133–1146. DOI:10.1038/s43588-025-00932-4.
10. Zhong, Y., Yu, H., Su, M., Gong, X. & Xiang, H. Transferable equivariant graph neural networks for the Hamiltonians of molecules and solids (HamGNN). *npj Comput. Mater.*, 2023, 9, 182.
11. Gong, X., Duan, W. & Xu, Y. Generalizing deep learning electronic structure calculation to the plane-wave basis. *Nat. Comput. Sci.*, 2024, 4, 752–760.
12. Bao, T., Xu, R., Li, H. et al. Deep-learning database of density functional theory Hamiltonians for twisted materials (DDHT). arXiv:2404.06449, 2024.
13. Zhang, C. et al. Advancing nonadiabatic molecular dynamics simulations in solids with E(3) equivariant deep neural Hamiltonians (N2AMD). *Nat. Commun.*, 2025, 16, 2033.

---
*更新日期：2026-08-24*
*状态：全部十篇已完成写作并验证软链接*
