---
title: EPR-Paradox
mathjax: true
date: 2024-09-05 15:00:15
tags:  量子力学2
categories:  量子力学2
cover:
---
- [Where is the particle?](#where-is-the-particle)
- [EPR佯谬](#epr佯谬)
- [Bell不等式](#bell不等式)

# Where is the particle?
对量子力学中的粒子到底处于何处，长久以来有以下多种看法：
1. Realist Position：现实主义学派认为粒子有一个确定的位置，而测量给出了这个位置的结果。这说明量子力学并不是一个完备的学说，因为他没有办法精确地给出粒子的真实位置，而只是给出了在该位置的几率。
2. Orthodox Position：正统学派认为，粒子哪里也不在，是测量使得波函数坍缩。
3. Agnonstic Position：要讨论粒子测量前在哪里，首先就需要测量。不可知学派认为讨论“测量前”的状态是没有意义的。

# EPR佯谬
一个$\pi$介子会衰变为一个正电子和负电子：
$$\pi^0\Rightarrow e^++e^-$$
当我测量其中一个粒子的自旋时，我可以立即知道另一个粒子的自旋——这是因为$\pi$介子的自旋是0。

对于现实主义学派，这是没有问题的，发射的粒子的自旋已经被确定好。但是对于正统学派却不然——如果两个粒子相距足够远，那么“从该粒子自旋确定另一粒子的自旋”的信息的传递就就会超过光速，这也成为了现实主义学派攻讦的理由，因为局域性原理（影响的传递不会超过光速）是长期公认的原理。

如果认为局域性原理成立，那么就有可能出现两个粒子在同时测量的时候都选择了自旋朝上。然而这被实验否定了，这很自然的推出量子力学是不完备的。为了形式地描述该现象，他们引入了隐变量$\lambda$，其可以描述$\pi$介子衰变的电子到底是什么自旋。

此处逻辑的问题在于，局域性原理是假定的。如果认为局域性原理成立，那么必然有隐变量存在。然而贝尔不等式证明了隐变量不存在，这反推得出了局域性原理不成立。

# Bell不等式

在$\pi$介子的两端放置测量装置，分别测量沿着$\vec{a}$和$\vec{b}$方向的自旋。显然，左右两个装置的测量结果只能是$\pm 1$，而且是相互关联的。

由于只有两者自旋的乘积的平均值是有意义的，我们记为
$$\langle P(\vec{a},\vec{b})\rangle$$

对于$\vec{a}=\vec{b}$的情况，显然$\langle P(\vec{a},\vec{b})\rangle=-1$；对于$\vec{a}=-\vec{b}$的情况，显然$\langle P(\vec{a},\vec{b})\rangle=+1$。对于任意夹角的情况，下面给出了一种计算方法：

两个粒子的自旋依照之前文章的约定，记为（省略单位$\frac{\hbar^2}{4}$）：
$$|\psi\rangle=\frac12\begin{pmatrix}1\\0\end{pmatrix}\begin{pmatrix}0\\1\end{pmatrix}+\frac12\begin{pmatrix}0\\1\end{pmatrix}\begin{pmatrix}1\\0\end{pmatrix}$$
选取$\vec{a}$为轴，记天顶角夹角为$\theta$，那么测量的平均值为：
$$\begin{aligned}
\langle P(\vec{a},\vec{b})\rangle&=\langle\psi|S_z^a(S_z^b\cos{\theta}+S_x^b\sin{\theta})|\psi\rangle\\
&=\langle\psi|\begin{pmatrix}1&0\\0&-1\end{pmatrix}\left[\begin{pmatrix}1&0\\0&-1\end{pmatrix}\cos{\theta}+\begin{pmatrix}0&1\\1&0\end{pmatrix}\sin{\theta}\right]|\psi\rangle\\
&=\langle\psi|\begin{pmatrix}1&0\\0&-1\end{pmatrix}\begin{pmatrix}\cos{\theta}&\sin{\theta}\\\sin{\theta}&-\cos{\theta}\end{pmatrix}|\psi\rangle\\
&=\frac12\langle\begin{pmatrix}1\\0\end{pmatrix}|\begin{pmatrix}1&0\\0&-1\end{pmatrix}|\begin{pmatrix}1\\0\end{pmatrix}\rangle \langle\begin{pmatrix}0\\1\end{pmatrix}|\begin{pmatrix}\cos{\theta}&\sin{\theta}\\\sin{\theta}&-\cos{\theta}\end{pmatrix}|\begin{pmatrix}0\\1\end{pmatrix}\rangle\\
&+\frac12\langle\begin{pmatrix}0\\1\end{pmatrix}|\begin{pmatrix}1&0\\0&-1\end{pmatrix}|\begin{pmatrix}0\\1\end{pmatrix}\rangle\langle\begin{pmatrix}1\\0\end{pmatrix}|\begin{pmatrix}\cos{\theta}&\sin{\theta}\\\sin{\theta}&-\cos{\theta}\end{pmatrix}|\begin{pmatrix}1\\0\end{pmatrix}\rangle\\
&=-\cos{\theta}=-\vec{a}\cdot\vec{b}
\end{aligned}$$
这只是一个期望值的理论，但左右两个装置具体测量结果是什么，在测量前我们是不知道的。由此，我们认为量子力学是不完备的，那么引入隐变量$\lambda$，记装置受隐变量影响的测量结果分别为：
$$A(\vec{a},\lambda)=\pm1,B(\vec{b},\lambda)=\pm1$$
并且有约束条件：
$$A(\vec{a},\lambda)=-B(\vec{a},\lambda)$$
平均值重新计算为：
$$\langle P(\vec{a},\vec{b})\rangle=\int \rho(\lambda)A(\vec{a},\lambda)B(\vec{b},\lambda)d\lambda=-\int \rho(\lambda)A(\vec{a},\lambda)A(\vec{b},\lambda)d\lambda$$

有以下不等式：
$$\begin{aligned}
\langle P(\vec{a},\vec{b})\rangle-\langle P(\vec{a},\vec{c})\rangle&=-\int \rho(\lambda)[A(\vec{a},\lambda)A(\vec{b},\lambda)-A(\vec{a},\lambda)A(\vec{c},\lambda)]d\lambda\\
&=-\int \rho(\lambda)A(\vec{a},\lambda)A(\vec{b},\lambda)[1-A(\vec{b},\lambda)A(\vec{c},\lambda)]d\lambda\\
\end{aligned}$$
$$\begin{aligned}
|\langle P(\vec{a},\vec{b})\rangle-\langle P(\vec{a},\vec{c})\rangle|
&=|\int \rho(\lambda)A(\vec{a},\lambda)A(\vec{b},\lambda)[1-A(\vec{b},\lambda)A(\vec{c},\lambda)]d\lambda|\\
&\leq \int \rho(\lambda)|A(\vec{a},\lambda)A(\vec{b},\lambda)|[1-A(\vec{b},\lambda)A(\vec{c},\lambda)]d\lambda\\
&= \int \rho(\lambda)[1-A(\vec{b},\lambda)A(\vec{c},\lambda)]d\lambda\\
&= 1+\langle P(\vec{b},\vec{c})\rangle\\
\end{aligned}$$

如果量子力学是正确的，那么任意取$\vec{a}\perp\vec{b}$的情况：
$$\begin{aligned}
|\langle P(\vec{a},\vec{b})\rangle-\langle P(\vec{a},\vec{c})\rangle|&\leq1+\langle P(\vec{b},\vec{c})\rangle\\
\Leftrightarrow \cos{\theta}&\leq 1+\sin{\theta}
\end{aligned}$$
这个式子显然不是恒成立的，所以在量子力学正确的假设下，量子力学是不需要隐变量的。


