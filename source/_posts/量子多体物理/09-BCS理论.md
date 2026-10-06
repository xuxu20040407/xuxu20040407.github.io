---
title: 09 BCS理论
mathjax: true
date: 2026-09-14 17:30:03
tags: 量子多体物理
categories: 量子多体物理
cover:
---

- [历史与思路](#历史与思路)
- [声子介导的电子-电子吸引](#声子介导的电子-电子吸引)
  - [Einstein 声子与一般声子](#einstein-声子与一般声子)
  - [Jellium 模型：Bardeen-Pines 相互作用](#jellium-模型bardeen-pines-相互作用)
- [Cooper 对](#cooper-对)
- [多体波函数](#多体波函数)
  - [BCS 变分波函数](#bcs-变分波函数)
  - [能量最小化与能隙方程](#能量最小化与能隙方程)
  - [基态性质与激发态](#基态性质与激发态)
- [BCS 平均场理论](#bcs-平均场理论)
  - [平均场分解与 Bogoliubov 变换](#平均场分解与-bogoliubov-变换)
  - [非零温度与临界温度](#非零温度与临界温度)
  - [自由能及其 Ginzburg-Landau 约化](#自由能及其-ginzburg-landau-约化)
  - [电流响应](#电流响应)
- [场论途径](#场论途径)
  - [Hubbard-Stratonovich 变换](#hubbard-stratonovich-变换)
  - [Ginzburg-Landau 自由能的微观推导](#ginzburg-landau-自由能的微观推导)
- [为什么是超导的](#为什么是超导的)
- [U(1) 对称性破缺的本质](#u1-对称性破缺的本质)
- [BCS 理论的其他应用：电荷/自旋序](#bcs-理论的其他应用电荷自旋序)

# 历史与思路

二战后超导微观理论的探索蓬勃发展。1950 年 Fröhlich 指出电子-声子相互作用在低能下能产生有效电子-电子吸引；同年 Maxwell 和 Reynolds 等人发现汞的同位素效应：原子质量越小的汞样品超导临界温度越低。这些工作指向声子在超导中的重要作用。继 Pippard 的非局域电动力学和 Bardeen 关于超导体中存在电子能隙的洞见之后，1956 年 Cooper 发现 **Cooper 失稳**：费米海中两个电子在声子介导的吸引相互作用下倾向于形成束缚态（**Cooper 对**）。1957 年 Schrieffer 做出多体波函数的关键假设后，Bardeen、Cooper、Schrieffer 建立了超导的微观理论——**BCS 理论**。

BCS 理论不仅成功描述常规超导体，其"配对"等术语也用于 BCS 无法解释的高温超导。它还是理解电荷/自旋密度波、激子绝缘体等多体现象的范式，一般被视为非平凡量子多体问题最成功的微观理论。超导中自发 $U(1)$ 对称破缺的解释由 P. W. Anderson 给出，后被引入高能物理，导致 **Anderson-Higgs 机制**和质量起源，推动了 Yang-Mills 理论的广泛接受。

# 声子介导的电子-电子吸引

电子穿过晶格时使周围离子畸变，形成局域正电荷密度增大的区域。第二个电子被这个正电荷区域吸引，等效地导致两电子之间吸引。有时这种声子介导吸引超过电子间的库仑排斥，使它们形成束缚态（Cooper 对）——这是 BCS 理论在两电子层次的理解。

## Einstein 声子与一般声子

> 【配图】图 9.1.1：(a) 实空间示意：两个电子因晶格畸变产生有效吸引；(b) 声子介导电子-电子相互作用 $V_{eff}(q,\omega)$ 的费曼图；(c) 有效相互作用的频率依赖 $V_{eff}(q,\omega)$。

考虑 Einstein 声子（频率与动量无关，是光学声子的合理近似）。聚焦于不伴随电偶极、无长程库仑场的 Raman 声子模：相当于每个晶胞一个固有频率 $\omega_0$ 的谐振子。局域拉格朗日量（局域声子位移 $X$ 与局域电子密度 $\rho_e$ 线性耦合，耦合常数 $\lambda$）：

$$
L = \frac12\left(-\dot X^2 + \omega_0^2X^2\right) + \lambda\rho_eX
$$

若电子密度演化足够缓慢，晶格绝热响应：$X = -\frac{\lambda}{\omega_0^2}\rho_e$。它反过来对电子密度施加势：

$$
F = -\partial_{\rho_e}L = -\lambda X = \frac{\lambda^2}{\omega_0^2}\rho_e, \qquad V(\rho_e) = -\frac{\lambda^2}{2\omega_0^2}\rho_e^2 = V_{eff}\rho_e^2
$$

势的负号意味着电子偏好局域聚集——这是**吸引的局域密度-密度相互作用**。正比于 $-\lambda^2$，介导势总为负，与电子-声子耦合常数的符号无关！这是"某个东西与谐振子自由度线性耦合"的一般现象（除少数特殊情形）。物理图像：第一个电子局域畸变晶格，晶格反馈负势吸引第二个电子。另一种理解：每个电子都按降低耦合能 $\sim-\lambda^2(N_e)^2$（$N_e=1$）的方向局域畸变晶格；两个电子聚在一起时能量 $-\lambda^2(2)^2$ 比各自能量之和小。

> **问题 9.1.1**：我们把声子当经典谐振子。若声子做量子化处理，介导相互作用会变吗？
> **问题 9.1.2**：电子间库仑相互作用来自与光子的线性耦合，为什么它是排斥而非吸引的？
> **问题 9.1.3**：还能找到其他与谐振子自由度耦合产生负势的例子吗？

> 超越绝热极限：求解 $X$ 的运动方程 $(\partial_t^2+\gamma\partial_t+\omega_0^2)X = -\lambda\rho_e$（$\gamma$ 是声子耗散项），对频率 $\omega$ 振荡的电子密度，晶格响应 $X(\omega) = \frac{-\lambda}{-\omega^2-i\gamma\omega+\omega_0^2}\rho_e(\omega)$，得到**频率依赖**的相互作用核 $V_{eff}(\omega) = \frac{\lambda^2}{2(\omega^2+i\gamma\omega-\omega_0^2)}$。物理上这意味着相互作用在时间上**非瞬时**：声子模需要时间响应电子并反馈，即**推迟**（retardation）。

量子力学地推导声子介导相互作用可用路径积分：虚时间配分函数 $Z = \int D[X,\bar\psi,\psi]e^{-S}$，其中 $S$ 含声子项 $\int_0^\beta d\tau dr\left[\frac12(\partial_\tau X)^2 + \frac12\omega_0^2X^2 + \lambda\rho_e\cdot X\right] + S_e[\bar\psi,\psi]$。**积掉声子 $X$** 得电子有效作用量：

$$
S_{eff}[\bar\psi,\psi] = \sum_{\omega_n}\int dr^d\,\frac{\lambda^2}{2[(i\omega_n)^2-\omega_0^2]}\rho_e(r,\omega_n)\rho_e(r,-\omega_n) + S_e[\bar\psi,\psi]
$$

第一项就是声子介导的电子-电子相互作用。路径积分语言里玻色子介导相互作用更自然（有明确的"积掉"程序），推迟效应（频率依赖）也自然纳入。

对一般色散的声子，式 (9.1.4) 推广为 $L = \sum_q\frac12\left(-\dot X_{-q}\dot X_q + \omega_q^2X_{-q}X_q\right) + \sum_q\lambda_q\rho_q X_{-q}$，有效核替换为：

$$
V_{eff}(\omega,q) = \mathrm{Re}\left[\frac{\lambda_q\lambda_{-q}}{2(\omega^2+i\gamma\omega-\omega_q^2)}\right]
$$

量子力学正则形式主义中，它不是哈密顿量的一项，而是微扰计算常用的图：值等于 $X$ 传播子乘电子-声子耦合顶点 $v_{eff}(i\Omega_n,q) = \frac{\lambda_q\lambda_{-q}}{2((i\Omega_n)^2-\omega_q^2)}$。

## Jellium 模型：Bardeen-Pines 相互作用

考虑更接近金属现实的 3D Jellium 模型：电子与离子集合，电子-电子、电子-离子、离子-离子间都有库仑相互作用。电子-声子相互作用已蕴含在库仑相互作用中。

> 【配图】图 9.1.2：(a) Bardeen-Pines 屏蔽相互作用 $V_{eff}(q,\omega)$ 的图表示（细波浪线是裸库仑、蓝泡是电子不可约极化、虚线是离子极化）；(b) 电子诱导离子位移从而吸引另一电子的示意；(c) 固定 $q$ 下 $V_{eff}(q,\omega)$ 的频率依赖（声子频率以下为负即吸引）。

如何算电子的屏蔽势 $V_{eff}(q,\omega) = V_q/\epsilon(q,\omega)$？先要知道介电函数 $\epsilon(\omega,q) = 1 - V_q(\chi^{(0)}_e(\omega,q) + \chi^{(0)}_i(\omega,q))$，$\chi_e^{(0)}$、$\chi_i^{(0)}$ 分别是电子和离子的极化函数。离子极化可经典计算：总电势 $\phi_{tot}$ 中离子位移满足 $m_i\ddot X = eE_{tot} = -e\nabla\phi_{tot}$，得响应电荷密度、极化函数：

$$
\rho_i(q,\omega) = -en_i\nabla\cdot X = \frac{n_ie^2q^2}{m_i\omega^2}\phi_{tot} = e^2\chi^{(0)}_i(\omega,q)\phi_{tot}
$$

$n_i$ 是离子密度（与电子密度同量级）。因为主要关心费米面附近电子散射（能量改变小于动量改变 $\omega\ll v_Fq$），只需 Thomas-Fermi 区的电子极化 $\chi^{(0)}_e(\omega,q) = -\nu$。电子的屏蔽势：

$$
V_{eff}(q,\omega) = \frac{4\pi e^2\omega_q^2}{(q^2+q_{TF}^2)(\omega^2-\omega_q^2)}\left(1 + \frac{\omega_q^2}{\omega^2-\omega_q^2}\frac{q_{TF}^2}{q^2+q_{TF}^2}\right)^{-1}\cdots
$$

其中 $\omega_q^2 = \frac{4\pi n_ie^2}{m_i}\frac{q^2}{q_{TF}^2+q^2}$ 是动量 $q$ 的纵向声学声子频率的平方。取决于波矢 $q$，它在声子频率 $\omega_q$ 以下为负（电子间吸引），如图 9.1.2(c)。这就是 Bardeen-Pines 推导的相互作用（继 Fröhlich 之后）。

> **副产品**：得到金属中纵向声学声子的色散。长波极限声速 $v_L^2 \sim \frac{4\pi n_ie^2}{m_iq_{TF}^2} = \frac{4\pi n_ie^2}{m_i4\pi e^2\nu} \sim \frac{m_e}{m_i}\frac{v_F^2}{2}$ 量级。物理上：若只考虑离子间长程库仑作用，纵向声子是等离子体振荡（有能隙）；电子屏蔽使离子间相互作用变短程，声子才成为声学型。
>
> **问题 9.1.4**：静态极限下若离子是费米子，其密度响应应为常数（如电子费米气体）。但式 (9.1.12) 预言 $\chi_i^{(0)}$ 在非零 $q$ 下随 $\omega\to0$ 发散。为什么我们仍能用式 (9.1.11) 描述离子运动？

# Cooper 对

金属多电子体系的低能有效哈密顿量中，可把电子-电子相互作用换成有效相互作用：

$$
H = \sum_{k\sigma}\xi_{k\sigma}c^\dagger_{k\sigma}c_{k\sigma} + \frac12\sum_{k_1\sigma_1,k_2\sigma_2,q}V_{eff}(q)c^\dagger_{k_1-q\sigma_1}c^\dagger_{k_2+q\sigma_2}c_{k_2\sigma_2}c_{k_1\sigma_1}
$$

相互作用对频率的依赖无法写进不含声子自由度的哈密顿量。为得到简单哈密顿量形式，常近似为：

$$
V_{ee} = -\sum_{k,k',q}g_{k',k}\,c^\dagger_{k'+q,\uparrow}c^\dagger_{-k'+q,\downarrow}c_{-k+q,\downarrow}c_{k+q,\uparrow}, \qquad g_{k',k} =
\begin{cases}
g, & |\xi_k|\leq\Lambda\\
0, & |\xi_k|>\Lambda
\end{cases}
$$

$g>0$。$g_{k',k}$ 是（自旋单重态）电子对从动量 $(k+q,-k+q)$ 散射到 $(k'+q,-k'+q)$ 的强度，忽略了自旋三重态。$q$ 是对质心动量，通常远小于 $k$。取 $q=0$：初末态都位于 $-\Lambda<\xi_k<\Lambda$ 的能量壳层内时电子才感受到吸引 $g$。取截断 $\Lambda = \omega_D$（声子 Debye 频率），式 (9.2.2) 就是金属中屏蔽且声子介导相互作用的简化模型。

> 【配图】图 9.2.1：(a) 电子对从 $|k\rangle = c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}|G\rangle$ 散射到 $|k'\rangle$；(b) 束缚态条件的图解。

Cooper 意识到：这样的吸引相互作用下，费米面附近的电子对费米面有形成束缚态对的**失稳**。先按历史顺序处理 Cooper 的"费米海之上两电子"问题。为简单起见关注零质心动量对：

$$
|k\rangle = c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}|G\rangle
$$

吸引相互作用只混合零动量对子空间内的态。此子空间的哈密顿量：

$$
H = \sum_k 2\xi_k|k\rangle\langle k| - g\sum_{k,k'}|k'\rangle\langle k|
$$

两电子束缚态是此哈密顿量的负能本征态。写 $|\phi\rangle = \sum_{k>k_F}\phi_k|k\rangle$，波函数满足：

$$
E\phi_k = 2\xi_k\phi_k - g\sum_{k'}\phi_{k'} \quad\Rightarrow\quad \frac{1}{g} - \frac{1}{E-2\xi_k}\phi_k = \sum_{k'}\phi_{k'}
$$

对 $k$ 求和得本征能量条件：

$$
-\frac1g = \sum_{0<\xi_k<\Lambda}\frac{1}{E-2\xi_k} \equiv f(E)
$$

函数 $f(E)$ 在每个正 $E = \xi_k$ 处有极点。从图 9.2.1(b) 可见，对吸引相互作用 $-g<0$，确实存在束缚态解 $E_0<0$。

大费米面下单电子态密度几乎为常数，$f(E)$ 可解析计算：

$$
f(E) = \nu\int_0^\Lambda d\xi\frac{1}{E-2\xi} = -\frac\nu2\ln\frac{2\Lambda-E}{-E}
$$

束缚态解：

$$
E_0 = -\frac{2\Lambda}{e^{2/g\nu}-1} \xrightarrow{g\nu\ll1} -2\Lambda e^{-2/g\nu}
$$

两体束缚态叫 **Cooper 对**。注意**无论吸引相互作用 $g$ 多弱，束缚态总是存在**！我们知道自由空间中任意弱吸引在 1D、2D 产生束缚态；为什么 Cooper 问题在 3D 也能如此？答案是：费米海背景把两体问题有效降维成 2D（两个电子只能在费米面附近的壳层内散射）。

与自由电子基态相比，费米面上的两个电子形成 Cooper 对降低能量 $|E_0|$。形成更多对进一步降低能量。因此费米面**对形成大量 Cooper 对失稳**——这就是 **Cooper 失稳**。

> **问题 9.2.1**：为什么用反平行自旋构造对？
> **问题 9.2.2**：哈密顿量中用屏蔽相互作用替换有什么逻辑？不会双重计数吗？

# 多体波函数

定义 Cooper 对产生算符：

$$
b^\dagger = \sum_k\phi_k c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}
$$

按 Cooper 失稳，从费米海 $|G\rangle$ 出发加 Cooper 对 $b^{\dagger N}|G\rangle$ 可降低能量。加多少对能量最低？对加太多时费米面变模糊，9.2 节的两电子束缚态不再存在。此点可由 Cooper 对的动量不确定度 $\delta k = |E_0|/v_F$ 估计（其电子云的动量壳层宽度）。当壳层被其他对填满时配对被显著抑制，这发生在对数 $N\sim N_0|E_0|/E_F$（$N_0$ 是自由态电子数）时。粗略地说能量在此处最小，节省能量 $E_c\sim N|E_0|\sim N_0|E_0|^2/E_F$——这是 BCS 结果的相当好的近似。但即使在加对之前，$|G\rangle$ 本身也应被吸引相互作用形变。要建立良定义的理论，必须找到不依赖 $|G\rangle$ 的加对方式。

> 【配图】图 9.3.1：BCS 基态的性质。(a) 准粒子激发能 $E_k$ 对 $\xi_k$；(b) 系数 $(u_k,v_k)$ 与 Cooper 对波函数 $\phi_k$；(c) 动量空间占据 $n_{k,\sigma}$；(d) BCS 基态的实空间图像：充满相同的 Cooper 对。

另一种方式是从真空 $|0\rangle$ 出发加对 $b^{\dagger N}|0\rangle$ 并变分 $\phi_k$ 最小化能量。但这个固定电子数的态不能方便地写成按动量标记子系统的直积，变分计算困难。把配对态写成乘积态的好办法是 Cooper 对的"玻色相干态"：

$$
|BCS\rangle = \frac1Z e^{b^\dagger}|0\rangle = \frac1Z e^{\sum_k\phi_kc^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}}|0\rangle = \prod_k\left(\frac{1}{\sqrt{1+\phi_k^2}} + \frac{\phi_k}{\sqrt{1+\phi_k^2}}c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}\right)|0\rangle \equiv \prod_k\left(u_k + v_kc^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}\right)|0\rangle
$$

这是 BCS 变分基态波函数：不同电子数态的叠加。把每对单粒子态 $(k\uparrow,-k\downarrow)$ 看作子系统，此波函数是子系统直积——简化了能量求值。这正是 Schrieffer 1957 年 1 月在纽约地铁上想到的（当时他是 Bardeen 在伊利诺伊大学的博士生）。

对零质心动量对，可用式 (9.2.1) 的简化版本——**BCS 哈密顿量**：

$$
H = \sum_{k\sigma}\xi_{k\sigma}c^\dagger_{k\sigma}c_{k\sigma} + \sum_{kk'}V_{kk'}a^\dagger_{k'}a_k, \qquad a_k = c_{-k\downarrow}c_{k\uparrow}
$$

此哈密顿量守恒电子数（$U(1)$ 对称性：$\hat U^\dagger H\hat U = H$，$\hat U = e^{i\varphi\hat N}$，$\hat U^\dagger c_{k,\sigma}\hat U = c_{k,\sigma}e^{i\varphi}$）。剩余任务是优化 $\phi_k$ 最小化能量 $F = \langle BCS|H|BCS\rangle$。

## 能量最小化与能隙方程

试验态期望值（吉布斯自由能，因为哈密顿量中减了 $\mu N$）：

$$
F = \langle BCS|H|BCS\rangle = \sum_k 2\xi_k|v_k|^2 + \sum_{kk'}V_{kk'}(v_{k'}^*u_{k'})(u_k^*v_k)
$$

约束 $|u_k|^2 + |v_k|^2 = 1$ 用拉格朗日乘子 $E_k$ 处理。对 $(u_k,v_k)$ 变分：

$$
\delta F = \sum_k\left(\delta u_k^*,\ \delta v_k^*\right)\begin{pmatrix}\xi_k & \Delta_k\\ \Delta_k^* & -\xi_k\end{pmatrix}\begin{pmatrix}u_k\\v_k\end{pmatrix} + c.c., \qquad \Delta_k = |\Delta_k|e^{i\theta_k} \equiv -\sum_{k'}V_{kk'}u_{k'}v_{k'}^*
$$

变分条件 $\delta F = 0$ 给出：

$$
\begin{pmatrix}u_k\\v_k\end{pmatrix} = \frac{1}{\sqrt{(\xi_k+E_k)^2+|\Delta_k|^2}}\begin{pmatrix}\xi_k+E_k\\-\Delta_k^*\end{pmatrix} = \frac{1}{\sqrt2}\begin{pmatrix}\sqrt{1+\frac{\xi_k}{E_k}}\\ -\sqrt{1-\frac{\xi_k}{E_k}}e^{-i\theta_k}\end{pmatrix}, \qquad E_k = \pm\sqrt{\xi_k^2+|\Delta_k|^2}
$$

每个 $k$ 因 $E_k$ 符号有无穷多鞍点解。检查 $F$ 可知最低能量态对应 $E_k = |E_k|$。

**能隙方程**：解需同时满足式 (9.4.7) 和 $\Delta_k$ 的定义：

$$
\Delta_k = -\sum_{k'}V_{kk'}\frac{\Delta_{k'}}{2E_{k'}}
$$

叫**能隙方程**，因为 $\Delta_k$ 是准粒子激发的能量隙。注意：若解乘整体相位 $\Delta_k\to\Delta_ke^{i\varphi}$ 仍是解、$E_k$ 不变，因此基态有被 $\varphi$ 标记的巨大简并。选取特定相位就是自发破缺电荷守恒对应的 $U(1)$ 对称性。$\Delta$ 与 Ginzburg-Landau 理论序参量的相似性很明显，对称破缺本质上由图 8.1.1 描述。

用式 (9.2.2) 的相互作用，能隙方程简化为 $\Delta_k = \frac{g}{2}\sum_{k'}\frac{\Delta_{k'}}{E_{k'}} \equiv \Delta$（$\Delta_k$ 与 $k$ 无关的常数）：

$$
\frac{2}{g} = \sum_k\frac{1}{E_k} \approx \nu\int_{-\Lambda}^{\Lambda}d\xi\frac{1}{\sqrt{\xi^2+|\Delta|^2}} \approx 2\nu\ln\frac{2\Lambda}{|\Delta|}
$$

能隙为：

$$
|\Delta| = 2\Lambda e^{-1/g\nu}
$$

## 基态性质与激发态

$(u_k,v_k)$ 的绝对值如图 9.3.1。由 BCS 波函数，$|v_k|^2$ 是 $(k\uparrow,-k\downarrow)$ 对都被占据的概率，$|u_k|^2$ 是都空着的概率。非零能隙时 $|v_k|^2$ 从费米面下到费米面上从 1 平滑过渡到 0，电子占据数 $n_{k,\sigma} = \langle c^\dagger_{k,\sigma}c_{k,\sigma}\rangle$ 如图 (c)。Cooper 对波函数 $\phi_k = v_k/u_k$ 从费米动量以下的大值逐渐衰减到费米动量以上的零——即体系加入大量 Cooper 对后，只在费米面附近偏离费米海。零能隙极限 $\Delta\to0$ 时 $|v_k|^2$ 在费米面下为 1、上为 0，恢复无相互作用基态。BCS 基态实空间图像基本上是充满相同的 Cooper 对。

> **问题 9.3.1**：为什么 BCS 基态比费米海能量低？哪部分能量被降低了？考虑到吸引来自电子-声子相互作用，$|BCS\rangle$ 降低了什么能量、为什么？

**激发态**：把每个子系统 $(k\uparrow,-k\downarrow)$ 看作自旋量 $(u_k,v_k)$ 的二维希尔伯特空间（两态：都对空或都对占）。基态是每个 $E_k$ 取正值 $|E_k|$。激发态之一是把某个自旋量翻转（$E_k = -|E_k|$），其波函数与基态自旋量正交，能量在热力学极限下比基态高 $2|E_k|$。这叫**拆对激发**（pair breaking）。

> **Anderson 赝自旋**：子系统自旋量可看作赝自旋的波函数
> $$
> \vec\tau_k = \begin{pmatrix}u_k\\v_k\end{pmatrix}^*\vec\tau\begin{pmatrix}u_k\\v_k\end{pmatrix}
> $$
> 变分条件可理解为赝自旋对赝磁场 $\vec B_k = (\mathrm{Re}[\Delta_k],\mathrm{Im}[\Delta_k],\xi_k)$ 的耦合能 $\vec B_k\cdot\vec\tau_k$ 最小化。$\vec B_k\cdot\vec\tau_k = \mathrm{Re}[\Delta_k]\tau_{x,k}+\mathrm{Im}[\Delta_k]\tau_{y,k}+\xi_k\tau_{z,k} = (u_k^*,\ v_k^*)\begin{pmatrix}\xi_k&\Delta_k\\\Delta_k^*&-\xi_k\end{pmatrix}\begin{pmatrix}u_k\\v_k\end{pmatrix}$。$E_k = \pm|E_k|$ 两个解对应赝自旋平行/反平行于赝磁场。基态 = 所有赝自旋平行于赝磁场；拆对激发 = 翻转一个赝自旋。

> 【配图】图 9.3.2：Anderson 赝自旋的有效磁场：$\Delta_k=0$（上）时只有 $\xi_k$ 分量（在费米面处反转方向）；$\Delta_k\neq0$（下）时出现面内分量。

**固定粒子数态**：$\Delta_k\to\Delta_ke^{i\varphi}$ 给出同能量态：

$$
|BCS\rangle_\varphi = \prod_k\left(u_k + v_ke^{i\varphi}c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}\right)|0\rangle
$$

对 $\varphi$ 做傅里叶变换投影出 $2N$ 粒子态：

$$
|BCS\rangle_N = \int_0^{2\pi}d\varphi\,e^{-iN\varphi}|BCS\rangle_\varphi = \left(\sum_k\phi_kc^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}\right)^N|0\rangle
$$

这说明粒子数 $N$ 与相位 $\varphi$ 是共轭变量（像 $p$ 与 $x$）。$|BCS\rangle_N$ 粒子数固定但相位不确定。第一量子化语言更清楚：

$$
|BCS\rangle_N = \mathcal{A}(|\phi_{1,2}\rangle\otimes|\phi_{3,4}\rangle\otimes\cdots\otimes|\phi_{2N-1,2N}\rangle), \qquad \langle r_1,r_2|\phi_{1,2}\rangle = \phi(r_1-r_2)(|\uparrow\downarrow\rangle-|\downarrow\uparrow\rangle)
$$

$\mathcal{A}$ 是反对称化。基态图像更清晰了：$N$ 个相同 Cooper 对的集合。

BCS 理论常用 $|BCS\rangle_\varphi$（乘积态方便）。热力学极限下其粒子数不确定度与平均电子数之比趋于零（中心极限定理同 Gibbs 系综）。总数 $\bar N = \langle N\rangle = 2\sum_k|v_k|^2$，方差：

$$
\delta N^2 = \langle(N-\bar N)^2\rangle = 4\sum_k|u_k|^2|v_k|^2 \sim N\frac{\Delta}{E_F}, \qquad \frac{\delta N}{\bar N} = \frac{1}{\sqrt{\bar N}}\sqrt{\frac{\Delta}{E_F}} \xrightarrow{\bar N\to\infty} 0
$$

对 $\bar N = 10^{23}$、$\Delta/E_F = 10^{-3}$，比值约 $10^{-13}$。

> **超流态**：电流 $J = n\hbar q/m$ 的态可通过在动量空间平移 BCS 基态得到：$|q\rangle = T_q^\dagger|BCS\rangle = \prod_k\left(u_k+v_kc^\dagger_{k+q\uparrow}c^\dagger_{-k+q\downarrow}\right)|0\rangle$，每个 Cooper 对都以质心动量 $2q$ 运动。
>
> **问题 9.3.2**：Cooper 对多大（对中两电子平均距离）？用式 (9.3.2) 的束缚态波函数 $\phi_k$ 估计合理吗？

# BCS 平均场理论

本节的平均场形式与上一节变分波函数等价。为记号简单用与动量无关的相互作用：

$$
H_{BCS} = \sum_{k\sigma}\xi_kc^\dagger_{k\sigma}c_{k\sigma} - g\sum_{kk'}c^\dagger_{k'\uparrow}c^\dagger_{-k'\downarrow}c_{-k\downarrow}c_{k\uparrow}
$$

定义平均场（算符的期望值）：

$$
\Delta = g\left\langle\sum_k c_{-k\downarrow}c_{k\uparrow}\right\rangle, \qquad \Delta^* = g\left\langle\sum_k c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow}\right\rangle
$$

算符写为平均场加涨落，忽略涨落平方项（平均场近似），相互作用变：

$$
V_{ee} \approx -\Delta^*\sum_k c_{-k\downarrow}c_{k\uparrow} - \Delta\sum_k c^\dagger_{k\uparrow}c^\dagger_{-k\downarrow} + \frac{|\Delta|^2}{g}
$$

哈密顿量简化为二次型，用 **Bogoliubov 变换** 对角化：

$$
\begin{pmatrix}\gamma_{k\uparrow}\\ \gamma^\dagger_{-k\downarrow}\end{pmatrix} = U^\dagger\begin{pmatrix}c_{k\uparrow}\\ c^\dagger_{-k\downarrow}\end{pmatrix} = \begin{pmatrix}u_k^* & -v_k\\ v_k^* & u_k\end{pmatrix}\begin{pmatrix}c_{k\uparrow}\\ c^\dagger_{-k\downarrow}\end{pmatrix}, \qquad
\begin{pmatrix}u_k\\v_k\end{pmatrix} = \frac{1}{\sqrt{(\xi_k+E_k)^2+|\Delta|^2}}\begin{pmatrix}\xi_k+E_k\\ \Delta\end{pmatrix}, \quad E_k = \sqrt{\xi_k^2+|\Delta|^2}
$$

对角化后：

$$
H_m = \sum_{k\sigma}E_k\gamma^\dagger_{k\sigma}\gamma_{k\sigma} + \frac{|\Delta|^2}{g} + \sum_k(\xi_k-E_k)
$$

新算符 $\{\gamma_{k\uparrow},\gamma^\dagger_{-k\downarrow}\}$ 描述 **Bogoliubov 准粒子**——原费米子产生/湮灭算符的混合。它们仍是良定义的费米子（$U$ 酉，保持反对易关系）。BCS 基态是 Bogoliubov 准粒子的真空：$\gamma_{k\sigma}|BCS\rangle = 0$，满足的正是 $|BCS\rangle = \prod_k(u_k+v_kc^\dagger_{k\uparrow}c^\dagger_{-k\downarrow})|0\rangle$。自洽性要求式 (9.4.2) 成立，给出零温能隙方程：

$$
\Delta = g\sum_k u_k^*v_k = g\sum_k\frac{\Delta}{2E_k} \quad\Rightarrow\quad \frac1g = \sum_k\frac{1}{2E_k}
$$

注意本节 $\Delta$ 与 9.3 节相差复共轭。$\Delta$ 的相位不影响能量，但平均场解自发选择相位。$\Delta$ 有三个含义：平均场、能隙、序参量。

> **问题 9.4.1**：为什么式 (9.4.8) 的自洽条件与变分法的优化条件式 (9.3.7) 一致？
> **问题 9.4.2**：式 (9.4.5) 的平均场哈密顿量自发破缺了什么对称性？

**Bogoliubov 准粒子**：激发能 $E_k = \sqrt{\xi_k^2+|\Delta|^2}$ 如图 9.4.1。$\gamma^\dagger_{k\sigma}$ 激发一个 Bogoliubov 准粒子：增加能量 $E_k$、动量 $k$、自旋角动量 $\sigma$、电荷 $|u_k|^2-|v_k|^2$（单位电子电荷）。费米面以上很远（$\xi_k\gg|\Delta|$）$|u_k|\approx1$，准粒子像电子激发；费米面以下很远（$\xi_k\ll-|\Delta|$）$|v_k|\approx1$，像空穴激发；费米面附近 $|u_k|,|v_k|\approx1/\sqrt2$，准粒子电荷几乎为零——既不像电子也不像空穴，而是它们的线性组合。这是超导平均场 $\Delta$ 对激发谱影响最剧烈的低能区。

> 【配图】图 9.4.1：Bogoliubov 准粒子的能量-动量色散。$\xi_k\gg\Delta$ 时为电子激发（蓝色），$\xi_k\ll-\Delta$ 时为空穴激发（灰色），费米面附近 $E_k = \sqrt{\xi_k^2+\Delta^2}$ 有最小能量 $\Delta$。

加一个 Bogoliubov 准粒子 $\gamma^\dagger_{k\uparrow}|BCS\rangle$ 与加一个电子 $c^\dagger_{k\uparrow}|BCS\rangle$（归一化后）是同一个态。加两个准粒子 $\gamma^\dagger_{-k\downarrow}\gamma^\dagger_{k\uparrow}|BCS\rangle$ 对应翻转 $k$ 处的 Anderson 赝自旋。

> **问题 9.4.3**：式 (9.2.1) 的哈密顿量与电子数对易，每个本征态可用整数电子数标记（只能整体加或减一个电子）。那"电荷既非 $e$ 也非 $-e$ 的准粒子激发"是什么意思？
> **问题 9.4.4**：能激发处于 BCS 基态的超导体的光子最小能量是多少？

## 非零温度与临界温度

非零温度下体系遵循平均场哈密顿量 (9.4.5) 的热分布，Bogoliubov 准粒子按费米-狄拉克分布 $f_{k,\sigma} = 1/(e^{E_k/T}+1)$ 热激发。自洽能隙方程变为：

$$
\Delta = g\sum_k v_ku_k^*(1-f_{k\uparrow}-f_{-k\downarrow}) = g\sum_k\frac{\Delta}{2E_k}(1-2f_k) \quad\Rightarrow\quad \frac1g = \sum_k\frac{1-2f_k}{2E_k}
$$

从能隙方程解出 $\Delta(T)$。定性上温度升高使 $1-2f_k$ 减小；为保持积分等于 $1/g$，能隙须减小（分母 $E_k = \sqrt{\xi_k^2+\Delta(T)^2}$ 随之减小）。求**临界温度** $T_c$（能隙开始消失的点）：

$$
\frac{1}{g\nu} = \int_0^\Lambda d\xi\frac{\tanh[\xi/(2T_c)]}{2\xi} = \ln[C_0\Lambda/T_c]
$$

$$
T_c = C_0\Lambda e^{-1/g\nu} \approx 1.13\Lambda e^{-1/g\nu} \approx 0.567\Delta(0)
$$

其中 $C_0 = 2e^\gamma/\pi$，$\gamma\approx0.577$ 是欧拉常数，$\Delta(0)$ 是零温能隙。$T_c/\Delta(0)$ 的比值在大多数常规超导中得到约 20% 误差内的证实。

> **问题 9.4.5**：熟悉能隙方程。若截断 $\Lambda\gg T_c,\Delta(0)$，$\Delta(T)$ 作为温度的函数可写成只由临界温度决定的普适函数 $\Delta(T,T_c)$，参数 $g,\nu,\Lambda$ 全部消去。试证明。

## 自由能及其 Ginzburg-Landau 约化

把 $\Delta$ 暂视为参数（忘掉自洽条件），从平均场哈密顿量定义自由能：

$$
F = \langle H - TS\rangle = \sum_k\left[-2T\ln\left(1+e^{-E_k/T}\right) + (\xi_k-E_k)\right] + \frac{|\Delta|^2}{g}
$$

零温可计算为：

$$
F = \sum_k(|\xi_k|-E_k) + \frac{|\Delta|^2}{g} \xrightarrow{|\Delta|\ll\Lambda} -\nu|\Delta|^2\ln\frac{2\Lambda}{|\Delta|} + \frac{|\Delta|^2}{g}
$$

自由能如图 9.4.2 左，$|\Delta|$ 从零变非零时明显降低。因为对数项，无论 $g$ 多小 $|\Delta|=0$ 处 $\partial_{|\Delta|}F < 0$——这就是 **BCS 失稳**。由 $\partial_{|\Delta|}F=0$ 求极小的能隙与零温能隙方程等价，得 $|\Delta_0|\approx2\Lambda e^{-1/g\nu}$，与式 (9.3.9) 一致。

**$T_c$ 附近的 Ginzburg-Landau 约化**：$T\gg|\Delta|$ 时把自由能按 $|\Delta|$ 展开（$E_k = |\xi| + \frac{|\Delta|^2}{2|\xi|} + O(\Delta^4)$）：

$$
F[\Delta,T] \xrightarrow{|\Delta|\ll T} F(0) - \sum_k|\Delta|^2\left(\frac{1-2f(|\xi_k|)}{2|\xi_k|}\right) + \frac{|\Delta|^2}{g} + O(\Delta^4) = F(0) + \alpha(T)|\Delta|^2 + \beta(T)|\Delta|^4 + \cdots
$$

约化为 GL 理论自由能。系数 $\alpha(T)$ 从 BCS 理论得出：

$$
\alpha(T) = \frac1g - \nu\int_0^\Lambda d\xi\frac{1-2f(\xi)}{\xi} \approx \frac1g - \nu\ln\frac{C_0\Lambda}{T}
$$

$T = T_c = C_0\Lambda e^{-1/g\nu}$ 时 $\alpha=0$ 对应临界温度。GL 理论适用于 $T$ 靠近 $T_c$（$|\Delta|\ll T$），此时二次项系数可近似 $\alpha\approx\nu(T-T_c)/T_c$。

> 【配图】图 9.4.2：左——自由能对 $|\Delta|$（基态/热态选择使自由能最小的能隙）；右——平衡能隙随温度：低温区（蓝）自由能可用对数形式，GL 区（红）自由能可按能隙幂次展开。

## 电流响应

讨论对静态横向矢势 $A(r) = A_\perp e^{iq\cdot r}$（对应波矢 $q$ 的磁场）的电流响应。电流算符 $J = J_P + J_D$，对抛物带 $\xi(k) = k^2/(2m)-\mu$ 抗磁电流 $J_D(r) = -A\frac1m\rho(r)$。顺磁电流用 Bogoliubov 准粒子表示。零波矢极限下 $J_P = A\sum_{k,\sigma}v_k\gamma^\dagger_{k,\sigma}\gamma_{k,\sigma}$（$v_k = \partial_k\xi_k$）——Bogoliubov 准粒子对电流的贡献只是 $v_k = k/m$ 而非 $\partial_kE_k$。

计算静态电流响应 $J = -D(q)A_\perp = -(\frac nm + \chi_P(q))A_\perp$。取 $q\to0$ 只留准粒子带内电流。$\chi_P$ 用准粒子格林函数算电流-电流关联：

$$
\chi_P(q\to0) = 2\sum_k v_y^2\frac{\partial_E f(E)}{\partial_{\xi_x}E\partial_k} \cdots \approx \frac{2}{d}\nu\int d\xi\,\partial_E f(E)
$$

（最后一个近似因速度 $v_k = \partial_k\xi_k$ 和态密度在 $\partial_Ef$ 的有效积分范围内变化很小。）利用 $\nu\frac{v_F^2}{d} = \frac nm$，得：

$$
J = -\frac{n_s}{m}A_\perp, \qquad \frac{n_s}{n} = \int_{-\infty}^\infty d\xi\left[-\partial_\xi f(\xi) + \partial_Ef(E)\right] = \frac{7\zeta(3)}{4\pi^2}\frac{|\Delta|^2}{T_c^2} + O(|\Delta|^4)
$$

其中找到**超流密度** $n_s$。$T>T_c$ 时 $E = \xi$，顺磁电流（积分第二项）与抗磁电流（第一项）完美抵消，总电流为零。$T<T_c$ 时顺磁电流变小、不能完全抵消抗磁电流，剩余的就是**超流**。这就是产生 Meissner 效应的 **London 方程**。这个电流响应说明：横向矢势存在时存在持久电流，局域正比于矢势，零动量极限下也不消失。$n_s$ 的温度依赖见图 9.4.2 右。清洁超导体（准粒子散射率小，$\gamma\ll T_c$）零温下 $n_s = n$。

# 场论途径

场积分途径引入辅助序参量场 $\Delta(r,t)$ 作为可涨落的自由度，其鞍点对应 BCS 平均场序参量。此形式主义使 Ginzburg-Landau 理论的微观推导更良定义。

式 (9.2.1) 多电子体系的配分函数可写成虚时间路径积分：

$$
Z = \int D[\bar\psi,\psi]e^{-S[\bar\psi,\psi]}, \qquad S = \int_0^\beta d\tau\int dr\left[\sum_\sigma\bar\psi_\sigma(x)(\partial_\tau+\xi(\hat p))\psi_\sigma(x) - g\bar\psi_\uparrow(x)\bar\psi_\downarrow(x)\psi_\downarrow(x)\psi_\uparrow(x)\right]
$$

$\psi_\sigma(r,\tau)$ 是电子格拉斯曼场。因相互作用项路径积分不是高斯型、难以计算。下一步用 **Hubbard-Stratonovich 变换**引入辅助场 $\Delta$（Cooper 配对的洞见启发分解）：

$$
Z = \frac1C\int D[\bar\psi,\psi,\Delta^*,\Delta]e^{-S}, \qquad S = \int dx\left[\sum_\sigma\bar\psi_\sigma(\partial_\tau+\xi(\hat p))\psi_\sigma + \Delta(x)\bar\psi_\uparrow\bar\psi_\downarrow + \Delta^*(x)\psi_\downarrow\psi_\uparrow + \frac1g\Delta^*\Delta\right]
$$

即 $S = \int dx\begin{pmatrix}\bar\psi_\uparrow&\psi_\downarrow\end{pmatrix}\begin{pmatrix}\partial_\tau+\xi(\hat p)&\Delta\\\Delta^*&\partial_\tau-\xi(-\hat p)\end{pmatrix}\begin{pmatrix}\psi_\uparrow\\\bar\psi_\downarrow\end{pmatrix} + \frac1g\int dx\,\Delta^*\Delta$。

这是式 (9.5.1) 的**精确等价表示**，但费米场变成自由费米子，代价是引入辅助玻色场 $\Delta(r,\tau)$ 需要积分。若积分掉 $\psi$，得配分函数 $Z = Z_0\int D[\Delta^*,\Delta]e^{-S_{GL}[\Delta^*,\Delta]}$，$S_{GL}$ 叫 **Ginzburg-Landau 作用量**，其拉格朗日密度 $\mathcal{L}_{GL}$ 是时空依赖序参量场 $\Delta(r,\tau)$ 的 Ginzburg-Landau 自由能密度泛函的推广。

> **Hubbard-Stratonovich 变换**：基于高斯积分恒等式
> $$
> \exp[gA^*A] = \frac1C\int D[\Delta^*,\Delta]\exp\left[-\frac1g(\Delta^*+gA^*)(\Delta+gA)+gA^*A\right] = \frac1C\int D[\Delta^*,\Delta]\exp\left[-\frac1g\Delta^*\Delta - \Delta A^* - \Delta^*A\right]
> $$
> 实变量版本更简单：$\int dx\,e^{-ax^2+bx\varphi} = \sqrt{\frac\pi a}e^{\frac{b^2}{4a}\varphi^2}$，$S[x,\varphi] = -ax^2+bx\varphi$，积分掉 $x$ 得 $S_{eff}[\varphi] = \frac{b^2}{4a}\varphi^2$。经典（鞍点）层次：对每个 $\varphi$ 用鞍点 $x_m = b\varphi/(2a)$ 近似，$S_{eff}[\varphi] = S[x_0,\varphi] = \frac{b^2}{4a}\varphi^2$。因对 $x$ 的积分是高斯积分，鞍点法（经典近似）给出**精确**的有效作用量；有 $x^4$ 等高阶项时经典近似不精确，有涨落修正。

**平均场 = 鞍点**：平均场近似用鞍点近似场积分，即满足 $\delta S_{GL}/\delta\Delta = 0$ 的构型。鞍点场必须时空均匀：$\Delta(r,\tau) = \Delta$，正是平均场序参量。鞍点条件 $\delta S_{GL}/\delta\Delta^* = 0$ 给出 $\Delta = g\langle\sum_k c_{-k\downarrow}c_{k\uparrow}\rangle$，即式 (9.4.2) 的自洽条件。

> **问题 9.5.1**：$\psi(r)\to\psi(r)e^{i\varphi}$ 的 $U(1)$ 对称性导致电荷守恒（Noether 流是 $(\rho,j)$）。式 (9.5.2) 的作用量有这个 $U(1)$ 对称性吗？式 (9.5.5) 的平均场作用量（序参量场固定值而非待积分涨落场）有吗？
> **问题 9.5.2**：与费米海相比，BCS 态降低了哪种能量？动能还是相互作用能？

## Ginzburg-Landau 自由能的微观推导

$T$ 靠近 $T_c$ 时 GL 自由能展开为：

$$
F[\Delta,T] = F_0 + \sum_q\alpha_q(T)\Delta^*_q\Delta_q + V\beta(T)|\Delta|^4 + \cdots
$$

加静态电磁矢势后导出 GL 自由能泛函：

$$
F[\Delta,A,T] = \int dr\left[f_0 + \alpha(T)|\Delta|^2 + c_\xi\left|\left(\nabla+i\frac{2e}{c\hbar}A\right)\Delta\right|^2 + \beta(T)|\Delta|^4 + \cdots\right]
$$

若把复玻色场 $\Delta(r)$ 视为那里的序参量场（$\Delta(r) = T_c\psi(r)$），这就是式 (8.1.1) 精确对应。其中 $\alpha(T)\approx\frac1g-\nu\ln\frac{C_0\Lambda}{T}\approx\nu(T-T_c)/T_c$，$c_\xi = \frac{c_s n}{mT^2}$，$\beta(T) = \frac{c_\beta\nu}{T^2}$（$c_s,c_\beta$ 是 $O(1)$ 常数）。凝聚能量密度 $E_c\sim\nu T_c^2\sim n\Delta_0^2/E_F$（$\nu\sim n/E_F$、$T_c\sim\Delta_0$），裸相干长度 $\xi_0\sim\sqrt{n/\nu}/(mT_c)\sim v_F/\Delta_0$（约零温 Cooper 对大小），超流密度 $n_s\sim n\Delta^2/T_c^2$。

矢势以式 (9.5.7) 的"**最小耦合**"方式进入 GL 自由能，天然保证规范不变性。为什么必须是这个形式？现在能从 BCS 理论证明：矢势在电子-序参量耦合作用量中按 $\hat p + A$ 进入（$\partial_\tau+\xi(\hat p+A)$、$\partial_\tau-\xi(-\hat p+A)$）。做规范变换 $\Delta(r)\to\Delta(r)e^{i\varphi(r)}$、$A(r)\to A(r)-\frac{c\hbar}{2e}\nabla\varphi$ 后，对费米场做变量代换 $\psi_\sigma(x) = \psi'_\sigma(x)e^{i\varphi(r)/2}$（不引入体积因子），费米部分的相位因子全部消失。因此积分掉费米子后 GL 作用量显然不变——最小耦合形式由规范不变性必然导致。

> **Anderson-Higgs 机制**：3D 中电磁场自由拉格朗日量 $\mathcal{L}_{EM} = -\frac1{16\pi}F_{\mu\nu}F^{\mu\nu}$ 没有 $A^2$ 项（规范不变性要求），自由光子无质量。但介质中的光子（如式 (9.5.7) 描述）不同：序参量场 $\Delta(r,\tau)$ 在破缺态有非零平均场值及其上涨落 $\Delta = \Delta + \delta(r,\tau) + i\theta(r,\tau)$（$\delta$、$\theta$ 是振幅和相位自由度）。$\theta(r,\tau)$ 是破缺态的 **Goldstone 模**（无能隙色散）。从式 (9.5.7) 的梯度项可见，$\theta$ 场可看作"填补"A 的规范冗余，组合成三个分量都物理的矢量场并获得质量 $|\Delta|^2A^2$：相位模消失并与电磁场结合成有质量的"光子"（色散出现能隙）。这个非零质量对应电磁场进入超导体的指数衰减。高能物理中同样机制：Higgs 场自发对称破缺给其耦合的规范玻色子质量。

# 为什么是超导的

**从电流响应看**（9.4.2 节与 GL 理论）：线性响应的 $(\omega,q)$ 平面上处于 $\omega\ll q$ 区。BCS 态超导是因为 Bogoliubov 准粒子的顺磁电流响应不足以抵消抗磁电流 $J_D = \frac nm A$，剩余超流。这是区分超导体与理想金属的标志：理想金属没有 Meissner 效应。

第二视角（均匀动力学矢势 $A(t)$，即均匀电场 $E = -\partial_tA/c$，处于 $\omega\gg q$ 区）：金属中光学电导率 $\sigma = \sigma_D + \sigma_P$。抗磁电流贡献 $\sigma_D(\omega) = \frac nm\frac{i}{\omega}$（看似"超导"）；动量弛豫散射（如杂质）使顺磁电流贡献 $\sigma_P(\omega) = \frac nm\frac{1}{\omega}\frac{i\gamma}{\omega+i\gamma}$，把零频极点变为 Drude 极点。BCS 态中顺磁响应来自热激发的 Bogoliubov 准粒子，可推导为 $\sigma_P(\omega) = \frac{n_n}{m}\frac{1}{\omega}\frac{i\gamma}{\omega+i\gamma}$，$n_n = n-n_s < n$ 是"正常流体密度"。顺磁响应不足以抵消抗磁响应的零频极点，总光学电导率：

$$
\sigma(\omega) \approx \frac{n_s}{m}\frac{i}{\omega} + \frac{n_n}{m}\frac{i}{\omega+i\gamma}
$$

即"**两流体模型**"。

**物理理解**：常说两电子形成 Cooper 对后就不被杂质散射了。这不准确——小 Cooper 对若未玻色-爱因斯坦凝聚，只是普通玻色液体，仍有摩擦和黏滞。要免受摩擦，**Cooper 对之间的长程相位相干**才是关键。

**朗道超流论证**：考虑以速度 $v$ 流动、伽利略不变的电子流体（质心能量与质心动量满足 $\varepsilon = k^2/(2M)$）。杂质或容器壁散射给流体动量 $q$，质心动量减少 $q$，质心动能减少 $\delta\varepsilon = v\cdot q$。散射是弹性的，流体总能量不变，失去的质心动能必须转为流体内能。在随流体运动的参考系中，能量 $\delta\varepsilon$ 与动量 $q$ 必须能在流体中制造激发。正常费米液体没问题（激发谱充满 $\omega$-$q$ 平面）。但超导体有准粒子能隙，激发谱有能隙：$v$ 太小时注入的 $(\omega,q) = (v\cdot q,q)$ 无法制造激发。最小速度 $v_c\approx\Delta/k_F\sim v_F\Delta/E_F$（取 $q=2k_F$、$\delta\varepsilon = 2\Delta$，即激发两个都在"费米面"上的准粒子的能量）。

> 【配图】图 9.6.1：金属（左）与超导体（右）的粒子-空穴激发谱。超导体在低频出现能隙 $2\Delta$。

> 还要注意流体中除准粒子拆对外还有集体模。摩擦也可能通过激发集体模注入能量。中性超导体有对应相位涨落的无能隙 Goldstone 模（即声波）。零温下其声速下界 $v_s = v_F/\sqrt d$（$d$ 空间维数）。因此即使考虑相位模，临界流速以下仍无摩擦。
>
> **问题 9.6.1**：有节点的超导体（如 $d$ 波超导）呢？
>
> **BEC 型超流**：玻色体系用 $S[\psi^*,\psi] = \int_0^\beta d\tau\int dr\,\psi^*\left(\partial_\tau + \xi_0 + \frac{\hat p^2}{2m}\right)\psi + g|\psi|^4$ 描述（$^4$He、光晶格玻色原子等）。解析延拓到实时的经典运动方程是 **Gross-Pitaevskii 方程**：
> $$
> \left(-i\partial_t + \xi_0 + \frac{\hat p^2}{2m} + 2g|\psi|^2\right)\psi = 0
> $$
> $\xi_0<0$ 时平均场自发破缺 $U(1)$。静态作用量极小给出序参量 $\psi_m = \sqrt{-\xi_0/2g}e^{i\theta}$，即超流密度 $n_0 = |\psi_m|^2$ 的 BEC/超流态。其上涨落描述集体模，长波极限即声波，声速 $v_s = \sqrt{gn_0/m}$。

# U(1) 对称性破缺的本质

BCS 平均场基态是固定相位的 $|BCS\rangle_\varphi$。此态中对称破缺由局域对湮灭算符的期望值（序参量）识别：

$$
\Delta(r) = \langle BCS|\hat\Delta(r)|BCS\rangle_\varphi = |\Delta|e^{i\varphi}
$$

但固定粒子数态 $|BCS\rangle_N$ 中 $\hat\Delta(r)$ 的期望显然为零（此算符改变粒子数）。如前所述，这两个态都同样好地描述超导态。那如何在更一般的方式下刻画自发对称破缺？答案是第七讲的**长程有序**。超导（与超流）展示**非对角长程序**（off-diagonal long range order, ODLRO）：

$$
\langle BCS|\hat\Delta^\dagger(r)\hat\Delta(0)|BCS\rangle \xrightarrow{r\to\infty} \text{非零}
$$

这是杨振宁 1962 年指出的。忽略涨落时此关联函数恒为 $|\Delta_0|^2$。对玻色-爱因斯坦凝聚，此量也为非零（请验证）。

# BCS 理论的其他应用：电荷/自旋序

## 电荷密度波（CDW）

从一维单原子链的 **Peierls 失稳** 说起。每个原子一个活性电子轨道、贡献一个电子，紧束缚哈密顿量：

$$
H = \sum_k\xi_kc^\dagger_kc_k, \qquad \xi_k = -2t\cos(k)
$$

（晶格常数设为 1，忽略自旋指标）。考虑自旋简并，此能带半满，化学势 $\mu=0$。考虑晶格畸变：A/B 原子分别左右移动（动量 $\pi$ 的声学声子模），电子跳跃矩阵元变为 $t-\Delta$、$t+\Delta$。晶胞加倍、能带折叠到一半布里渊区，两带哈密顿量：

$$
H = \sum_{k\in[0,\pi)}\begin{pmatrix}c^\dagger_k&v^\dagger_k\end{pmatrix}\begin{pmatrix}\xi_k&\Delta\\\Delta&-\xi_k\end{pmatrix}\begin{pmatrix}c_k\\v_k\end{pmatrix}
$$

$\Delta\neq0$ 混合两条折叠带打开能隙，色散 $\pm E_k = \pm\sqrt{\xi_k^2+\Delta^2}$。电子动能降低 $\delta T = \sum_k(E_k-|\xi_k|)\sim\nu\Delta^2\ln\frac{t}{|\Delta|}$（$\Delta\ll t$）。但晶格畸变有弹性能成本 $\delta V = \Delta^2/g$（$1/g$ 正比于该声子模的弹簧常数）。晶格位移的静态总能：

$$
\delta E \approx -\nu\Delta^2\ln\frac{t}{|\Delta|} + \frac{\Delta^2}{g}
$$

结构与式 (9.4.12) 相同（图 9.4.2 已画过）。由于第一项电子能降低的对数发散，很小的 $\Delta$ 出现时总能变化必为负。因此此链对形成这种晶格畸变失稳——**Peierls 失稳**，形成二聚化链。注意 $\Delta$ 正负无所谓，二聚化链是自发破缺晶格平移对称性的畸变（1D 原则上只能发生在零温）。这是电子-声子相互作用形成**电荷密度波**的典型例子。

一般地，此失稳来自"**费米面嵌套**"：费米面平移 $q$ 后与自己大面积重合（如准一维能带、半满正方格子）。从极化函数（Lindhard 函数）看到失稳：

$$
\chi^{bubble}_{\rho\rho}(2k_F+q,0) = \sum_k\frac{f(\xi_k)-f(\xi_{k+2k_F+q})}{\xi_k-\xi_{k+2k_F+q}+i\eta} \sim -\nu\int_0^{E_F}d\xi\frac{1}{v_F|q|+2\xi} \sim -\nu\ln\frac{E_F}{v_F|q|}
$$

动量趋近 $2k_F$ 时对数发散。若电子在此动量有负的密度-密度相互作用，体系不管多弱都对形成 $\rho(2k_F)$ 的密度调制失稳——CDW 失稳。真实材料中负相互作用由声子介导，直接用声子位移 $X_{2k_F}$ 作为式 (9.8.2) 的 $\Delta$。

**场积分途径**：双带电子体系带局域吸引相互作用的场积分表示：

$$
Z = \frac1C\int D[\bar\psi,\psi,\Delta^*,\Delta]e^{-S}, \qquad S = \int dx\begin{pmatrix}\bar\psi_c&\bar\psi_v\end{pmatrix}\begin{pmatrix}\partial_\tau+\xi(\hat p)&\Delta\\\Delta^*&\partial_\tau-\xi(\hat p)\end{pmatrix}\begin{pmatrix}\psi_c\\\psi_v\end{pmatrix} + \frac1g\int dx\Delta^*\Delta
$$

$\xi(\hat p) = v_F(-i\nabla)$ 是右运动电子（右费米面附近）的能量，$-\xi(\hat p)$ 是左运动电子（平移 $2k_F$ 后与右费米面重合）的能量。$\Delta$ 是分解吸引相互作用的复 Hubbard-Stratonovich 场，在真实材料中可视为晶格位移 $\Delta(x) = \sum_qX_{2k_F+q}(\tau)e^{iqr}$，$1/g$ 即弹簧常数。与 BCS 类似积分掉 $\psi$ 得 GL 有效作用量。平均场层（均匀 $\Delta$）均匀哈密顿量：

$$
H = \sum_k\begin{pmatrix}\psi^\dagger_{ck}&\psi^\dagger_{vk}\end{pmatrix}\begin{pmatrix}v_Fk&\Delta\\\Delta^*&-v_Fk\end{pmatrix}\begin{pmatrix}\psi_{ck}\\\psi_{vk}\end{pmatrix} + \frac1g|\Delta|^2
$$

零温自由能密度与式 (9.4.12) 相同（$E_k = \sqrt{\xi_k^2+|\Delta|^2}$），零温能隙 $|\Delta_0|\approx2\Lambda e^{-1/g\nu}$。物理上可理解为晶格场受的力：$F_\Delta = -\partial_{\Delta^*}H = -\Delta/g - \sum_k\langle\psi^\dagger_{vk}\psi_{ck}\rangle$。第二项来自打开能隙降低平均场哈密顿量基态能量，试图把 $\Delta$ 推向大值；零温下小 $\Delta$ 时第二项对数发散即失稳。均匀 $\Delta$ 是波长为 $2\pi/(2k_F)$ 的晶格畸变 $X_{2k_F}$，电子密度也有相同周期性——即 CDW。其准粒子激发是普通电子（电荷 $e$ 的费米子）。

## 自旋密度波（SDW）

描述自旋密度波只需把式 (9.8.5) 双带模型复制两份（自旋简并），每份代表沿某轴（如 $\sigma_z$）的本征自旋：

$$
S = \int dx\begin{pmatrix}\bar\psi_c&\bar\psi_v\end{pmatrix}\begin{pmatrix}\partial_\tau+\xi(\hat p)&\Delta(x)\sigma_z\\\Delta^*(x)\sigma_z&\partial_\tau-\xi(\hat p)\end{pmatrix}\begin{pmatrix}\psi_c\\\psi_v\end{pmatrix} + \frac1g\int dx\Delta^*\Delta
$$

$\bar\psi_{c/v} = (\bar\psi_{c/v,\uparrow},\bar\psi_{c/v,\downarrow})$ 是二分量旋量。玻色场 $\Delta$ 对每个自旋符号相反，使每个自旋的电荷密度波符号相反——净电荷密度波为零但自旋密度波非零。这类耦合来自自旋通道吸引相互作用的 Hubbard-Stratonovich 分解。这种吸引可自然由库仑排斥产生：局域 Hubbard 型排斥相互作用

$$
V_{ee} = U\int dr\,n_\uparrow(r)n_\downarrow(r) = \frac{U}{4}\int dr\left(n(r)^2 - s_z(r)^2\right)
$$

自旋通道有强度 $U/4$ 的吸引，其 HS 分解给出式 (9.8.8)，$g = 4/U$。

作为 CDW 的两份拷贝，SDW 的平均场哈密顿量与自由能类似式 (9.8.6)、(9.4.12)（差一些因子 2），准粒子激发是普通电子（电荷 $e$、自旋 $1/2$ 的费米子）。

> **思考题**
> 1. Cooper 问题中为什么任意弱吸引都能形成束缚态？费米海如何"降维"？
> 2. BCS 波函数为什么要用相干态形式？$|BCS\rangle_N$ 与 $|BCS\rangle_\varphi$ 如何对应？
> 3. 为什么 BCS 平均场理论如此成功？Ginzburg 参数 G 在其中起什么作用？（下一讲会定量回答。）
> 4. Anderson-Higgs 机制中，Goldstone 模"被吃掉"是什么意思？这如何导致 Meissner 效应？
> 5. CDW/SDW 与 BCS 超导在数学结构上相同，为什么耦合电磁场的方式不同？
