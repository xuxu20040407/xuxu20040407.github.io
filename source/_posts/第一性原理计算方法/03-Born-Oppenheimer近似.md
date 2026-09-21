---
title: 03 Born-Oppenheimer 近似
mathjax: true
date: 2026-09-15 12:30:00
tags: 第一性原理计算方法
categories: 第一性原理计算方法
cover:
---

- [电子与核自由度的解耦](#电子与核自由度的解耦)
- [Hellmann-Feynman 定理](#hellmann-feynman-定理)
- [Born-Oppenheimer 近似的严格推导](#born-oppenheimer-近似的严格推导)
- [BO 有效哈密顿量与 Berry 联络](#bo-有效哈密顿量与-berry-联络)
- [Berry 相位基础](#berry-相位基础)
- [核的经典运动方程](#核的经典运动方程)
- [Landau-Zener 隧穿](#landau-zener-隧穿)
- [非绝热分子动力学](#非绝热分子动力学)

在凝聚态物理和材料科学中，非相对论薛定谔方程通常被视为"理论中的一切"。本章展示如何把电子与原子核自由度解耦。原子单位下完整哈密顿量为：

$$
\hat H = \underbrace{-\frac12\sum_i\nabla_i^2}_{\text{电子动能}}
- \underbrace{\sum_{i,I}\frac{Z_I}{|\mathbf r_i-\mathbf R_I|}}_{\text{e-i}}
+ \underbrace{\frac12\sum_{i\neq j}\frac{1}{|\mathbf r_i-\mathbf r_j|}}_{\text{e-e}}
\underbrace{-\sum_I\frac{1}{2M_I}\nabla_I^2}_{\text{核动能}}
+ \underbrace{\frac12\sum_{I\neq J}\frac{Z_IZ_J}{|\mathbf R_I-\mathbf R_J|}}_{\text{i-i}}
$$

其中 $\{i,j\}$ 标记电子，$\{I,J\}$ 标记原子核。一般无法精确求解，需要分层近似。本章的核心观察是：**原子核的质量远大于电子，因此核更"经典"**。

# 电子与核自由度的解耦

把哈密顿量写成 $\hat H = \hat T_N + \hat U(\{\mathbf R\})$，其中 $\hat T_N = -\sum_I\nabla_I^2/2M_I$ 是核动能，$\hat U(\{\mathbf R\})$ 包含其余所有项（e-e、e-i、i-i 相互作用与电子动能）。在 $\hat U$ 中，核位置被视为经典参数。对固定的 $\{\mathbf R\}$，求解电子本征值问题：

$$
\hat U(\{\mathbf R\})\,\Phi_i(\{\mathbf r\};\{\mathbf R\}) = \varepsilon_i(\{\mathbf R\})\,\Phi_i(\{\mathbf r\};\{\mathbf R\})
$$

其中 $\varepsilon_i(\{\mathbf R\})$ 称为**势能面（PES）**，它决定原子核的动力学。

# Hellmann-Feynman 定理

可用于计算核上受力。假设核位置为经典参数，核 $I$ 上的力为：

$$
\mathbf F_I = -\frac{\partial\varepsilon_0(\{\mathbf R\})}{\partial\mathbf R_I}
$$

其中 $\varepsilon_0(\{\mathbf R\}) = \langle\Phi_0|\hat U|\Phi_0\rangle$（下标 0 标记 $\hat U$ 的基态）。把能量对 $\mathbf R_I$ 求导展开：

$$
-\frac{\partial\varepsilon_0}{\partial\mathbf R_I} = -\left\langle\Phi_0\left|\frac{\partial\hat U}{\partial\mathbf R_I}\right|\Phi_0\right\rangle - \frac{\partial\langle\Phi_0|}{\partial\mathbf R_I}\hat U|\Phi_0\rangle - \langle\Phi_0|\hat U\frac{\partial|\Phi_0\rangle}{\partial\mathbf R_I}
$$

最后两项相消（利用 $\hat U|\Phi_0\rangle = \varepsilon_0|\Phi_0\rangle$ 与归一化 $\langle\Phi_0|\Phi_0\rangle=1$）。于是 **Hellmann-Feynman 定理**：

$$
\boxed{\ \mathbf F_I = -\left\langle\Phi_0\left|\frac{\partial\hat U}{\partial\mathbf R_I}\right|\Phi_0\right\rangle\ }
$$

即核上的力只取决于哈密顿量对核位置的显式导数。哈密顿量中只有两项含 $\mathbf R_I$：电子感受到的核势 $V_{nuclei}(\mathbf r)$ 与核-核相互作用，因此

$$
\mathbf F_I = -\int d^3r\,n_0(\mathbf r)\frac{\partial V_{nuclei}(\mathbf r)}{\partial\mathbf R_I} - \frac{\partial E_{nuclei-nuclei}}{\partial\mathbf R_I}
$$

**核上的力只依赖于基态电荷密度 $n_0(\mathbf r)$**。

**推广到任意参数 $\lambda$**：对 $H(\lambda)$ 的基态，

$$
\frac{\partial\varepsilon_0}{\partial\lambda} = \left\langle\Phi_0(\lambda)\left|\frac{\partial\hat H}{\partial\lambda}\right|\Phi_0(\lambda)\right\rangle
$$

若两个不同 $\lambda$ 的基态能量差为

$$
\Delta\varepsilon_0 = \int_{\lambda_1}^{\lambda_2}d\lambda\,\left\langle\Phi_0(\lambda)\left|\frac{\partial\hat H}{\partial\lambda}\right|\Phi_0(\lambda)\right\rangle
$$

原则上可用于从无相互作用参考体系出发、通过把元电荷 $e$ 从 0 变到 1 来计算关联体系能量（**绝热连接**思想的萌芽）。

# Born-Oppenheimer 近似的严格推导

静态薛定谔方程 $\hat H\Psi_n(\{\mathbf r,\mathbf R\}) = E_n\Psi_n(\{\mathbf r,\mathbf R\})$。把 $\Psi_n$ 在固定核位置的电子基 $\Phi_i(\{\mathbf r\};\{\mathbf R\})$ 上展开：

$$
\Psi_n(\{\mathbf r,\mathbf R\}) = \sum_i\chi_{ni}(\{\mathbf R\})\,\Phi_i(\{\mathbf r\};\{\mathbf R\})
$$

这个展开**精确**：对每个 $\{\mathbf R\}$，$\Psi_n$ 都是 $\{\mathbf r\}$ 的函数，而 $\Phi_i(\{\mathbf r\};\{\mathbf R\})$ 是完备基。

> **注 1**：同样也可以展开成与 $\{\mathbf R\}$ 无关的基 $\Psi_n = \sum_i\chi_{ni}(\{\mathbf R\})\Phi_i(\{\mathbf r\})$，但这个展开不体现"核更经典、可当作经典变量"的直觉。

我们选择 $\Phi_i(\{\mathbf r\};\{\mathbf R\})$ 为固定 $\{\mathbf R\}$ 下电子哈密顿量的本征态（式 13）。用 $\Phi_j^*$ 左乘薛定谔方程并对 $\{\mathbf r\}$ 积分，得到 $\chi_{ni}$ 的方程。左边有两项：电子项给出 $\varepsilon_j(\{\mathbf R\})\chi_{nj}$，核动能项给出：

$$
-\sum_{i,I}\frac{1}{2M_I}\int d\mathbf r\,\Phi_j^*\nabla_I^2\chi_{ni}\Phi_i
= -\sum_I\frac{1}{2M_I}\left[\nabla_I^2\delta_{ji} + 2\mathbf d_{ji}^I\cdot\nabla_I + G_{ji}^I\right]\chi_{ni}
$$

其中定义了**非绝热耦合矢量**与**标量耦合**：

$$
\mathbf d_{ij}^I(\{\mathbf R\}) = \int d\mathbf r\,\Phi_i^*(\{\mathbf r\};\{\mathbf R\})\nabla_I\Phi_j(\{\mathbf r\};\{\mathbf R\}), \qquad
G_{ij}^I(\{\mathbf R\}) = \int d\mathbf r\,\Phi_i^*\nabla_I^2\Phi_j
$$

最终 $\chi_{ni}$ 满足的**精确方程**为：

$$
\left[-\frac{1}{2M_I}\nabla_I^2 + \varepsilon_i(\{\mathbf R\})\right]\chi_{ni}(\{\mathbf R\})
- \sum_I\frac{1}{2M_I}\left[2\mathbf d_{ij}^I\cdot\nabla_I + G_{ij}^I\right]\chi_{nj}(\{\mathbf R\}) = E_n\chi_{ni}(\{\mathbf R\})
$$

在此基础上可以按严格程度做不同层次的近似：

1. **静态近似**：忽略所有含 $1/M_I$ 的项——把核位置视为纯经典参数，完全没有动力学；
2. **冻结声子近似**：忽略 $\sum_I[2\mathbf d_{ij}^I\cdot\nabla_I + G_{ij}^I]/2M_I$，但不忽略 $-\nabla_I^2/2M_I$。似乎奇怪：为什么可以忽略一项 $1/M_I$ 而不能忽略另一项？因为 $-\nabla_I^2/2M_I$ 是**奇异微扰**（见下）；
3. **绝热近似 / Born-Oppenheimer 近似 / 单面近似**：忽略 $\sum_I[2\mathbf d_{ij}^I\cdot\nabla_I + G_{ij}^I]/2M_I$ 的非对角（$i\neq j$）项。其合法性来自非绝热耦合矢量的形式：

$$
\mathbf d_{ij}^I = \frac{\langle\Phi_i|\nabla_{\mathbf R_I}\hat U|\Phi_j\rangle}{\varepsilon_j-\varepsilon_i}
$$

当 $\varepsilon_j-\varepsilon_i$ 大时它很小。

> **注 2：奇异微扰**是一种完全改变问题类型的微扰。例如方程 $\varepsilon x^3 + x - 1 = 0$：无 $\varepsilon x^3$ 时只有一个根，加了微扰后有三个根。薛定谔方程中的动能项（正比于 $\hbar$）也是奇异微扰——否则薛定谔方程不再是一个微分方程。

# BO 有效哈密顿量与 Berry 联络

采用绝热近似并省略电子自由度（电子假设处于基态），核的有效哈密顿量为：

$$
\hat H_{BO} = \sum_I\frac{[-\mathrm i\nabla_I - \mathbf A_I(\{\mathbf R\})]^2}{2M_I} + \varepsilon(\{\mathbf R\}) + U_{DBOC}(\{\mathbf R\})
$$

其中

$$
\mathbf A_I(\{\mathbf R\}) = \mathrm i\,\mathbf d_I(\{\mathbf R\}) = \mathrm i\langle\Phi_0(\{\mathbf R\})|\nabla_I\Phi_0(\{\mathbf R\})\rangle
$$

称为 Berry 联络（见下节），而

$$
U_{DBOC}(\{\mathbf R\}) = \sum_I\frac{1}{2M_I}\left(\langle\partial_\alpha^I\Phi_0|\partial_\alpha^I\Phi_0\rangle - |\mathbf A_I|^2\right)
$$

是**对角 Born-Oppenheimer 修正（DBOC）**。$\mathbf A_I$ 与 $U_{DBOC}$ 均为实数（保证有效哈密顿量厄米）。DBOC 还可写成：

$$
U_{DBOC}(\{\mathbf R\}) = \sum_I\sum_{n\neq0}\frac{|\langle\Phi_n|\partial_\alpha^I\Phi_0\rangle|^2}{2M_I}
$$

连接电子系统的基态与激发态。

> **注 3**：$U_{DBOC}$ 是 $\Phi_0(\mathbf R)$ 的 **Fubini-Study 度量**。最近的研究中 Fubini-Study 度量意外地到处出现 [见 Phys. Rev. Lett. 131, 240001 (2023) 综述]，通常可纳入某种有效色散——在 Born-Oppenheimer 近似中正是如此。

# Berry 相位基础

式 (21) 有很好的物理解释。在讨论之前先介绍 Berry 相位物理（诞生于绝热演化领域）。

对含时哈密顿 $\hat H(t)$，瞬时本征态记为 $|n(t)\rangle$。含时薛定谔方程的解可写为 $|\psi(t)\rangle = \sum_n c_n(t)e^{\mathrm i\theta_n(t)}|n(t)\rangle$，其中 $\theta_n = -\int_0^t dt' E_n(t')$ 是动力学相位。代入含时薛定谔方程可得 $c_m$ 的运动方程；对 $n\neq m$ 有

$$
\langle m(t)|\partial_t n(t)\rangle = \frac{\langle m(t)|\partial_t\hat H(t)|n(t)\rangle}{E_n(t)-E_m(t)}
$$

假设体系在 $t=0$ 处于 $|n(0)\rangle$，在 $\partial_t\hat H\to0$ 的极限下 $c_m\approx0$（$m\neq n$），而 $c_n(t) = e^{\mathrm i\gamma_n(t)}$，其中 $d\gamma_n/dt = \mathrm i\langle n(t)|\partial_t n(t)\rangle$。

绝热演化中时间可视为参数，但更宜于把时间演化与参数空间中的希尔伯特空间结构分开。考虑哈密顿量 $\hat H(\mathbf R)$ 依赖一组经典参数 $\mathbf R$，控制参数缓慢变化使 $\hat H(t) = \hat H(\mathbf R(t))$。若初态在 $|n(\mathbf R(0))\rangle$，绝热演化给出：

$$
|\psi(t)\rangle \approx \exp[\mathrm i\gamma_n(t)]\exp\left[-\mathrm i\int_0^t dt' E_n(t')\right]|n(\mathbf R(t))\rangle
$$

其中 $\frac{d\gamma_n}{dt} = [\partial_t\mathbf R(t)]\cdot\mathrm i\langle n(\mathbf R)|\nabla_{\mathbf R}n(\mathbf R)\rangle$。若参数空间中的 $\mathbf R(t)$ 沿闭环 $C$ 绕一圈，则累积的相位（除动力学相位外）为：

$$
\gamma_n[C] = \oint_C \mathbf A_n(\mathbf R)\cdot d\mathbf R, \qquad \mathbf A_n(\mathbf R) = \mathrm i\langle n(\mathbf R)|\nabla_{\mathbf R}n(\mathbf R)\rangle
$$

$\mathbf A_n$ 称为 **Berry 联络**，与时间无关、只与瞬时态的结构有关。本征态定义到参数依赖的 $U(1)$ 规范变换 $|n(\mathbf R)\rangle\to e^{\mathrm i\chi(\mathbf R)}|n(\mathbf R)\rangle$ 下，Berry 联络变换为

$$
\mathbf A_n \to \mathbf A_n - \nabla_{\mathbf R}\chi, \qquad \gamma_n \to \gamma_n
$$

$\gamma_n$ 是物理可观测量。这个规范变换与经典电动力学中的矢势类似，从而自然引出"磁场"——**Berry 曲率**：

$$
\boldsymbol\Omega(\mathbf R) = \nabla_{\mathbf R}\times\mathbf A_n(\mathbf R)
$$

它在 $U(1)$ 规范变换下不变。Berry 相位相关物理在现代凝聚态物理中被广泛研究 [综述：Rev. Mod. Phys. 82, 1959 (2010)]。

# 核的经典运动方程

回到式 (21)。它有"外标量势 + 磁场"的形式，$\mathbf A_I(\{\mathbf R\})$ 扮演矢势。借助 Berry 相位可把 $\mathbf A_I$ 识别为**核位置参数空间中的 Berry 联络**，同样有 $U(1)$ 规范自由度（来自 $\Phi$ 相位的任意性），不影响物理可观测量。

**冻结声子近似**下（忽略 $\mathbf A_I$ 与 $U_{DBOC}$），核的经典运动方程为：

$$
M_I\frac{d^2\mathbf R_{I\alpha}}{dt^2} = -\frac{\partial\varepsilon(\{\mathbf R\})}{\partial R_{I\alpha}}
$$

右边正是 Hellmann-Feynman 力。**Born-Oppenheimer 近似**下：

$$
M_I\frac{d^2R_{I\alpha}}{dt^2} = -\frac{\partial[\varepsilon(\{\mathbf R\}) + U_{DBOC}(\{\mathbf R\})]}{\partial R_{I\alpha}} + \sum_{J,\beta}F_{I\alpha,J\beta}(\{\mathbf R\})\frac{dR_{J\beta}}{dt}
$$

其中 **Berry 曲率张量**：

$$
F_{I\alpha,J\beta} = \partial_{I\alpha}A_{\beta J} - \partial_{J\beta}A_{\alpha I} = \mathrm i(\langle\partial_{I\alpha}\Phi|\partial_{J\beta}\Phi\rangle - \langle\partial_{J\beta}\Phi|\partial_{I\alpha}\Phi\rangle)
$$

扮演磁场角色。$\sum_{J\beta}F_{I\alpha,J\beta}\dot R_{J\beta}$ 一般破坏时间反演对称性，是运动方程中唯一破坏时间反演的项。若电子态时间反演不变（$\hat T|\Phi\rangle = |\Phi\rangle$），则 $F_{I\alpha,J\beta} = 0$——**电子系统不破坏时间反演时 Berry 曲率张量恒为零**，非常合理：$\mathbf A_I$ 与 $\mathbf F_{I\alpha,J\beta}$ 反映电子系统对核系统的影响；如果电子系统时间反演对称，它就无法以任何破坏时间反演的方式影响核系统。

如果电子系统通过形成磁序破坏时间反演，式 (33) 中的 Berry 曲率项可产生所谓的**声子二极管效应**（phonon diode effect），实现量子器件中的单向热输运。这个效应在冻结声子近似层面无法描述。

# Landau-Zener 隧穿

此前都假设电子动力学绝热。打破这个假设就进入非绝热分子动力学。要理解何时绝热性被打破，介绍一个简单且可能是唯一可解析求解的非绝热动力学模型——**Landau-Zener 隧穿**。

Landau-Zener 哈密顿量是 $2\times2$ 矩阵：

$$
H_{LZ}(t) = \frac12\begin{pmatrix}\alpha t & \Delta\\ \Delta & -\alpha t\end{pmatrix}
$$

$\Delta$ 是实常数，$\alpha$ 叫扫描速率（sweep rate）。瞬时本征能量为：

$$
E_\pm(t) = \pm\frac12\sqrt{(\alpha t)^2 + \Delta^2}
$$

$t\to\pm\infty$ 时瞬时本征态退化为 $(1,0)$ 与 $(0,1)$（即 $H_{LZ}$ 写下的基）——这组基叫**diabatic（绝热交叉）基**；$H_{LZ}$ 的瞬时本征态叫 **adiabatic（绝热）基**。绝热基中瞬时哈密顿量对角，两能级间最小能量间隙为 $\Delta$。Diabatic 基设计成对 $t$（或其他相关参数）变化最小，满足 $\langle\varphi_n|\partial_t\varphi_m\rangle\approx0$，在非绝热动力学中特别有用。

假设体系 $t\to-\infty$ 时处于 $(1,0)$，$t\to+\infty$ 时 diabatic 跃迁概率为：

$$
P_{LZ} = \exp(-2\pi\lambda), \qquad \lambda = \frac{\Delta^2}{4\alpha}
$$

（结果可由抛物柱函数暴力计算得出，推导对理解 Landau-Zener 问题贡献不大，此处略去。）两个极限：

1. **绝热极限** $\Delta^2\gg\alpha$：$P_{LZ}\approx0$，体系留在绝热分支上，可用绝热演化处理；
2. **Diabatic 极限** $\Delta^2\ll\alpha$：$P_{LZ}\approx1$，体系留在 diabatic 分支上。

除了隧穿概率，相位演化也有用。把波函数写为 $|\psi(t)\rangle = c_1(t)|(1,0)\rangle + c_2(t)|(0,1)\rangle$，去掉快动力学相位后，$a,b$ 的散射矩阵为：

$$
\begin{pmatrix}a(+\infty)\\b(+\infty)\end{pmatrix} = \begin{pmatrix}\sqrt{P_{LZ}} & -\sqrt{1-P_{LZ}}\,e^{\mathrm i\phi_S}\\ \sqrt{1-P_{LZ}}\,e^{-\mathrm i\phi_S} & \sqrt{P_{LZ}}\end{pmatrix}\begin{pmatrix}a(-\infty)\\b(-\infty)\end{pmatrix}
$$

其中

$$
\phi_S = \frac{\pi}{4} + \lambda(\ln\lambda - 1) + \arg\Gamma(1-\mathrm i\lambda)
$$

是 **Stokes 相位**。单次 Landau-Zener 隧穿时 Stokes 相位无关紧要，但多次连续隧穿时它决定干涉现象，变得重要。

# 非绝热分子动力学

分子体系中的非绝热动力学指 Born-Oppenheimer 近似失效、核运动与电子态改变强耦合的情形。BO 近似下核在单个绝热势能面上运动（电子瞬时调整到核位置），这在许多过程中失效（光激发动力学、电子转移、圆锥相交）。**非绝热分子动力学（NAMD）**方法明确允许核运动过程中电子态改变，本质上是混合量子-经典：电子子系统做量子处理（允许叠加与跃迁），核用经典运动方程传播。

核自由度是经典的，运动方程即式 (33)（模拟中有时忽略 DBOC 与 Berry 曲率项）。电子波函数展开为 $|\Lambda(t)\rangle = \sum_i c_i(t)|\Phi_i(\mathbf R(t))\rangle$，满足含时薛定谔方程 $\hat U(\mathbf R(t))|\Lambda(t)\rangle = \mathrm i\partial_t|\Lambda(t)\rangle$，给出：

$$
\mathrm i\frac{dc_i}{dt} = \varepsilon_i(\mathbf R)c_i - \mathrm i\sum_j c_j\,\mathbf d_{ij}\cdot\frac{d\mathbf R}{dt}
$$

NAMD 中电子运动方程沿选定的经典核轨迹精确积分（到数值误差与电子结构模型的精度）；不同方法的区别在于核如何处理：

- **Ehrenfest（平均场）动力学**：核感受绝热力的布居加权平均；
- **Surface hopping（面跳跃）**：模拟轨迹系综，每条轨迹每步核在一个势能面上运动，但允许随机跳到其他面（调整动量守恒能量）。合适的跳跃规则使轨迹系综平均复现演化中的态布居与相关可观测量，而单条轨迹保持分段绝热运动。

> **思考题**
> 1. Hellmann-Feynman 定理为什么说"核上的力只依赖基态密度"？这对 DFT 的意义是什么？
> 2. 为什么说动能项是"奇异微扰"？它对 BO 近似的层级结构有什么影响？
> 3. Berry 联络为什么可以类比矢势？Berry 曲率为什么必须为零（电子系统时间反演不变时）？
> 4. Landau-Zener 隧穿的两个极限条件如何理解？Stokes 相位什么时候重要？
