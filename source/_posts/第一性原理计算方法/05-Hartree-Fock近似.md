---
title: 05 Hartree-Fock 近似
mathjax: true
date: 2026-09-15 13:30:00
tags: 第一性原理计算方法
categories: 第一性原理计算方法
cover:
---

- [Wick 定理](#wick-定理)
- [Hartree-Fock 近似的基本工作原理](#hartree-fock-近似的基本工作原理)
- [对角表示中的 Hartree-Fock 近似](#对角表示中的-hartree-fock-近似)
- [实空间中的 Hartree-Fock 近似](#实空间中的-hartree-fock-近似)
- [Hartree-Fock 近似的另一种解释](#hartree-fock-近似的另一种解释)
- [应用：均匀电子气](#应用均匀电子气)
- [Hartree-Fock 态的局域稳定性](#hartree-fock-态的局域稳定性)

Hartree-Fock（HF）近似在历史上是电子液体多体理论（以及第一性原理计算）的出发点。参考：Giuliani & Vignale《Quantum Theory of the Electron Liquid》第 2 章。它的基本思想可以简单描述为：**用有效哈密顿量的基态来近似体系的基态波函数**，该有效哈密顿量对电子产生/湮灭算符是二次的、因而容易对角化。最古老、最常见的版本基于数守恒二次哈密顿量与 Slater 行列式，回答的问题是：**对相互作用多电子体系，什么是最好的独立电子近似？**

# Wick 定理

Giuliani & Vignale 书附录 3 给出了 Wick 定理清晰自足的入门处理，此处不重复。研究 HF 近似需要附录 3.1-3.3 的知识。其核心：对于 Slater 行列式态，任意多算符乘积的期望值可展开为两两收缩（期望值 $\langle\hat c_\alpha^\dagger\hat c_\beta\rangle$）乘积的和。

# Hartree-Fock 近似的基本工作原理

从非常一般的哈密顿量出发（$\{\alpha,\beta,\gamma,\delta\}$ 是单粒子基标号）：

$$
\hat H = \sum_{\alpha,\beta}T_{\alpha\beta}\hat c_\alpha^\dagger\hat c_\beta + \frac12\sum_{\alpha,\beta,\gamma,\delta}V_{\alpha\beta\gamma\delta}\,\hat c_\alpha^\dagger\hat c_\beta^\dagger\hat c_\gamma\hat c_\delta
$$

对 Slater 行列式，由 Wick 定理能量为：

$$
E = \sum_{\alpha,\beta}T_{\alpha\beta}\langle\hat c_\alpha^\dagger\hat c_\beta\rangle + \frac12\sum_{\alpha,\beta,\gamma,\delta}V_{\alpha\beta\gamma\delta}\left[\langle\hat c_\alpha^\dagger\hat c_\delta\rangle\langle\hat c_\beta^\dagger\hat c_\gamma\rangle - \langle\hat c_\alpha^\dagger\hat c_\gamma\rangle\langle\hat c_\beta^\dagger\hat c_\delta\rangle\right]
$$

定义**单粒子约化密度矩阵**：

$$
\rho_{\beta\alpha} = \langle\hat c_\alpha^\dagger\hat c_\beta\rangle
$$

能量对 $\rho$ 的变分为：

$$
\frac{\delta E}{\delta\rho_{\beta\alpha}} = T_{\alpha\beta} + \sum_{\gamma,\delta}V_{\gamma\alpha\beta\delta}\langle\hat c_\gamma^\dagger\hat c_\delta\rangle - V_{\gamma\alpha\delta\beta}\langle\hat c_\gamma^\dagger\hat c_\delta\rangle \equiv H_{\alpha\beta}^{HF}
$$

（用到了 $V_{\alpha\beta\gamma\delta} = V_{\beta\alpha\delta\gamma}$，这不限制理论的普遍性。）$H^{HF}$ 称为 **Hartree-Fock（平均场）哈密顿量**。算符形式 $\hat H^{HF} = \sum_{\alpha\beta}H_{\alpha\beta}^{HF}\hat c_\alpha^\dagger\hat c_\beta$，它依赖底下的 Slater 行列式、但独立于基的选择。

对密度矩阵扰动 $\delta\rho$，能量一阶变化为 $\delta E = \sum_{\alpha\beta}H_{\alpha\beta}^{HF}\delta\rho_{\beta\alpha}$。设 Slater 行列式的轨道为 $\phi_n$，$\rho_{\beta\alpha} = \sum_n\phi_{n\alpha}\phi_{n\beta}^*$，则 $\delta\rho_{\beta\alpha} = \sum_n(\delta\phi_{n\alpha}\phi_{n\beta}^* + \phi_{n\alpha}\delta\phi_{n\beta}^*)$，从而

$$
\delta E = \sum_n\sum_{\alpha,\beta}\delta\phi_{n\alpha}^*H_{\alpha\beta}^{HF}\phi_{n\beta} + c.c.
$$

目标是找能量极小的 Slater 行列式，其 $\delta E$ 对任意 $\delta\phi_n$ 一阶为零（平稳条件）。由于归一化，$\delta\phi_n$ 与 $\phi_n$ 一阶正交。**若取 Slater 行列式的轨道为 $H^{HF}$ 的本征态，则该行列式平稳**（充分条件；参考书论证了这也是必要条件）。注意 Slater 行列式在其轨道酉变换下不变。

但式 (4) 中 $H^{HF}$ 显式依赖 $\rho$、即依赖轨道 $\phi$，因此 HF 近似需要**自洽**处理：

**算法 1（自洽循环）**：
1. 选一组初始轨道 $\{\phi\}$；
2. 由 $\{\phi\}$ 计算 $\rho$；
3. 由 $\rho$ 计算 $H^{HF}$；
4. 把 $\{\phi\}$ 更新为 $H^{HF}$ 的最低 $N$ 个本征态（$N$ 为电子数）。

循环可从任意处开始（通常从初始 $H^{HF}$ 更方便）。收敛判据：密度矩阵 $\rho$ 或能量 $E$ 在循环中不再变化。取最低 $N$ 个本征态的合法性稍后论证。注意**最终 HF 轨道依赖于初始 $\{\phi\}$ 或 $H^{HF}$ 的假设**。

# 对角表示中的 Hartree-Fock 近似

为揭示 HF 能量的物理意义，把收敛的 HF 轨道取为基。按定义 HF 哈密顿量在此基下对角：

$$
H_{nm}^{HF} = \varepsilon_n\delta_{nm}
$$

即

$$
T_{nm} + \sum_{l,k}\left(V_{lnmk}\langle\hat c_l^\dagger\hat c_k\rangle - V_{lnkm}\langle\hat c_l^\dagger\hat c_k\rangle\right) = T_{nm} + \sum_l(V_{lnml}n_l - V_{lnlm}n_l) = \varepsilon_n\delta_{nm}
$$

其中 $n_l$ 是态 $l$ 的占据数（零温下为 0 或 1）。体系能量为：

$$
E = \sum_n n_n T_{nn} + \frac12\sum_{n,m}n_nn_m(V_{nmmn} - V_{nmnm})
= \sum_n n_n\varepsilon_n - \frac12\sum_{n,m}n_nn_m(V_{nmmn} - V_{nmnm})
$$

**$\sum_n n_n\varepsilon_n$ 不是体系能量**——它把相互作用能算了两次。

**HF 能量的物理意义**：若一个未占据的 HF 轨道 $s$（$n_s=0$）注入一个电子（$n_s=1$），能量差为：

$$
\Delta E = T_{ss} + \sum_{m\neq s}(V_{smms}n_m - V_{smsm}n_m) = \varepsilon_s
$$

即**未占据 HF 轨道的 $\varepsilon_s$ 是在其他电子冻结时向该轨道注入电子的能量代价**；类似地，占据轨道的 $\varepsilon_s$ 是其他电子冻结时移走该轨道电子的能量收益。若把电子从占据轨道 $o$ 移到未占据轨道 $u$，能量代价为：

$$
\Delta E = \varepsilon_u - \varepsilon_o - (V_{uoou} - V_{uouo})
$$

其中

$$
V_{uoou} - V_{uouo} = \frac12\int drdr'\,V(\mathbf r-\mathbf r')\left|\phi_u(\mathbf r)\phi_o(\mathbf r') - \phi_o(\mathbf r)\phi_u(\mathbf r')\right|^2
$$

对排斥相互作用一般**为正**。这证实了此前"取 $H^{HF}$ 最低本征态构造 Slater 行列式"的做法。对稳定 HF 解，$\Delta E = \varepsilon_u-\varepsilon_o-(V_{uoou}-V_{uouo})\geq0$ 对任意占据/未占据对成立；由于 $V_{uoou}-V_{uouo}>0$，**有限体系 HF 解必有能隙**。实践中 HF 近似一般偏好带隙态。

# 实空间中的 Hartree-Fock 近似

用 HF 轨道的波函数表达 HF 自洽方程。取位置算符本征态为基，相互作用矩阵元特别简单：

$$
V_{\mathbf r_1\mathbf r_2\mathbf r_3\mathbf r_4} = V(\mathbf r_1-\mathbf r_2)\delta_{\mathbf r_1,\mathbf r_4}\delta_{\mathbf r_2,\mathbf r_3}
$$

HF 哈密顿量由三项组成：单粒子项（熟悉），以及相互作用平均场分解的两项。

**Hartree 哈密顿量** $\hat H^H$：$\sum_{\gamma\delta}V_{\gamma\alpha\beta\delta}\hat c_\gamma^\dagger\hat c_\delta$ 在位置基下为 $\sum_{\mathbf r_3,\mathbf r_4}V_{\mathbf r_4\mathbf r_1\mathbf r_2\mathbf r_3}\hat c_{\mathbf r_3}^\dagger\hat c_{\mathbf r_4}$。它作用在态上：

$$
\langle\mathbf r|\hat H^H|\varphi\rangle = \sum_{\mathbf r'}V(\mathbf r-\mathbf r')\sum_j\phi_j^*(\mathbf r')\phi_j(\mathbf r')\,\langle\mathbf r|\varphi\rangle
$$

就是常规的密度-密度库仑相互作用。

**Fock 哈密顿量** $\hat H^F$：作用在态上：

$$
\langle\mathbf r|\hat H^F|\varphi\rangle = \sum_{\mathbf r'}V(\mathbf r-\mathbf r')\sum_j\phi_j^*(\mathbf r')\phi_j(\mathbf r)\,\langle\mathbf r'|\varphi\rangle
$$

注意 **Fock 哈密顿量是非局域的**，必须写成积分算符。HF 自洽方程（波函数形式）：

$$
\langle\mathbf r|\hat T|\phi_i\rangle + \sum_{\mathbf r'}\left[\sum_j\phi_j^*(\mathbf r')\phi_j(\mathbf r')\right]V(\mathbf r-\mathbf r')\phi_i(\mathbf r) - \sum_{\mathbf r'}\left[\sum_j\phi_j^*(\mathbf r')\phi_j(\mathbf r)\right]V(\mathbf r-\mathbf r')\phi_i(\mathbf r') = \varepsilon_i\phi_i(\mathbf r)
$$

即 $[\hat T + \hat V_H + \hat V_F]\phi_i = \varepsilon_i\phi_i$，其中 Hartree 势局域、Fock 势非局域。这是传统教材和 Wikipedia 中常见的 HF 形式。

# Hartree-Fock 近似的另一种解释

前面把 HF 视为在 Slater 行列式空间中最小化能量。这里从另一个角度出发：**HF 哈密顿量只含双费米算符，我们希望用它近似含四费米算符的完整哈密顿量**。这不能完全一般地做，只能追求更弱的目标：**找一个在某个 Slater 行列式附近近似完整哈密顿量的双费米算符**。

四费米算符可写为（对未定的 Slater 行列式做正常序）：

$$
\hat c_\alpha^\dagger\hat c_\beta^\dagger\hat c_\gamma\hat c_\delta = \hat c_\alpha^\dagger\hat c_\delta\hat c_\beta^\dagger\hat c_\gamma - \hat c_\alpha^\dagger\hat c_\gamma\hat c_\beta^\dagger\hat c_\delta + (\text{正常序的 }:: \text{项})
$$

最后一项 $:\hat c_\alpha^\dagger\hat c_\beta^\dagger\hat c_\gamma\hat c_\delta:$ 要么湮灭 Slater 行列式、要么产生两个粒子-空穴激发。因此若把希尔伯特空间限制在 Slater 行列式及其单粒子-空穴激发上，忽略这项不影响算符的作用。由于 $\hat c_\alpha^\dagger\hat c_\beta = \langle\hat c_\alpha^\dagger\hat c_\beta\rangle + :\hat c_\alpha^\dagger\hat c_\beta:$，留下的表达式与

$$
\hat c_\alpha^\dagger\hat c_\delta\langle\hat c_\beta^\dagger\hat c_\gamma\rangle + \hat c_\beta^\dagger\hat c_\gamma\langle\hat c_\alpha^\dagger\hat c_\delta\rangle - \hat c_\alpha^\dagger\hat c_\gamma\langle\hat c_\beta^\dagger\hat c_\delta\rangle - \hat c_\beta^\dagger\hat c_\delta\langle\hat c_\alpha^\dagger\hat c_\gamma\rangle
$$

只差一个常数。把 $\hat c^\dagger\hat c^\dagger\hat c\hat c$ 替换成上式代入完整哈密顿量，给出的正是 HF 哈密顿量。这个解耦需自洽确定（需要 Slater 行列式的期望值如 $\langle\hat c_\alpha^\dagger\hat c_\delta\rangle$）。

# 应用：均匀电子气

电子气通常用 **Jellium 模型**描述：

$$
\hat H_{Jellium} = \sum_{\mathbf k,\sigma}\frac{\hbar^2k^2}{2m}\hat c_{\mathbf k\sigma}^\dagger\hat c_{\mathbf k\sigma} + \frac{1}{2L^d}\sum_{\substack{\mathbf k,\mathbf k',\sigma,\sigma'\\ \mathbf q\neq0}}V(\mathbf q)\hat c_{\mathbf k+\mathbf q\sigma}^\dagger\hat c_{\mathbf k'-\mathbf q\sigma'}^\dagger\hat c_{\mathbf k'\sigma'}\hat c_{\mathbf k\sigma}
$$

其中 $V(q) = 4\pi e^2/q^2$（三维）。Jellium 的 HF 哈密顿量为：

$$
\hat H_{Jellium}^{HF} = \sum_{\mathbf k,\sigma}\frac{\hbar^2k^2}{2m}\hat c_{\mathbf k\sigma}^\dagger\hat c_{\mathbf k\sigma} - \frac{1}{L^d}\sum_{\substack{\mathbf k,\mathbf k',\sigma,\sigma'\\ \mathbf q\neq0}}V(\mathbf q)\langle\hat c_{\mathbf k'-\mathbf q\sigma'}^\dagger\hat c_{\mathbf k'\sigma'}\rangle\hat c_{\mathbf k+\mathbf q\sigma}^\dagger\hat c_{\mathbf k\sigma}
$$

注意 **Hartree 项消失**（Jellium 中排除了 $\mathbf q=0$ 项）。假设电子形成均匀液体：

$$
\langle\hat c_{\mathbf k+\mathbf q\sigma}^\dagger\hat c_{\mathbf k'\sigma'}\rangle = n_{\mathbf k'\sigma'}\delta_{\mathbf k+\mathbf q,\mathbf k'}\delta_{\sigma\sigma'}
$$

则

$$
\hat H_{Jellium}^{HF} = \sum_{\mathbf k,\sigma}\left[\frac{\hbar^2k^2}{2m} + \varepsilon_{\mathbf k\sigma}^{ex}\right]\hat c_{\mathbf k\sigma}^\dagger\hat c_{\mathbf k\sigma}, \qquad
\varepsilon_{\mathbf k\sigma}^{ex} = -\frac1{L^d}\sum_{\mathbf q\neq0}V(\mathbf q)n_{\mathbf k+\mathbf q\sigma}
$$

相互作用是原色散的**负修正**。若进一步假设自旋非极化（$n_{\mathbf k\uparrow}=n_{\mathbf k\downarrow}$），问题完全求解：Slater 行列式与无相互作用电子相同，费米面包含恰好与电子数相同的态、全部占据。

色散 $\hbar^2k^2/2m + \varepsilon_{\mathbf k\sigma}^{ex}$（见图 Giuliani-Vignale 2.1）预言**带宽减小**，与实验观测矛盾。但 HF 近似正确预言了相互作用体系能量低于无相互作用电子。具体地，体系能量为：

$$
E = \sum_{\mathbf k\sigma}\left[\frac{\hbar^2k^2}{2m} + \frac{\varepsilon_{\mathbf k\sigma}^{ex}}{2}\right]n_{\mathbf k\sigma}
$$

**交换能 $\sum_{\mathbf k\sigma}\varepsilon_{\mathbf k\sigma}^{ex}n_{\mathbf k\sigma}/2$ 偏好自旋极化**，将在低电子密度下驱动体系进入自旋极化态。

# Hartree-Fock 态的局域稳定性

HF 态有两类稳定性：全局稳定性（是否是最低能量的 Slater 行列式，除极简单情形外难以回答）与局域稳定性（在 Slater 行列式空间中是否是局域极小，有明确答案）。

能量对 HF 轨道的一阶导数为零，因此只需看能量二阶变化。直接讨论单粒子约化密度矩阵 $\rho$ 的变分更便捷。Slater 行列式的密度矩阵是**幂等的**：$\rho^2 = \rho$。为保持这个约束，用 $\rho(\kappa) = e^{-\kappa}\rho_0e^{\kappa}$ 参数化变分（$\kappa$ 为反厄米矩阵生成的幺正旋转）。在 HF 轨道对角基下 $\rho_0 = n_n\delta_{nm}$、$H_{nm}^{HF} = \varepsilon_n\delta_{nm}$。

展开 $\rho(\kappa) = \rho_0 + [\rho_0,\kappa] + \frac12[[\rho_0,\kappa],\kappa] + \cdots$，一阶变分为 $\delta^{(1)}\rho_{nm} = (n_m-n_n)\kappa_{nm}$。能量二阶变化有两部分：$\frac12\sum_{n,m,l,k}(V_{lnmk}-V_{lnkm})\delta^{(1)}\rho_{mn}\delta^{(1)}\rho_{kl}$ 与 $\frac12\mathrm{Tr}(H^{HF}\delta^{(2)}\rho) = \frac12\sum_{(n|m)}\frac{\varepsilon_m-\varepsilon_n}{n_n-n_m}\delta^{(1)}\rho_{nm}\delta^{(1)}\rho_{mn}$（$(n|m)$ 表示轨道 $n,m$ 位于费米面两侧）。因此 **HF 局域稳定的条件是矩阵**

$$
\frac{\varepsilon_m-\varepsilon_n}{n_n-n_m}\delta_{nk}\delta_{ml} + V_{lnmk} - V_{lnkm}
$$

**正定**。

由此可证："在 HF 近似内，三维电子气的均匀顺磁态对自旋或电荷调制的形成是不稳定的。"电子气的均匀态在**所有密度**下都是 HF 能量的鞍点。至今不知道 Jellium 模型 HF 能量的真正极小态。

> **思考题**
> 1. 为什么 $\sum_n n_n\varepsilon_n$ 不是体系总能量？HF 能量与 HF 轨道能量的差是什么？
> 2. Hartree 势是局域的、Fock 势是非局域的——这如何影响求解 HF 方程的计算代价？
> 3. 为什么说"有限体系的稳定 HF 解必有能隙"？
> 4. 均匀电子气的 HF 色散预言带宽减小，为什么与实验矛盾？这预示 HF 近似在哪类体系失败？
