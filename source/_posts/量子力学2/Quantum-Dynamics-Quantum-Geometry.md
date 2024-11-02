---
title: Quantum Dynamics & Quantum Geometry
mathjax: true
date: 2024-08-15 10:56:17
tags: 量子力学2
categories: 量子力学2
cover:
---
- [薛定谔绘景](#薛定谔绘景)
  - [定态和叠加态](#定态和叠加态)
    - [自旋的进动](#自旋的进动)
    - [中微子振荡](#中微子振荡)
- [海森堡绘景](#海森堡绘景)
- [Harmonic Oscillator and Coherence State](#harmonic-oscillator-and-coherence-state)
  - [谐振子](#谐振子)
  - [相干态](#相干态)
- [朗道能级](#朗道能级)
  - [经典理论](#经典理论)
  - [半经典量子理论](#半经典量子理论)
  - [简并](#简并)
  - [量子化霍尔电导](#量子化霍尔电导)
- [规范变换](#规范变换)
- [几何相位](#几何相位)
  - [绝热近似](#绝热近似)
- [量子几何](#量子几何)


# 薛定谔绘景
薛定谔方程描述了量子态随时间的演化：
$$\mathrm{i}\hbar\frac\partial{\partial t}|\psi(t)\rangle=H|\psi(t)\rangle $$
或者使用时间演化算符$\hat{U}(t)=\exp[-\dfrac{it}{\hbar}\hat{H}]$表示为：
$$|\psi(t)\rangle=\hat{U}(t)|\psi(0)\rangle$$
代入时间演化算符，可以获得简洁一般（不要求哈密顿量不含时）的薛定谔方程表达式：
$$i{\hbar}\partial_t\hat{U}(t,t_0)=\hat{H}(t)\hat{U}(t,t_0)$$
薛定谔绘景描述了在确定的算符作用下，量子态的演化过程。

为了推导该方程的形式解，我们分以下三种情况：
- 哈密顿算符不依赖时间：则容易解出
$$\hat U(t,t_0)=\exp[-\dfrac{i(t-t_0)}{\hbar}\hat{H}]$$
- 哈密顿算符与时间相关，但不同时刻的哈密顿量算符对易：
$$\hat U(t,t_0)=\exp[-\dfrac{i}{\hbar}\int_{t_0}^t\hat{H}(t^\prime)dt^\prime]$$
- 哈密顿算符与时间相关，但不同时刻的哈密顿量算符不对易：
$$\hat U(t,t_0)=1+\sum_{n=1}^\infty(\dfrac{-i}{\hbar})^n\int_{t_0}^tdt_1\int_{t_0}^{t_1}dt_2\cdots\int_{t_0}^{t_{n-1}}dt_n\hat{H}(t_1)\hat{H}(t_2)\cdots\hat{H}(t_n)$$
## 定态和叠加态
我们只考虑以上的第一种情况，那么时间算符同时与哈密顿算符对易，态矢量的演化可以用能量本征右矢表示：
$$|\alpha,t\rangle=\sum_nc_n|a_n,t\rangle=\sum_nc_n\exp[-\frac{iE_nt}{\hbar}]|a_n,t=0\rangle$$
所以不同的本征态会有不同的相位频率。这引出了定态的概念——本征态的可观测量是不变的，而叠加态会变化。

### 自旋的进动
一个例子是自旋的进动。
$$\hat{H}=\omega S_z,E_\pm=\mp\frac{e\hbar B}{2m_ec}$$
可以得到：
$$\begin{aligned}|\langle \hat{S_x}\rangle|^2
&=\frac{\hbar^2}{4}|(\sin{\phi}\exp(\frac{+i\omega t}{2})\langle +|+\cos{\phi}\exp(\frac{-i\omega t}{2})\langle -|)\\&\times(\sin{\phi}\exp(\frac{-i\omega t}{2})| -\rangle+\cos{\phi}\exp(\frac{+i\omega t}{2})| +\rangle)|^2\\
&=|\sin{\phi}\cos{\phi}(\exp(-i\omega t)+\exp(+i\omega t))|^2\\
&=\sin^2{\phi}\cos^2{\phi}\cos^2{\omega t}\end{aligned}$$
只有当初始为定态时，其可观测量才不会变。

### 中微子振荡

$$\begin{aligned} {| \nu_{e} \rangle} & { =\operatorname{c o s} \theta| \nu_{1} \rangle-\operatorname{s i n} \theta| \nu_{2} \rangle} \\ {| \nu_{\mu} \rangle} & {=\operatorname{s i n} \theta| \nu_{1} \rangle+\operatorname{c o s} \theta| \nu_{2} \rangle} \\ \end{aligned}$$

# 海森堡绘景



考虑一个自由运动的粒子：
$$\hat H =\frac{\hat p^2}{2m}$$

$$\frac{d\hat p}{dt}=0\Rightarrow \hat p(t)=\hat p(0)$$
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}\Rightarrow \hat x(t)=\hat x(0) +\frac{\hat p(0)}{m}t$$
所以：
$$[\hat x(t),\hat x(0)]=\frac{-i\hbar t}{m}\Rightarrow \Delta\hat x(t)\Delta\hat x(0)\geq \frac{\hbar t}{2m}$$


对于势场中的粒子：
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}$$
$$\frac{d^2\hat x}{dt^2}=-\frac{\vec\nabla\hat V(\vec x)}{m}$$
$$m\frac{d^2\langle\hat x\rangle}{dt^2}=-\langle\vec\nabla\hat V(\vec x)\rangle$$


# Harmonic Oscillator and Coherence State

## 谐振子

## 相干态
湮灭算符的本征右矢定义为相干态：
$$\hat a|\lambda\rangle=\lambda |\lambda\rangle$$

$$|\lambda\rangle=e^{\frac{-|\lambda|^2}{2}}e^{\lambda \hat a^\dagger}|0\rangle$$

# 朗道能级
## 经典理论
对于经典力学的方法，可以得到拉莫尔半径和频率：
$$R=\frac{mV}{eB},\omega=\frac{eB}{m}$$

对于分析力学：
$$H=\frac{(\vec p-e \vec{A})^2}{2m}$$
$$\begin{cases}
\dot{\vec{x}}=\frac{\partial  H}{\partial \vec{p}}=\frac{(\vec p-e \vec{A})}{2m}\\
\dot{\vec{p}}=-\frac{\partial  H}{\partial \vec{x}}=\frac{-e(\vec p-e \vec{A})_i}{2m}\nabla \vec{A_i}
\end{cases}$$

$$\ddot{\vec{x}}=e\vec{v}\times\vec{B}$$

如果还有电场：
$$\ddot{\vec{x}}=e\vec{v}\times\vec{B}+e\frac{\vec{E}}{m}$$

假设电场朝x方向且磁场朝y方向，这可以解出：
$$\begin{cases}
x(t)=R\cos{\omega t}\\
y(t)=R\sin{\omega t}-\frac{eE_xt}{m\omega}
\end{cases}$$
这就是经典霍尔效应。

## 半经典量子理论
半经典近似指磁场未被量子化。磁场中的哈密顿量为：
$$\hat H=\frac{(\hat p-e \vec{A})^2}{2m}=\frac{\hat\pi_x^2}{2m}+\frac{\hat\pi_y^2}{2m}$$
遵循上述的分解方法：
$$[\hat\pi_x,\hat\pi_y]=-e([\hat p_x,A_y]+[A_x,\hat p_y])=i\hbar eB=i\hbar \omega m$$
$$\hat H=(\hat\pi_x-i\hat\pi_y)(\hat\pi_x+i\hat\pi_y)+\frac{\hbar\omega}{2}=\hbar\omega(\hat a^\dagger\hat a+\frac12)$$
其中
$$\hat a\equiv \frac{1}{\sqrt{2e\hbar B}}(\hat\pi_x+i\hat\pi_y)=\frac{1}{\sqrt{2e\hbar B}}[(\hat p_x-eA_x)+i(\hat p_y-eA_y)]$$
$$\hat a^\dagger\equiv \frac{1}{\sqrt{2e\hbar B}}(\hat\pi_x-i\hat\pi_y)=\frac{1}{\sqrt{2e\hbar B}}[(\hat p_x-eA_x)-i(\hat p_y-eA_y)]$$
从$\hat a|0\rangle=0$可以解得：
$$-[i\hbar (\partial_x+i\partial_y)+\frac{ieB}{2}(x+iy)]\psi(x)=0$$
设
$$z=x+iy,\bar z=x-iy$$

$$\partial_z=\partial_x\frac{\partial x}{\partial z}+\partial_y\frac{\partial y}{\partial z}=\frac12(\partial_x-i\partial_y)$$
$$\partial_{\bar z}=\frac12(\partial_x+i\partial_y)$$

得到基态波函数：
$$\psi(z,\bar{z})=f(z)e^{-\frac{eB\bar{z}z}{4\hbar}}$$
$f(z)$是任意函数，通常使用多项式函数近似：
$$\psi(z,\bar{z})=\sum_n\psi_n$$
其中
$$\psi_n(z,\bar{z})=N_nz^ne^{-\frac{eB\bar{z}z}{4\hbar}}$$
归一化条件给出：
$$N_n=[n!\pi(\frac{2\hbar}{eB})^{n+1}]^{-\frac12}$$
$$\langle r^2\rangle=(n+1)\frac{2\hbar}{eB}$$

## 简并
每一个n都对应了基态能量，所以对于无穷大体系，简并度无穷大。但是由于有限的面积A，此体系的简并度为
$$n_{max}=\frac{A}{\frac{2\hbar}{eB}\pi}=\frac{\phi}{\phi_0}$$
其中$\phi_0=\frac{h}{e}$是量子磁通。

## 量子化霍尔电导

# 规范变换
# 几何相位

## 绝热近似
我们考虑本征态变化即哈密顿量变化的情况：
$$\mathrm{i}\hbar\frac d{d t}|\psi(t)\rangle=\hat H|\psi(t)\rangle $$
考虑将态矢展开：
$$|\psi(t)\rangle=\sum_n C_n(t)|n(t)\rangle$$
其中$|n(t)\rangle$是某组完备的本征态基矢。

代入薛定谔方程可得：
$$\mathrm{i}\hbar\sum_n \dot{C_n}(t)|n(t)\rangle+\mathrm{i}\hbar\sum_n C_n(t)|\dot{n}(t)\rangle=\sum_n C_n(t)E_n|n(t)\rangle $$
左边作用另一基矢$\langle m(t)|$：
$$\mathrm{i}\hbar \dot{C_m}(t)+\mathrm{i}\hbar\sum_n C_n(t)\langle m(t)|\dot{n}(t)\rangle=\sum_n C_n(t)E_n\langle m(t)|n(t)\rangle $$
$$\mathrm{i}\hbar \dot{C_m}(t)+\mathrm{i}\hbar C_m(t)\langle m(t)|\dot{m}(t)\rangle+\mathrm{i}\hbar\sum_{m\neq n}C_n(t)\langle m(t)|\dot{n}(t)\rangle= C_m(t)E_m $$

绝热近似指，当哈密顿量变化缓慢的时候，$\langle m(t)|\dot{n}(t)\rangle$远小于1。

证明：对薛定谔方程求导：
$$\dot{\hat{H}}|n(t)\rangle+\hat H|\dot{n}(t)\rangle=\dot{E_n}|n(t)\rangle+E_n|\dot{n}(t)\rangle$$
左边作用另一基矢$\langle m(t)|$：
$$\langle m(t)|\dot{\hat{H}}|n(t)\rangle+\langle m(t)|\hat H|\dot{n}(t)\rangle=\langle m(t)|\dot{E_n}|n(t)\rangle+\langle m(t)|E_n|\dot{n}(t)\rangle$$
$$\langle m(t)|\dot{\hat{H}}|n(t)\rangle+E_m\langle m(t)|\dot{n}(t)\rangle=E_n\langle m(t)|\dot{n}(t)\rangle$$
所以：
$$\langle m(t)|\dot{n}(t)\rangle=\frac{\langle m(t)|\dot{\hat{H}}|n(t)\rangle}{E_n-E_m}$$

证毕。

这样我们可以对方程进行进一步的化简：
$$\mathrm{i}\hbar \dot{C_m}(t)+\mathrm{i}\hbar C_m(t)\langle m(t)|\dot{m}(t)\rangle= C_m(t)E_m $$
$$\mathrm{i}\hbar \frac{\dot{C_m}(t)}{C_m(t)}= E_m -\mathrm{i}\hbar \langle m(t)|\dot{m}(t)\rangle$$
解得：
$$C_m(t_0)=C_m(0)\exp{[-\frac{i}{\hbar}\int^{t_0}_0 (E_m(t) +\langle m(t)|\dot{m}(t)\rangle)dt]}$$

我们知道前一项是动力学相位，后一位被定义为几何相位：
$$\begin{aligned}C_m(t_0)&=C_m(0)\exp{[-\int^{t_0}_0 \frac{i}{\hbar}E_m(t) dt]}\exp{[-\int^{t_0}_0\langle m(t)|\dot{m}(t)\rangle dt]}\\&=C_m(0)\exp{[-\frac{i}{\hbar}\int^{t_0}_0 E_m(t) dt]}\exp{[i\gamma(t_0) dt]}\end{aligned}$$
其中
$$\gamma(t_0)=i\int^{t_0}_0\langle m(t)|\dot{m}(t)\rangle dt$$
当然，如果引起本征态或哈密顿算符变化的参数不直接是时间而是$\lambda(t)$，原定义推广为：
$$\gamma(\lambda_0)=i\int^{\lambda_0}_0\langle m(\lambda(t))|\vec{\nabla_\lambda}|m(\lambda(t))\rangle dt$$
其中
$$\langle m(\lambda(t))|\vec{\nabla_\lambda}|m(\lambda(t))\rangle$$
被称为贝里联络。

磁矢势的贝里联络

some example

# 量子几何

