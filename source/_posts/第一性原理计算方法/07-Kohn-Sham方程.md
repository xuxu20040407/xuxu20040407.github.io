---
title: 07 Kohn-Sham 方程
mathjax: true
date: 2026-09-15 14:30:00
tags: 第一性原理计算方法
categories: 第一性原理计算方法
cover:
---

- [Kohn-Sham 形式主义](#kohn-sham-形式主义)
- [从非相互作用 V 可表示性推导 KS 方程](#从非相互作用-v-可表示性推导-ks-方程)
- [Janak 定理与分数粒子数](#janak-定理与分数粒子数)
- [自旋极化体系的 Kohn-Sham 形式主义](#自旋极化体系的-kohn-sham-形式主义)
- [从 Kohn-Sham 本征值得到电离势](#从-kohn-sham-本征值得到电离势)
- [基态能隙与交换关联泛函的导数不连续](#基态能隙与交换关联泛函的导数不连续)
- [求解 Kohn-Sham 方程](#求解-kohn-sham-方程)

参考：Martin《Electronic Structure》第 7 章；Engel & Dreizler《Density Functional Theory: An Advanced Course》第 3 章。

# Kohn-Sham 形式主义

先回顾 DFT 的基本原理。HK 定理声称：

1. 基态电子密度确定外势，因此确定完整哈密顿量与体系所有物理可观测量。但这个映射依赖哈密顿量的**内部参数**——我们考虑的内部哈密顿量为
$$
\hat H_{internal} = \hat T + \hat V_{ee}, \qquad \hat T = -\sum_i\frac{\hat\nabla_i^2}{2}, \qquad \hat V_{ee} = \sum_{i\neq j}\frac{1}{|\mathbf r_i-\mathbf r_j|}
$$
若允许改变电子质量或电子-电子相互作用，从基态密度到物理可观测量的映射也会改变。

2. 存在泛函 $E[n,V_{ext}]$，对特定 $V_{ext}$ 基态电荷密度使其最小。$E[n,V_{ext}]$ 定义在 N 可表示密度上，且依赖内部参数。

有用的密度分类（除 N 可表示外）：

- **V 可表示性**：是某外势 $V_{ext}$ 的基态电荷密度；
- **N 可表示性**：对应某 $N$-电子波函数（良好行为的电荷密度是 N 可表示的）；
- **非相互作用 V 可表示性**：是某外势下自由电子气（无相互作用）的基态密度；
- **非相互作用 N 可表示性**：对应单个 Slater 行列式（良好行为的密度是非相互作用 N 可表示的）。

泛函 $E[n,V_{ext}]$ 显式写出：

$$
E[n,V_{ext}] = F[n] + \int dr\,V_{ext}(\mathbf r)n(\mathbf r), \qquad F[n] = \min_{n[\Psi]=n}\langle\Psi|\hat H_{internal}|\Psi\rangle
$$

困难在于对 $F[n]$ 一无所知。**Kohn-Sham 形式主义**通过从 $F[n]$ 中减去显然重要的项、把一切未知放进待定的泛函 $E_{xc}[n]$ 来解决。$V_{ee}$ 中显然的项是 Hartree 项：

$$
E_H[n] = \frac12\int drdr'\,\frac{n(\mathbf r)n(\mathbf r')}{|\mathbf r-\mathbf r'|}
$$

动能也是显然的贡献，但没有把动能写成 $n$ 的函数的方式。KS 形式主义的关键思想是**用某种非相互作用的动能近似动能**。为此限制在非相互作用 N 可表示密度（对良好行为的密度一般成立）。**非相互作用动能泛函**定义为：

$$
T_s[n] = \min_{\Psi_s\in Slater,\ n[\Psi_s]=n}\langle\Psi_s|\hat T|\Psi_s\rangle
$$

即自由电子气的 Levy-Lieb 泛函（$F[n]$）。于是相互作用体系的能量泛函分解为：

$$
F[n] = T_s[n] + E_H[n] + E_{xc}[n]
$$

这**定义了** $E_{xc}[n]$。几点说明：
- 按定义 $E_{xc}[n]$ 独立于 $V_{ext}$，是**普适**的；
- $E_{xc}[n]$ 包含复杂的动能多体修正；
- 即使忽略 $E_{xc}[n]$，$T_s[n]+E_H[n]$ 也能给出定性正确的结果；
- $E_{xc}[n]$ 预计极其复杂，但对"量子性较弱"的体系可能很小，可作近似闭式表达——这是下一讲的中心，本讲假设 $E_{xc}[n]$ 已知。

> **问题 1**：$T_s[n_0]$ 高估还是低估了相互作用体系的正确动能？$n_0$ 是相互作用体系基态密度。
> **答**：$T_s[n_0]$ **低估**动能。按定义 $T_s[n_0]$ 挑出最小化动能的波函数（需假设 $n_0$ 非相互作用 V 可表示，因为 $T_s$ 只定义在 Slater 行列式上），而 $F[n_0]$ 挑出平衡动能与相互作用能的波函数。这意味着 $E_{xc}[n_0]$ 大于"量子与经典相互作用能之差"（经典由 Hartree 相互作用定义）。对简单体系可精确计算：氦原子 $T = 2.903724$ hartree，$T_s = 2.867082$ hartree。

分解已分离出最重要项，但 $T_s[n]$ 的显式形式仍未知。从 HF 近似经验看，直接操作 Slater 行列式比操作其电荷密度容易。因此定义**在 Slater 行列式上的泛函**：

$$
E_{KS}[\Psi_s] = \langle\Psi_s|\hat T|\Psi_s\rangle + E_H[n] + E_{xc}[n] + \int dr\,V_{ext}(\mathbf r)n(\mathbf r)\Big|_{n=n[\Psi_s]}
$$

显然 $E_{KS}[\Psi_s]\geq E[n[\Psi_s]]$，等号当且仅当 $|\Psi_s\rangle = \argmin_{\Psi_s'\to n[\Psi_s]}\langle\Psi_s'|\hat T|\Psi_s'\rangle$。假设相互作用体系的基态密度是非相互作用 N 可表示的，则 $E_{KS}[\Psi_s]$ 的最小值给出基态密度。注意 **$E_{KS}[\Psi_s]$ 不是 $\langle\Psi_s|\hat H|\Psi_s\rangle$ 的期望值**——最小化后者给出的是 HF 近似，而当前做法原则上是精确的。

$E_{KS}[\Psi_s]$ 的变分直接（Slater 行列式的轨道记 $\varphi_i$），用拉格朗日乘子保证正交归一：

$$
\delta\left\{E_{KS}[\Psi_s] - \sum_{ij}\lambda_{ij}[\langle\varphi_i|\varphi_j\rangle-\delta_{ij}]\right\} = 0
$$

用 Wirtinger 导数把 $\varphi_i(\mathbf r)$ 与 $\varphi_i^*(\mathbf r)$ 当独立变量。对 $\varphi_i^*\to\varphi_i^*+\delta\varphi_i^*$，动能变化 $\delta\langle\Psi_s|\hat T|\Psi_s\rangle = -\frac12\sum_i\int dr\,\delta\varphi_i^*(\mathbf r)\nabla^2\varphi_i(\mathbf r)$；Hartree 项 $\delta E_H[n] = \sum_i\int dr\,\delta\varphi_i^*V_H(\mathbf r)\varphi_i(\mathbf r)$，其中 $V_H(\mathbf r) = \int dr'\frac{n(\mathbf r')}{|\mathbf r-\mathbf r'|}$。各项合并得：

$$
\left[-\frac{\nabla^2}{2} + V_s(\mathbf r)\right]\varphi_i(\mathbf r) = \sum_j\lambda_{ij}\varphi_j(\mathbf r), \qquad V_s(\mathbf r) = V_{ext}(\mathbf r) + V_H(\mathbf r) + V_{xc}(\mathbf r)
$$

其中

$$
V_{xc}(\mathbf r) = \frac{\delta E_{xc}[n]}{\delta n(\mathbf r)}
$$

$\lambda$ 显然厄米，可对角化得到：

$$
\boxed{\ \left[-\frac{\nabla^2}{2} + V_s(\mathbf r)\right]\phi_i(\mathbf r) = \varepsilon_i\phi_i(\mathbf r)\ }
$$

即 **Kohn-Sham 方程**，$\{\phi_i\}$ 是对角化 $\lambda$ 后的轨道。$V_s(\mathbf r)$ 依赖 Slater 行列式与电荷密度，因此 KS 方程是**自洽方程**。几点说明：
- 最终 KS 方程与 HF 自洽方程惊人地相似，唯一区别是 KS 有 $V_{xc}(\mathbf r)$ 而 HF 是 Fock 交换项；KS 的优点是 $V_{xc}$ 是**局域**的；
- 推导中 Slater 行列式应视为表示密度的**工具**，原则上没有物理意义；
- 有人不喜欢这个推导的几点：没有用到第一 HK 定理；定义了作用在 Slater 行列式上的泛函。

**总能量**：由 KS 本征值表达。按定义 $\sum_{i\leq N}\varepsilon_i = -\sum_i\int dr\phi_i^*\frac{\nabla^2}{2}\phi_i + \int drV_s(\mathbf r)n_0(\mathbf r)$，第一项即 $T_s[n_0]$。自洽收敛后（密度对应基态密度 $n_0$），总能量：

$$
E[n_0] = \sum_{i\leq N}\varepsilon_i - \int drV_s(\mathbf r)n_0(\mathbf r) + \int V_{ext}(\mathbf r)n_0(\mathbf r) + E_H[n_0] + E_{xc}[n_0]
$$

与 HF 类似，经典电子-电子相互作用被双重计数（$V_H$ 定义了它）。把 $V_s = V_{ext}+V_H+V_{xc}$ 代入得最终结果：

$$
\boxed{\ E[n_0] = \sum_{i\leq N}\varepsilon_i - \int drV_{xc}(\mathbf r)n_0(\mathbf r) - E_H[n_0] + E_{xc}[n_0]\ }
$$

# 从非相互作用 V 可表示性推导 KS 方程

前面的推导基于最小化密度泛函。历史上同一方程还有另一条概念上更简单的推导路径，能带来对 KS 形式主义的洞见。

关键问题：**能否找到一个非相互作用体系，其基态密度与相互作用体系相同？**这等价于非相互作用 V 可表示性。相互作用体系的基态密度是否非相互作用 V 可表示是未解决的问题；此处假设基态密度及其附近（变分需要）非相互作用 V 可表示。

下一步定义动能泛函 $T_s$ 并确保它只是密度的泛函。新推导中这很明显：$T_s[n(\mathbf r)]$ 定义为基态电荷密度为 $n(\mathbf r)$ 的非相互作用体系的动能。由第一 HK 定理，该非相互作用体系（若存在）唯一，其外势记 $V_s(\mathbf r)$，满足单粒子薛定谔方程：

$$
\left(-\frac{\nabla^2}{2} + V_s(\mathbf r)\right)\phi_i(\mathbf r) = \varepsilon_i\phi_i(\mathbf r), \qquad T_s[n(\mathbf r)] = -\frac12\sum_i\Theta_i\int dr\,\phi_i^*(\mathbf r)\nabla^2\phi_i(\mathbf r)
$$

（$\Theta_i$ 是轨道占据数。）能量泛函的分解与式 (I.6) 相同。目标是从 $V_{ext}$ 得到 $V_s$。

现在对密度变分：$n(\mathbf r)\to n(\mathbf r)+\delta n(\mathbf r)$，诱导轨道变分 $\phi_i\to\phi_i+\delta\phi_i$。$T_s$ 的变化为：

$$
T_s[n+\delta n] - T_s[n] = -\frac12\sum_i\Theta_i\int dr\{\delta\phi_i^*\nabla^2\phi_i + \delta\phi_i\nabla^2\phi_i^*\}
$$

利用非相互作用体系的薛定谔方程（$-\nabla^2/2\phi_i = (\varepsilon_i - V_s)\phi_i$）：

$$
T_s[n+\delta n] - T_s[n] = \sum_i\Theta_i\int dr[\varepsilon_i - V_s(\mathbf r)]\delta n(\mathbf r) = -\sum_i\Theta_i\int drV_s(\mathbf r)\delta n(\mathbf r)
$$

（末步用 $\sum_i\Theta_i = N$ 与密度约束。）能量泛函其他项的变化与第 I 节相同。合并并要求能量一阶变分为零：

$$
\int dr\left[V_s(\mathbf r) - V_H(\mathbf r) - V_{ext}(\mathbf r) - \frac{\delta E_{xc}[n]}{\delta n(\mathbf r)}\right]\delta n(\mathbf r) = 0
$$

对任意 $\delta n(\mathbf r)$ 成立，故

$$
V_s(\mathbf r) = V_H(\mathbf r) + V_{ext}(\mathbf r) + V_{xc}(\mathbf r)
$$

回到 KS 方程。这条推导与第 I 节相比，关键概念区别是**对密度做显式变分**，技术差别极小。

# Janak 定理与分数粒子数

本节允许分数粒子数。对积分到分数粒子数的 $n(\mathbf r)$，自然选择是 Lieb 泛函。推导走最小化路线（对分数粒子数假设非相互作用 V 可表示不方便）。密度由单粒子轨道产生：

$$
n(\mathbf r) = \sum_i\Theta_i|\phi_i(\mathbf r)|^2
$$

$\Theta_i$ 是粒子数（占据数）。对 $\{\Theta_i\},\{\phi_i\}$ 引入总能量泛函：

$$
E[\{\Theta_i\},\{\phi_i\}] = \sum_i\Theta_i t_i + \int drV_{ext}(\mathbf r)n(\mathbf r) + E_H[n] + E_{xc}[n]\Big|_{n\leftarrow\{\Theta_i\},\{\phi_i\}}
$$

在固定粒子数 $N+\eta$（$0\leq\eta<1$）下对 $\{\phi_i\}$ 与 $\{\Theta_i\}$ 优化。用顺序优化：先固定 $\{\Theta_i\}$ 变分 $\{\phi_i\}$，再变分 $\{\Theta_i\}$。固定 $\{\Theta_i\}$ 时给出与第 I 节相同的 KS 方程。

**Janak 定理**：计算 $dE[\{\Theta_i\},\{\phi_i[\{\Theta_i\}]\}]/d\Theta_i$（$\phi_i$ 对固定 $\{\Theta_i\}$ 最小化能量）。利用 KS 方程：

$$
t_i + \int drV_s(\mathbf r)|\phi_i(\mathbf r)|^2 = \varepsilon_i
$$

以及轨道对 $\Theta_i$ 依赖的抵消项（利用 $\int dr|\phi_j|^2=1$），得：

$$
\boxed{\ \frac{dE[\{\Theta_i\},\{\phi_i[\{\Theta_i\}]\}]}{d\Theta_i} = \varepsilon_i\ }
$$

这是 **Janak 定理**：能量对第 $i$ 个 KS 轨道占据数的导数等于其 KS 本征值。

现在变分 $\{\Theta_i\}$。参数化 $0\leq\Theta_i\leq1$ 为 $\Theta_i = \cos^2\alpha_i$。目标泛函（含拉格朗日乘子 $\mu$ 固定粒子数）对 $\alpha_i$ 变分：

$$
\sin(2\alpha_i)[\varepsilon_i - \mu] = 0
$$

只能以三种方式满足：$\alpha_i = 0$（$\Theta_i = 1$，任意 $\varepsilon_i$）、$\alpha_i = \pi/2$（$\Theta_i = 0$，任意 $\varepsilon_i$）、任意 $\alpha_i$ 且 $\Theta_i\in[0,1]$ 当 $\varepsilon_i = \mu$。**只有一个特定能量允许分数占据**；其他态要么全满要么全空。由 Janak 定理，KS 轨道按 KS 能量从低到高全占据，直到拉格朗日乘子 $\mu$ 确定的能量处允许任意占据（以固定分数粒子数）——这证实了第 I 节占据的合法性。若 $\varepsilon_i = \mu$ 有简并，$\Theta_i$ 无法从上述讨论确定，但自洽循环中大多数 $\Theta_i$ 选择会打破简并；通过比较每种选择的总能量可确定基态。

有时 Janak 定理也用来估计激发能。近似（无真正依据）是把 KS 粒子从占据轨道 $i$ 移到未占据轨道 $j$ 视为激发：

$$
\int_0^1d\Theta_j\varepsilon_j - \int_0^1d\Theta_i\varepsilon_i\approx\varepsilon_j - \varepsilon_i
$$

# 自旋极化体系的 Kohn-Sham 形式主义

与 HK 定理类似，KS 形式主义可推广到自旋极化体系。选 KS 辅助体系：

$$
\hat H_s = -\frac{\nabla^2}{2} + V_s(\hat{\mathbf r}) + \mathbf Z_s(\mathbf r)\cdot\hat{\mathbf m}(\mathbf r)
$$

从轨道 $\phi_i$（$\hat H_s\phi_i = \varepsilon_i\phi_i$）得密度与磁化密度：

$$
n(\mathbf r) = \sum_{\sigma,i}\Theta_i|\phi_i(\mathbf r,\sigma)|^2, \qquad \mathbf m(\mathbf r) = \sum_{\sigma,\sigma',i}\Theta_i\phi_i^*(\mathbf r,\sigma)\boldsymbol\sigma_{\sigma\sigma'}\phi_i(\mathbf r,\sigma')
$$

最小化泛函：

$$
E[\{\Theta_i\},\{\phi_i\}] = -\frac12\sum_i\Theta_i\sum_\sigma\int dr\phi_i^*(\mathbf r,\sigma)\nabla^2\phi_i(\mathbf r,\sigma) + \int dr[V_{ext}(\mathbf r)n(\mathbf r) + \mathbf Z(\mathbf r)\cdot\mathbf m(\mathbf r)] + E_H[n] + E_{xc}[n,\mathbf m]
$$

对应 KS 势：

$$
V_s(\mathbf r) = V_{ext}(\mathbf r) + V_H(\mathbf r) + \frac{\delta E_{xc}[n,\mathbf m]}{\delta n(\mathbf r)}, \qquad \mathbf Z_s(\mathbf r) = \mathbf Z_{ext}(\mathbf r) + \frac{\delta E_{xc}[n,\mathbf m]}{\delta\mathbf m(\mathbf r)}
$$

实践中通常假设 $z$ 方向自旋算符 $\hat s_z$ 是好量子数（$\mathbf Z$ 沿 $+z$ 或 $\mathbf Z=0$），KS 方程变为：

$$
\left[-\frac{\nabla^2}{2} + V_{ext}(\mathbf r) + \mathrm{sgn}(\sigma)Z(\mathbf r) + V_H(\mathbf r) + V_{xc}^\sigma(\mathbf r)\right]\phi_{i\sigma}(\mathbf r) = \varepsilon_{i\sigma}\phi_{i\sigma}(\mathbf r)
$$

其中 $V_{xc}^\sigma(\mathbf r) = \frac{\delta E_{xc}[n_\uparrow,n_\downarrow]}{\delta n_\sigma(\mathbf r)}$。两个自旋通过以下方式耦合：① $V_H(\mathbf r)$（库仑相互作用与自旋无关）；② $V_{xc}^\sigma(\mathbf r)$（含自旋依赖相互作用）。这是自旋密度泛函理论的标准 KS 方程。

如前所述，自旋密度泛函理论常用于描述无外 Zeeman 场下自旋极化的体系。原则上可用非极化 KS 方案描述自旋极化体系（KS 体系的磁矩不必与相互作用体系一致），但这也正是非极化框架的主要缺点：区分不同自旋态的全部负担都落在纯密度依赖的 xc 泛函上——目前没有合适的泛函能做这件事。

# 从 Kohn-Sham 本征值得到电离势

一般地，KS 辅助体系应视为变分工具，KS 态与 KS 能量**没有物理意义**。但有例外：对有限体系，**最高 KS 占据本征值等于体系电离势的负值**（电离势是移走一个电子的能量）。

证明逻辑简单：束缚体系的密度长程渐进行为由电离能支配；KS 体系与真实体系共享同一密度，故其电离能应相同。代数证明较繁琐。关键步骤：真实体系哈密顿量用场算符写（$\{\hat\psi(\mathbf r),\hat\psi^\dagger(\mathbf r')\} = \delta(\mathbf r-\mathbf r')$），定义准粒子振幅 $f_k(\mathbf r) = \langle\Psi_k^{N-1}|\hat\psi(\mathbf r)|\Psi_0^N\rangle$，可证 $n_0(\mathbf r) = \sum_k|f_k(\mathbf r)|^2$，而 $f_k$ 的长程行为由电离能 $\omega_0$ 指数衰减 $f_0\sim e^{-\sqrt{-2\omega_0}|\mathbf r|}$。KS 体系无相互作用，电离势即最高占据 KS 态的能量（能量参考取 $V_s\to0$ 当 $|\mathbf r|\to\infty$）。于是**最高占据 KS 本征值 = $-I$（电离势）**。

# 基态能隙与交换关联泛函的导数不连续

**基态能隙**定义为：

$$
E_g = (E_0^{N-1} - E_0^N) - (E_0^N - E_0^{N+1})
$$

$E_0^{N-1}-E_0^N$ 是电离势，$E_0^N-E_0^{N+1}$ 是电子亲和能（一般比电离势小，否则体系会自发分裂）。

由 $E_0^\Lambda$ 的分段线性，电离势 $= -\left\{\frac{\delta E[n(\mathbf r)]}{\delta n(\mathbf r)}\right\}_{n=n_0^{N-\eta}(\mathbf r)}$、电子亲和能 $= -\left\{\frac{\delta E[n(\mathbf r)]}{\delta n(\mathbf r)}\right\}_{n=n_0^{N+\eta}(\mathbf r)}$。电离势大于电子亲和能反映在：$\{\delta E[n]/\delta n\}$ 在 $\Lambda$ 跨过整数时不连续。

对能量泛函做 KS 分解 $E[n] = T_s[n] + \int V_{ext}(\mathbf r)n(\mathbf r)dr + E_H[n] + E_{xc}[n]$：

$$
E_g = \Delta_s + \Delta_{xc}
$$

其中 $\Delta_s = \lim_{\eta\to0^+}\left[\frac{\delta T_s[n]}{\delta n(\mathbf r)}\Big|_{n_0^{N+\eta}} - \frac{\delta T_s[n]}{\delta n(\mathbf r)}\Big|_{n_0^{N-\eta}}\right]$，而

$$
\Delta_{xc} = \lim_{\eta\to0^+}\left[V_{xc}[n_0^{N+\eta}](\mathbf r) - V_{xc}[n_0^{N-\eta}](\mathbf r)\right]
$$

$\int V_{ext}n$ 与 $E_H[n]$ 对 $n$ 显式解析，不贡献不连续。$\Delta_s$ 与 $\Delta_{xc}$ 与 $\mathbf r$ 无关（$n_0^\Lambda(\mathbf r)$ 对 $\Lambda$ 连续，即使在整数电子数处，不连续的只是导数；由第一 HK 定理 $V_{xc}[n_0^{N+\eta}]$ 与 $V_{xc}[n_0^{N-\eta}]$ 至多差一个空间常数 $\Delta_{xc}$）。

若记密度 $n$ 生成的第 $N$ 个 KS 能量为 $\varepsilon_N[n]$，则 $\Delta_s = \varepsilon_{N+1}[n_0^{N-\eta}] - \varepsilon_N[n_0^{N-\eta}]$，即 **KS 体系的基本能隙 $E_g^{KS}$**。于是：

$$
\boxed{\ E_g = E_g^{KS} + \Delta_{xc}\ }
$$

（$E_g^{KS} = \varepsilon_{N+1}[n_0^{N+\eta}] - \varepsilon_N[n_0^{N-\eta}]$ 也成立，两式等价。）$E_g^{KS}$ 的推导可由 Janak 定理或把 KS 方程视为"固定 KS 势的非相互作用体系"、利用式 $E_s^\Lambda[n]$ 的导数得到。

**这是本节的中心结论**：即使采用精确 DFT 与精确 KS 形式主义，**KS 能隙也与真实能隙不同**，差 $E_g - E_g^{KS} = \Delta_{xc}$，反映交换关联泛函的**导数不连续**。实用近似（如 LDA/GGA）中 $V_{xc}$ 对 $n$ 光滑，$\Delta_{xc}=0$，因此 $E_g^{KS}$ 系统性低估真实能隙——这就是"能隙问题"的形式化表述。

# 求解 Kohn-Sham 方程

KS 方程的自洽循环见图 7.2（Martin《Electronic Structure》）。流程：猜测初始密度 → 构造 $V_s$ → 解 KS 方程得新轨道与新密度 → 混合新旧密度 → 直到收敛。

> **思考题**
> 1. 为什么 $E_{KS}[\Psi_s]$ 的最小化是"原则上精确"的，而 HF 的最小化不是？二者的差别在哪一步？
> 2. $T_s[n_0]$ 为什么低估动能？这是否意味着 $E_{xc}[n_0]$ 必须承担额外的角色？
> 3. Janak 定理 $\partial E/\partial\Theta_i = \varepsilon_i$ 如何证明？为什么只有 $\varepsilon_i=\mu$ 的轨道允许分数占据？
> 4. "KS 能隙不等于真实能隙"的形式化结论是什么？LDA/GGA 为什么总是低估能隙？
