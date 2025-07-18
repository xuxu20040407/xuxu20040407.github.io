---
title: Bloch电子动力学
mathjax: true
date: 2025-06-13 11:07:51
tags: 固体物理
categories: 固体物理
cover:
---

在能带论的基础上，我们不再满足经典的Drude模型和Sommerfeld模型，而是希望基于能带论建立半经典模型。

# Bloch电子动力学

## Bloch电子的速度

我们此前已经证明，周期性势场中的单电子薛定谔方程的本征函数可以写成Bloch波形式：
$$\psi_k^n(\vec{r})=e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})$$
其中，$u_k^n(\vec{r})$是一个周期函数，满足$u_k^n(\vec{r}+\vec{R})=u_k^n(\vec{r})$，$\vec{R}$为晶格矢量。总的来说，Bloch波是由$u_k^n(\vec{r})$调幅的平面波。

将Bloch波代入薛定谔方程，得到：
$$\begin{aligned}
&\left[-\frac{\hbar^2}{2m}\nabla^2+V(\vec{r})\right]e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})=E_n(k)e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})\\
\Rightarrow& -\frac{\hbar^2}{2m}\nabla^2e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})=\left[E_n(k)-V(\vec{r})\right]e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})\\
\Rightarrow& -\frac{\hbar^2}{2m}\left[-\vec{k}^2e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})+2i\vec{k}e^{i\vec{k}\cdot\vec{r}}\nabla u_k^n(\vec{r})+e^{i\vec{k}\cdot\vec{r}}\nabla^2u_k^n(\vec{r})\right]=\left[E_n(k)-V(\vec{r})\right]e^{i\vec{k}\cdot\vec{r}}u_k^n(\vec{r})\\
\Rightarrow& -\frac{\hbar^2}{2m}\left[-\vec{k}^2u_k^n(\vec{r})+2i\vec{k}\nabla u_k^n(\vec{r})+\nabla^2u_k^n(\vec{r})\right]=\left[E_n(k)-V(\vec{r})\right]u_k^n(\vec{r})\\
\Rightarrow& -\frac{\hbar^2}{2m}\left[\nabla+i\vec{k}\right]^2 u_k^n(\vec{r})=\left[E_n(k)-V(\vec{r})\right]u_k^n(\vec{r})\\
\Rightarrow& -\frac{\hbar^2}{2m}\left[\nabla+i\vec{k}\right]^2 u_k^n(\vec{r})=\left[E_n(k)-V(\vec{r})\right]u_k^n(\vec{r})\\
\Rightarrow& \left[\frac{\left(\hat{p}+\hbar \vec{k}\right)^2}{2m}+V(\vec{r})\right]u_k^n(\vec{r})=E_n(k)u_k^n(\vec{r})\\
\end{aligned}$$
这里存在一个等效哈密顿量：
$$H_k=\frac{\left(\hat{p}+\hbar \vec{k}\right)^2}{2m}+V(\vec{r})$$
它告诉我们，平面波部分贡献了动量$\hbar \vec{k}$，这部分动量称为晶格动量，它是电子动量$\hat{p}\psi=(\hat{p}+\hbar \vec{k})u$的一部分。

按照速度的定义，电子的速度为：
$$\vec{v}=\frac{1}{m}\langle \psi_k^n|\hat{p}|\psi_k^n\rangle=\frac{1}{m}\langle u_k^n|\hat{p}+\hbar \vec{k}|u_k^n\rangle$$
同时，对$\hat{H}_k u_k^n(\vec{r})=E_n(k)u_k^n(\vec{r})$两边求导$\nabla_{\vec{k}}$，得到：

$$\frac{\hbar\left(\hat{p}+\hbar \vec{k}\right)}{m} u_k^n(\vec{r})+\hat{H}_k\nabla_{\vec{k}}u_k^n(\vec{r})=\nabla_{\vec{k}}E_n(k)u_k^n(\vec{r})+E_n(k)\nabla_{\vec{k}}u_k^n(\vec{r})$$
左乘$u_k^{n*}(\vec{r})$，得到：
$$\frac{\hbar}{m} \langle u_k^{n*}|\left(\hat{p}+\hbar \vec{k}\right)|u_k^n\rangle+ \langle u_k^{n*}|\hat{H}_k\nabla_{\vec{k}}|u_k^n\rangle= \langle u_k^{n*}|\nabla_{\vec{k}}E_n(k)u_k^n\rangle+ \langle u_k^{n*}|E_n(k)\nabla_{\vec{k}}u_k^n\rangle$$
由$\hat{H}_k$算符的厄密性，得到：
$$\begin{aligned}\
\frac{\hbar}{m} \langle u_k^{n*}|\left(\hat{p}+\hbar \vec{k}\right)|u_k^n\rangle+ \langle \hat{H}_k\nabla_{\vec{k}}u_k^{n*}|u_k^n\rangle&= \frac{\hbar}{m} \langle u_k^{n*}|\left(\hat{p}+\hbar \vec{k}\right)|u_k^n\rangle+ \langle E_n(k)u_k^{n*}|\nabla_{\vec{k}}u_k^n\rangle\\
&= \nabla_{\vec{k}}E_n(k)\langle u_k^{n*}|u_k^n\rangle+ \langle u_k^{n*}|E_n(k)\nabla_{\vec{k}}u_k^n\rangle\\
\end{aligned}$$
自然得到速度公式：
$$\vec{v}=\frac{1}{\hbar} \nabla_{\vec{k}}E_n(k)$$
由于Bloch波是与时间无关的定态，则平均速度会永远保持不变，意思就是理想晶体金属拥有无穷大的电导率。实际上，由于缺陷的存在（或者晶格的振动），电子会受到散射，不能被无限加速。这一机制可以被碰撞和弛豫时间描述，我们在 {% post_link '固体物理/金属电子论' %} 已然谈到（尽管动机和假设不同）。

## 半经典模型

每个电子具有确定的位置$\vec{r}$、波矢$\vec{k}$和能带指标$n$，对于给定的能带$E_n(k)$，电子在外电场$\vec{E}(\vec{r},t)$和磁场$\vec{B}(\vec{r},t)$下的运动遵循以下规则：
- 能带指标是守恒量，忽略电子跃迁的可能；
- 电子的速度为：
  $$\vec{v}=\frac{1}{\hbar} \nabla_{\vec{k}}E_n(k)$$
- 电子的动力学方程：
  $$\hbar\dot{\vec{k}}=-e\left[\vec{E}(\vec{r},t)+\vec{v}_n(\vec{k})\times\vec{B}(\vec{r},t)\right]$$

从两条基本方程出发，可以导出加速度公式：
$$\dot{\vec{v}}=\frac{\partial }{\partial t}\vec{v}=\frac{\partial \vec{k}}{\partial t}\nabla_{\vec{k}}\vec{v}=\frac{1}{\hbar} \nabla_{\vec{k}}\nabla_{\vec{k}}E_n(k)\frac{\partial \vec{k}}{\partial t}$$
写入动量，可以得到更有物理意义的形式：
$$\dot{\vec{v}}=\frac{1}{\hbar^2} \nabla_{\vec{k}}\nabla_{\vec{k}}E_n(k)\frac{\partial \hbar\vec{k}}{\partial t}=\frac{1}{\hbar^2} \nabla_{\vec{k}}\nabla_{\vec{k}}E_n(k)\vec{F}_{ext}$$
这样就得到了有效质量的表达式：
$$\left[\frac{1}{m^*}\right]_{ij}=\frac{1}{\hbar^2}\left[\frac{\partial^2 E_n(k)}{\partial k_i \partial k_j}\right]$$
我们在 {% post_link '固体物理/能带论' %} 中已经讨论过了简单立方晶体的有效质量。注意到可以通过合理选取主轴使得有效质量张量对角化，得到有效质量的三个主值：
$$\frac{1}{m^*}=\frac{1}{\hbar^2}\left[\frac{\partial^2 E_n(k)}{\partial k_x^2},\frac{\partial^2 E_n(k)}{\partial k_y^2},\frac{\partial^2 E_n(k)}{\partial k_z^2}\right]$$
对于上下延展的能带，从表达式可知有效质量较小；而对于横向延展的能带，有效质量较大。从紧束缚模型的角度看，是因为后者更为局域，就像质量较大的粒子一样。

在 {% post_link '固体物理/金属电子论' %} 中提到了电导的表达式：
$$C_V=\gamma T+\beta T^3,\quad C_V(0)\propto m^{*-1}$$
所以有效质量可以通过测量电导来得到：
$$m^*=\frac{\gamma_{exp}}{\gamma_0}m$$


# 恒定电场磁场中Bloch电子的运动

## 恒定电场

$$\hbar\dot{\vec{k}}=-e\vec{E}\Rightarrow \dot{\vec{k}}=\vec{k}_0-\frac{e}{\hbar}\vec{E}$$
对于自由电子，由于$\hbar\vec{k}$就是电子动量，所以电子会被无线加速。

对于Bloch电子，速度的变化为：
$$v[\vec{k}(t)]=v[\vec{k}_0-\frac{e}{\hbar}\vec{E}t]$$
然而速度函数是一个有界周期函数，所以电子的速度会在一个周期内来回振荡，周期为：
$$T=\frac{2\pi\hbar}{eEL}$$

![alt](/img/固体物理/恒定电场.png)

在直流电场下产生交流电流，被称为Bloch振荡（因为晶格缺陷，散射周期$\tau$远小于布里渊区周期$T$）。具体来说，电子越过A点后，有效质量变为负数，则速度不增反减，越过C点后，进入C'点，开启新的周期运动。

显然，如果能带被填满，那么由于$\vec{k}$和$-\vec{k}$的对称性，电子的平均速度为0，电流为0。如果不加入散射机制，能带被部分填充时，也不会有净电流。必须让散射机制起作用，才能打破这种对称性，让电子停留在非对称态。

![alt](/img/固体物理/能带导电.png)

> 利用非经典模型可以结合能带解释导电现象。对于导体（conductor），其费米面刚好在能带之内；对于半导体（semiconductor）和绝缘体（insulator），费米面在带隙之中，但是半导体的带隙较小，一般在$0\sim2eV$之间，绝缘体的带隙较大。半导体在有限温度时，价带（valence band）中的部分电子被热激发到导带（conduction band）中，形成导电电子和空穴。杂质贡献不明显的叫做本征半导体（intrinsic），杂质贡献明显的叫做非本征半导体（extrinsic）。
> 
> ![alt](/img/固体物理/导体和绝缘体.png)
>
> 这样说来，二价金属应当是绝缘体，但由于s带和p带的重叠，形成了一个小的导带，所以二价金属仍然是导体。
>
> ![alt](/img/固体物理/Mg.png)

## 恒定磁场

