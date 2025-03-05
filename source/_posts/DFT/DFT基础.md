---
title: Introduction
mathjax: true
date: 2025-03-04 13:00:03
tags: DFT
categories: DFT
cover:
---

# Hartree-Fock方法

许多电子系统的结构和动力学性质是理论物理和化学中的基本问题。这些系统包括：
- 原子
- 分子
- 介观系统（如团簇、量子点）
- 固体（包括层状结构、表面和准晶体）

这些系统的性质可以分为结构性质（如电子壳层结构、结合能、电/磁矩、几何构型）和动力学性质（如电子激发谱、光谱性质、散射过程等）。

研究这些性质的两种主要方法是：基于薛定谔方程的第一性原理计算（ab-initio）方法和基于模型哈密顿量（model Hamiltonian）的方法。密度泛函理论（DFT）就是基于前者的理论。

可以写出多体系统的哈密顿量为：
$$
\hat{H} = \hat{T}_n + \hat{V}_{n-n} + \hat{H}_{e}
$$

$$
\hat{H}_{e} = \hat{T}_e+\hat{V}_{n-e}+\hat{V}_{e-e}
$$

其中，$\hat{T}_n$是原子核动能：
$$
\hat{T}_n = -\sum_{I}\frac{\hbar^2}{2M_I}\nabla_I^2
$$

$\hat{V}_{n-n}$是原子核间相互作用：
$$
\hat{V}_{n-n} = \sum_{I<J}\frac{Z_IZ_Je^2}{|\mathbf{R}_I-\mathbf{R}_J|}
$$

$\hat{T}_e$是电子动能：
$$
\hat{T}_e = -\sum_{i}\frac{\hbar^2}{2m_e}\nabla_i^2
$$

$\hat{V}_{n-e}$是原子核和电子间相互作用：
$$
\hat{V}_{n-e} = -\sum_{i,I}\frac{Z_Ie^2}{|\mathbf{r}_i-\mathbf{R}_I|}
$$

$\hat{V}_{e-e}$是电子间相互作用：
$$
\hat{V}_{e-e} = \sum_{i<j}\frac{e^2}{|\mathbf{r}_i-\mathbf{r}_j|}
$$

这样的哈密顿量当然还存在近似：
- 忽视了动能项的相对论效应；
- 忽视了原子核的大小；
- 忽视了带电粒子间的作用的相对论效应；

即便是这样近似的哈密顿量，仍然是超级复杂的：
$$
\hat{H}\Psi(\mathbf{R}_1,\cdots,\mathbf{R}_N,\mathbf{r}_1\sigma_1,\cdots,\mathbf{r}_n\sigma_n) = E\Psi(\mathbf{R}_1,\cdots,\mathbf{R}_N,\mathbf{r}_1\sigma_1,\cdots,\mathbf{r}_n\sigma_n)
$$

可以认为由于原子核极重，原子核波函数和电子波函数可以分离，这就是Born-Oppenheimer近似（又称为绝热近似）。这样，我们可以将多体系统的波函数分解为电子波函数和原子核波函数的乘积：
$$
\Psi(\mathbf{R}_1,\cdots,\mathbf{R}_N,\mathbf{r}_1\sigma_1,\cdots,\mathbf{r}_n\sigma_n) = \Psi_n(\mathbf{R}_1,\cdots,\mathbf{R}_N)\Psi_e(\mathbf{r}_1\sigma_1,\cdots,\mathbf{r}_n\sigma_n)
$$

最简单的对电子波函数的近似是Hartree近似，即认为电子波函数是独立的，这样的波函数可以写为：
$$
\Phi_e(\mathbf{r}_1\sigma_1,\cdots,\mathbf{r}_n\sigma_n) = \frac{1}{\sqrt{N!}}\begin{vmatrix}\psi_1(\mathbf{r}_1\sigma_1)&\cdots&\psi_n(\mathbf{r}_1\sigma_1)\\\vdots&\ddots&\vdots\\\psi_1(\mathbf{r}_n\sigma_n)&\cdots&\psi_n(\mathbf{r}_n\sigma_n)\end{vmatrix}
$$

此后用$\Phi$来表示独立电子波函数，而用$\Psi$来表示多体波函数。

我们接下来就要推导出HF方程。先考虑基态的电子波函数能量：
$$
\begin{aligned}
E[\Phi] = \langle\Phi|\hat{H}_e|\Phi\rangle&= \sum_{i=1}^{n}\sum_{\sigma=\uparrow,\downarrow}\langle\psi_i|-\frac{\hbar^2\nabla^2}{2m}+V_{ext}|\psi_i\rangle \\&+ \frac{1}{2}\sum_{i,j=1}^{n}\sum_{\sigma,\sigma'=\uparrow,\downarrow}\left[\langle\psi_i\psi_j|\frac{e^2}{|\mathbf{r}_i-\mathbf{r}_j|}|\psi_i\psi_j\rangle - \langle\psi_i\psi_j|\frac{e^2}{|\mathbf{r}_i-\mathbf{r}_j|}|\psi_j\psi_i\rangle\right]
\end{aligned}
$$

对其做变分，得到HF方程：
$$
\begin{aligned}
\left[-\frac{\hbar^2\nabla^2}{2m}+V_{ext}(\mathbf{r})+V_H(\mathbf{r})+V^{HF}_{x}(\mathbf{r},\mathbf{r'})\right]\psi_i(\mathbf{r}) &= \varepsilon_i\psi_i(\mathbf{r})\\
V_H(\mathbf{r}) &= \int d\mathbf{r}'\frac{e^2}{|\mathbf{r}-\mathbf{r}'|}\rho(\mathbf{r}')\\
\rho(\mathbf{r}) &= \sum_{\sigma=\uparrow,\downarrow}\sum_{i=1}^{n}|\psi_i(\mathbf{r})|^2\\
V_{x}^{HF}(\mathbf{r},\mathbf{r'}) &= -\frac{e^2}{|\mathbf{r}-\mathbf{r}'|}\sum_{i=1}^{n}\left[\psi_i^*(\mathbf{r})\psi_i(\mathbf{r'})\right]
\end{aligned}
$$

数值计算中，常用基组波函数来展开电子波函数：
$$
\psi_i(\mathbf{r}) = \sum_{\mu}C_{\mu i}\phi_{\mu}(\mathbf{r})
$$
通常可以选择：
- 平面波基组：适用于周期性体系；
- 高斯基组：适用于分子和小团簇；
- 原子轨道基组：适用于分子和固体表面。

这样，我们就有了成体系的HF方法。然而HF方法的复杂度较高，这就引出了DFT理论。不过在学习DFT理论之前，我们还得学习一些前提知识。

# DFT基础

## Hohenberg-Kohn定理

Hohenberg-Kohn定理是DFT理论的基础。它的内容是：
- 给定一个基态的电子密度分布$n_0(\mathbf{r})$，体系的哈密顿量$\hat{H}$和外势$V_{ext}(\mathbf{r})$是唯一确定的。
  - 两个不同的哈密顿量$\hat{H}$不会具有相同的基态；
  - 两个不同的哈密顿量$\hat{H}$对应的基态空间，不会具有相同的基态电子密度分布$n_0(\mathbf{r})$；
- 给定一个外势$V_{ext}(\mathbf{r})$，可以定义能量泛函$E[n]$，使得体系的基态能量$E_0$是这个泛函的最小值。

用公式表示就是：
$$
V_{ext}(\mathbf{r})\Leftrightarrow |\Psi_0\rangle\Leftrightarrow n_0(\mathbf{r})
$$

### 第一定理
我们先证明第一个定理的第一部分：同一个基态是否可以对应两个不同的哈密顿量？
$$
\hat H_1|\Psi_0\rangle = E_0|\Psi_0\rangle, \quad \hat H_2|\Psi_0\rangle = E_0|\Psi_0\rangle
$$
哈密顿量仅有外势项不同：
$$
[(V_{ext1}(\mathbf{r})-V_{ext2}(\mathbf{r}))-(E_1-E_2)]|\Psi_0\rangle = 0
$$
仅有可能有两种情况：
- $V_{ext1}(\mathbf{r})-V_{ext2}(\mathbf{r}) =E_1-E_2$；
- $|\Psi_0\rangle$是零态；

这样便完成了第一定理的第一部分的证明。接着是第二部分的证明：同一个基态是否可以对应两个不同的基态电子密度分布$n_0(\mathbf{r})$？

假定两个哈密顿量$\hat H_1,\hat H_2$对应的基态电子密度分布相同，即$n_0(\mathbf{r})$。那么，两个哈密顿量的基态波函数$\Psi_0^{(1)},\Psi_0^{(2)}$由变分原理有：
$$
\langle \Psi_0^{(1)}|\hat H_2|\Psi_0^{(1)}\rangle >E_2, \quad \langle \Psi_0^{(2)}|\hat H_1|\Psi_0^{(2)}\rangle >E_1
$$
这样就有：
$$
\langle \Psi_0^{(1)}|\hat H_1+V_{ext2}-V_{ext1}|\Psi_0^{(1)}\rangle >E_2, \quad \langle \Psi_0^{(2)}|\hat H_2+V_{ext1}-V_{ext2}|\Psi_0^{(2)}\rangle >E_1
$$

二者相加有：
$$
E_1+E_2>E_2+E_1
$$
第二部分得证。

### 第二定理
由第一部分，基态的电子密度与哈密顿量是一一对应的。那么，我们可以定义能量泛函$E[n]$，使得体系的基态能量$E_0$是这个泛函的最小值，同时电子密度$n_0(\mathbf{r})$是基态波函数对应的电子密度。

> 对于可能存在基态简并的体系，即便同一个哈密顿量可能对应不同的基态波函数和电子密度，但给定基态电子密度仍然唯一对应了基态能量，也就是说，能量仍可以表示为电子密度的泛函。


