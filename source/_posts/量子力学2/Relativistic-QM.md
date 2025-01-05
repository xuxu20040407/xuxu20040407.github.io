---
title: Relativistic-QM
mathjax: true
date: 2025-01-02 14:03:51
tags: 量子力学2
categories: 量子力学2
cover:
---

将非相对论性量子力学（NRQM）推广到相对论情形的尝试注定会是失败的，因为量子力学要求的概率守恒在相对论中不再成立，能量会产生新的粒子，因此量子场论（QFT）才是正确的框架。不过，当粒子的能量较小的时候，我们可以认为没有新粒子的产生，进而构建相对论性量子力学（RQM），Klein-Gordon方程和Dirac方程就是那时沿此思路所得的两个产物。

Klein-Gordon方程具有一些神奇的困难，不过Dirac方程却是一个很好的过渡，其以很自然的方式：
- 导出电子的朗德因子
- 导出了氢原子光谱精细结构
- 预言了带正电荷的反粒子——正电子的存在

Dirac方程仍然存在负能解的问题，这就是狄拉克之海的由来。

在此之前，我们先介绍有用的单位制。

# 自然单位制

$$\hbar=c=1$$

1. $c=1$意味着时间和空间的单位是一样的。同时，质能方程$E=mc^2$变为$E=m$，意味着质量和能量的单位也是一样的。
2. $\hbar=1$意味着长度的量纲是动量的倒数，同时也是能量单位的倒数。


# 克莱因-戈登方程
相对论中，粒子的能量为：
$$E=\frac{p^2}{2m}\Rightarrow E=\sqrt{p^2+m^2}=m+\frac{p^2}{2m}-\frac{p^4}{8m^3}+\cdots\approx m+\frac{p^2}{2m}$$

一个显然的尝试是将原来的薛定谔方程：
$$i\partial_t|\psi\rangle=(\frac{p^2}{2m}+m)|\psi\rangle$$
写为：
$$i\partial_t|\psi\rangle=\sqrt{p^2+m^2}|\psi\rangle$$
然而，将$\sqrt{p^2+m^2}$展开会得到一个无穷级数，这导致了几个问题：
- 对时间和空间的导数的不平等的；
- 难以操作；
- 无穷次对空间的倒数意味着非定域性。

基于此，我们可以写出克莱因-戈登方程：
$$(\partial_t^2-\nabla^2+m^2)|\psi\rangle=0$$
这同样具有一些瑕疵：根据概率流密度的形式，可以推广出：
$$\rho=\frac{i}{2m}(\psi^*\partial_t \psi-\psi\partial_t \psi^*)$$
这是一个可能为负的量，这意味着概率不再是正定的。

> 对于自由粒子的平面波，克莱因-戈登方程能够给出正确的的色散关系。代入$\psi=e^{i(px-Et)}$，得到：
> $$E^2=p^2+m^2$$


# 狄拉克方程
为了避免二阶时间导数的产生，狄拉克选择在原有哈密顿算符的基础上进行修正：
$$\hat H=\vec{\alpha}\cdot \hat p+\beta m$$
其中$\alpha$和$\beta$是矩阵，满足：
$$\vec{\alpha}=\begin{pmatrix}0&\vec{\sigma}\\\vec{\sigma}&0\end{pmatrix},\quad \beta=\begin{pmatrix}I&0\\0&-I\end{pmatrix}$$

## 静止粒子
对于$\vec{p}=0$的情况，哈密顿算符为：
$$\hat H=\beta m=\begin{pmatrix}1&0&0&0\\0&1&0&0\\0&0&-1&0\\0&0&0&-1\end{pmatrix}m$$
解得：
- 正能解：
$$\psi_1=\begin{pmatrix}1\\0\\0\\0\end{pmatrix}e^{-imt}$$
$$\psi_2=\begin{pmatrix}0\\1\\0\\0\end{pmatrix}e^{-imt}$$
- 负能解：
$$\psi_3=\begin{pmatrix}0\\0\\1\\0\end{pmatrix}e^{imt}$$
$$\psi_4=\begin{pmatrix}0\\0\\0\\1\end{pmatrix}e^{imt}$$


## 自由粒子
对于$\vec{p}=p\hat{z}$的情况，哈密顿算符为：
$$\hat H=\vec{\alpha}\cdot \vec{p}+\beta m=\begin{pmatrix}0&\vec{\sigma}\cdot \vec{p}\\\vec{\sigma}\cdot \vec{p}&0\end{pmatrix}+m\begin{pmatrix}I&0\\0&-I\end{pmatrix}=\begin{pmatrix}m&0&p&0\\0&m&0&-p\\p&0&-m&0\\0&-p&0&-m\end{pmatrix}$$
解得：
- 正能解：
$$\psi_1=\begin{pmatrix}1\\0\\\frac{p}{\sqrt{p^2+m^2}+m}\\0\end{pmatrix}e^{i(pz-Et)}$$
$$\psi_2=\begin{pmatrix}0\\1\\0\\\frac{-p}{\sqrt{p^2+m^2}+m}\end{pmatrix}e^{i(pz-Et)}$$
- 负能解：
$$\psi_3=\begin{pmatrix}\frac{-p}{\sqrt{p^2+m^2}-m}\\0\\1\\0\end{pmatrix}e^{i(pz-Et)}$$
$$\psi_4=\begin{pmatrix}0\\\frac{p}{\sqrt{p^2+m^2}-m}\\0\\1\end{pmatrix}e^{i(pz-Et)}$$

定义螺旋度算符：
$$\vec{\Sigma}\cdot \hat{e}_p=\begin{pmatrix}\vec{\sigma}&0\\0&\vec{\sigma}\end{pmatrix}\cdot \hat{e}_p$$
在本题中：
$$\vec{\Sigma}\cdot \hat{e}_z=\begin{pmatrix}\vec{\sigma}\cdot \hat{e}_z&0\\0&\vec{\sigma}\cdot \hat{e}_z\end{pmatrix}=\begin{pmatrix}1&0&0&0\\0&-1&0&0\\0&0&1&0\\0&0&0&-1\end{pmatrix}$$
将上述波函数被螺旋算符作用，发现结果有正有负，定义正螺旋度为右手波函数，所有波函数可分类为：
- $\psi_R^{(+)}$
- $\psi_L^{(+)}$
- $\psi_R^{(-)}$
- $\psi_L^{(-)}$
