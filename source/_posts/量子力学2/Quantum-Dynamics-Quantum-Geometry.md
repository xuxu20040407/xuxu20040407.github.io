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
  - [海森堡运动方程](#海森堡运动方程)
  - [自由运动的粒子](#自由运动的粒子)
  - [Ehrenfest定理](#ehrenfest定理)
- [简谐振子和相干态](#简谐振子和相干态)
  - [谐振子](#谐振子)
  - [简谐振子动力学](#简谐振子动力学)
  - [相干态](#相干态)
    - [位置表象](#位置表象)
    - [粒子数算符](#粒子数算符)
    - [幅值算符和相位算符](#幅值算符和相位算符)
- [朗道能级](#朗道能级)
  - [经典理论](#经典理论)
  - [半经典量子理论](#半经典量子理论)
  - [简并](#简并)
  - [量子化霍尔电导](#量子化霍尔电导)
- [规范变换](#规范变换)
- [几何相位](#几何相位)
  - [绝热近似](#绝热近似)
- [量子几何](#量子几何)
  - [经典度规](#经典度规)
  - [量子度规](#量子度规)


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
对于唯一可测量的可观测量的平均值，时间演化相当于对其做幺正变换。我们发现似乎有两种方法来达到相同的目的，即
$$\langle\beta|X|\alpha\rangle\to(\langle\beta|U^\dagger)\cdot X\cdot(U|\alpha\rangle)=\langle\beta|U^\dagger XU|\alpha\rangle.$$
一种方法就是薛定谔绘景：
$$|\alpha\rangle\rightarrow U|\alpha\rangle $$
另一种方法就是海森堡绘景：
$$X\to U^{\dagger}XU$$
海森堡绘景认为算符是变化的，态右矢是固定的；既然算符是变化了，那么以某种算符产生的本征基右矢自然也是变化的：
$$|a^{\prime},t\rangle_H=U^\dagger|a^{\prime}\rangle.$$


## 海森堡运动方程
$$\frac{dA^{(H)}}{dt}=\frac i{\hbar}[H,A^{(H)}].$$
证明：
$$\begin{aligned}
\frac{dA}{dt}& =\frac{\partial{U}^\dagger}{\partial t}A^{(S)} {U}+{U}^\dagger A^{(S)} \frac{\partial{U}}{\partial t} \\
&=-\frac1{i\hbar} U^\dagger H UU^\dagger A^{(S)} u+\frac1{i\hbar} U^\dagger A^{(S)} UU^\dagger H u \\
&=\frac1{i\hbar}[A^{(H)},U^{\dagger}HU],
\end{aligned}$$
这里假定了算符不显含时间。

## 自由运动的粒子
考虑一个自由运动的粒子：
$$\hat H =\frac{\hat p^2}{2m}$$

$$\frac{d\hat p}{dt}=0\Rightarrow \hat p(t)=\hat p(0)$$
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}\Rightarrow \hat x(t)=\hat x(0) +\frac{\hat p(0)}{m}t$$
所以：
$$[\hat x(t),\hat x(0)]=\frac{-i\hbar t}{m}\Rightarrow \Delta\hat x(t)\Delta\hat x(0)\geq \frac{\hbar t}{2m}$$


这意味着粒子的位置随着时间的推移越来越不确定，当然可以类比波动力学里自由粒子波包随时间的演化。

## Ehrenfest定理

对于势场中的粒子：
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}$$
$$\frac{d^2\hat x}{dt^2}=-\frac{\vec\nabla\hat V(\vec x)}{m}$$
$$m\frac{d^2\langle\hat x\rangle}{dt^2}=-\langle\vec\nabla\hat V(\vec x)\rangle$$


# 简谐振子和相干态
简谐振子的模型可以阐述量子力学的诸多概念，如朗道能级、电磁场量子化、氢原子模型等等。
## 谐振子
$$\hat H=\frac{\hat p^2}{2m}+\frac{m\omega^2\hat x^2}2$$
一种计算两个算符之和的本征态的普遍的想法是：
$$\hat H=\hat A\hat B$$
<!-- 如果这两个算符无关，那么$\hat B$的本征态 -->
处于朴素的理解，我们可以通过类比复数将哈密顿算符分解为：
$$\hat H=\hbar\omega\hat a\hat a^\dagger$$
其中$\hat a=\frac{1}{\sqrt{2\hbar m\omega}}(i\hat p+m\omega \hat x),\hat a^\dagger=\frac{1}{\sqrt{2\hbar m\omega}}(-i\hat p+m\omega \hat x)$。

然而并没有这么幸运，由于算符不对易，正确的结果应该为：
$$\hat H=\hbar\omega(\hat a\hat a^\dagger-\frac12)$$

升降算符具有以下性质：
- 能级升降：
$$\hat H(\hat a^\dagger \psi)=(E+\hbar \omega)\psi$$
$$\hat H(\hat a \psi)=(E-\hbar \omega)\psi$$
- 基态波函数：
$$\psi_0(x)=(\frac{m\omega}{\pi\hbar})^{\frac14}e^{-\frac{m\omega}{2\hbar}x^2}$$
- 升降系数：
$$\hat a^\dagger |n\rangle=\sqrt{n+1}|n+1\rangle,\hat a |n\rangle=\sqrt{n}|n-1\rangle$$
- 其他本征函数：
$$\psi_n(x)=\frac{1}{\sqrt{n!}}(a^\dagger)^n\psi_0$$
- 反表示：
$$\hat x=\sqrt{\frac{\hbar}{2m\omega}}(\hat a^\dagger+\hat a),\hat p=i\sqrt{\frac{\hbar m\omega}{2}}(\hat a^\dagger-\hat a)$$
## 简谐振子动力学
根据运动方程：
$$\frac{d}{dt}\hat a=\frac{\omega}{i}\hat a\Rightarrow \hat a(t)=\hat a(0)e^{-i\omega t}$$
同理
$$\hat a^\dagger(t)=\hat a^\dagger(0)e^{i\omega t}$$
那么
$$\hat x(t)=\hat x(0)\cos{\omega t}+\frac{\hat p(0)}{m\omega}\sin{\omega t}$$
$$\hat p(t)=\hat p(0)\cos{\omega t}-m\omega\hat x(0)\sin{\omega t}$$
然而由于其期望一直是0，能量本征态不能反应经典简谐振子的运动状态；能反应的其实是湮灭算符的本征态，即相干态。
## 相干态
湮灭算符的本征右矢定义为相干态：
$$\hat a|\lambda\rangle=\lambda |\lambda\rangle$$
由于湮灭算符不是可观测量，$\lambda$可以是任意复数。设$|\lambda\rangle=\sum_nC_n|n\rangle$，则
$$\sum_nC_{n+1}\sqrt{n+1}|n\rangle=\sum_n\lambda C_n|n\rangle$$
解得：
$$C_n=\frac{\lambda^n}{\sqrt{n!}}C_0$$
考虑归一化条件：
$$C_0=e^{-\frac{|\lambda|^2}{2}}$$
所以
$$|\lambda\rangle=e^{-\frac{|\lambda|^2}{2}}\sum_n\frac{\lambda^n}{\sqrt{n!}}|n\rangle=e^{-\frac{|\lambda|^2}{2}}\sum_n\frac{\lambda^n}{\sqrt{n!}}\frac{\hat {a^\dagger}^n}{\sqrt{n!}}|0\rangle=e^{\frac{-|\lambda|^2}{2}}e^{\lambda \hat a^\dagger}|0\rangle$$
### 位置表象
将相干态转移到位置表象：
$$\lambda(x)=\langle x|\lambda\rangle=e^{\frac{-|\lambda|^2}{2}}\langle x|e^{\lambda \hat a^\dagger}|0\rangle$$
其中：
$$\begin{aligned}
e^{\lambda \hat a^\dagger}&=e^{\lambda (\sqrt{\frac{2m\omega}{\hbar}}\hat x-\hat a)}\\
&=e^{\lambda \sqrt{\frac{2m\omega}{\hbar}}\hat x}e^{-\lambda\hat a}e^{-\frac12[\lambda \sqrt{\frac{2m\omega}{\hbar}}\hat x,-\lambda\hat a]}\\
&=e^{\lambda \sqrt{\frac{2m\omega}{\hbar}}\hat x}e^{-\lambda\hat a}e^{\sqrt{\frac{m\omega}{2\hbar}}\lambda^2[ \hat x,\hat a]}\\
&=e^{\lambda \sqrt{\frac{2m\omega}{\hbar}}\hat x}e^{-\lambda\hat a}e^{-\frac{\lambda^2}2}\\
\end{aligned}$$
所以
$$\lambda(x)=\langle x|\lambda\rangle=e^{-\frac{|\lambda|^2-\lambda^2}{2}}e^{2\lambda\hat x}\langle x|0\rangle=(\frac{m\omega}{\pi\hbar})^{\frac14}e^{-\frac{|\lambda|^2-\lambda^2}{2}}e^{2\lambda x}e^{-\frac{m\omega}{2\hbar}x^2}$$
相应的概率为：
$$|\lambda(x)|^2\propto e^{4\lambda x-\frac{m\omega}{\hbar}x^2}=e^{-\frac{m\omega}{\hbar}(x-\frac{2\lambda\hbar}{m\omega})^2}$$

如果其随时间演化：
$$\begin{aligned}
e^{-\frac{i\hat H t}{\hbar}}|\lambda\rangle&=e^{-\frac{|\lambda|^2}{2}}\sum_n\frac{\lambda^n}{\sqrt{n!}}e^{-\frac{i\hat H t}{\hbar}}|n\rangle\\&=e^{-\frac{|\lambda|^2}{2}}\sum_n\frac{\lambda^n}{\sqrt{n!}}e^{-i(n+\frac12)\omega t}|n\rangle\\&=e^{-\frac{|\lambda e^{-i\frac12\omega t}|^2}{2}}\sum_n\frac{(\lambda e^{-i\omega t})^n}{\sqrt{n!}}\frac{\hat {a^\dagger}^n}{\sqrt{n!}}|0\rangle\\&=e^{-i\frac12\omega t}|\lambda e^{-i\omega t}\rangle
\end{aligned}$$

所以
$$|\lambda(x,t)|^2\propto e^{-\frac{m\omega}{\hbar}(x-\frac{2\lambda\hbar}{m\omega}\cos{\omega t})^2}$$

其位置期望为：
$$\langle  x\rangle=\frac{2\lambda\hbar}{m\omega}\cos{\omega t}$$
与自由粒子波包不同，这个波包往复运动而不弥散。

### 粒子数算符

粒子数算符定义为：
$$\hat N=\hat a^\dagger \hat a$$
作用在像相干态上：
$$\langle \lambda|\hat N|\lambda\rangle=\langle \hat a\lambda|\hat a\lambda\rangle=|\lambda|^2\equiv \bar n$$
某次测量得到N个光子的概率为：
$$|\langle\hat N|\lambda\rangle|=e^{-\bar n}\frac{\bar{n}^n}{n!}$$
这是个泊松分布。

### 幅值算符和相位算符
湮灭算符不是厄米算符，我们考虑：
$$\hat a=\hat B e^{i\hat \Phi}$$
其中幅值算符$\hat B$和相位算符$\hat \Phi$都是厄密算符。

由于$\hat a\hat a^\dagger=\hat N+1$，可设：
$$\hat B=\sqrt{\hat N+1}$$
那么
$$\hat a=\sqrt{\hat N+1} e^{i\hat \Phi}$$
$$\hat a^\dagger= e^{-i\hat \Phi}\sqrt{\hat N+1}$$
> 之所以不取
> $$\hat B=\sqrt{\hat N}$$
> 是因为这样的话幅值算符就不存在逆算符了，因为对基态的本征值为0。

作用在能级上：
$$\hat B|n\rangle=\sqrt{n+1}|n\rangle$$
矩阵表示为：
$$\hat B=\sum_n \sqrt{n+1}|n\rangle\langle n|=\begin{pmatrix}\ddots&\cdots&0&0\\\vdots&\ddots&0&0\\0&0&\sqrt{n+1}&0\\0&0&0&\ddots\end{pmatrix}$$


相位算符定义为：
$$ e^{i\hat \Phi}=\frac{1}{\sqrt{\hat N+1}}\hat a$$
$$e^{-i\hat \Phi}=\hat a^\dagger\frac{1}{\sqrt{\hat N+1}}$$
作用在能级上：
$$e^{i\hat \Phi}|n\rangle=\frac{1}{\sqrt{\hat N+1}}\hat a|n\rangle=\sqrt{n+1}|n\rangle$$
矩阵表示为：
$$\hat B=\sum_n \sqrt{n+1}|n\rangle\langle n|=\begin{pmatrix}\ddots&\cdots&0&0\\\vdots&\ddots&0&0\\0&0&\sqrt{n+1}&0\\0&0&0&\ddots\end{pmatrix}$$

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

## 经典度规
两点之间的距离表示为：
$$(ds)^2=g_{\mu\nu}dx^\mu dx^\nu$$
其中，$g_{\mu\nu}$是经典度规，常见的度规有：
- 直角坐标系：
$$g_{\mu\nu}=\begin{pmatrix}1&0\\0&1\end{pmatrix}$$
- 极坐标系：
$$g_{\mu\nu}=\begin{pmatrix}1&0\\0&r^2\end{pmatrix}$$
- 球坐标系：
$$g_{\mu\nu}=\begin{pmatrix}1&0&0\\0&r^2&0\\0&0&r^2\sin^2{\theta}\end{pmatrix}$$

## 量子度规
假设量子态依赖于$\lambda$：
$$|\psi(\lambda+d\lambda)\rangle=|\psi(\lambda)\rangle+\partial_\mu|\psi(\lambda)\rangle d\lambda^\mu+\frac12\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu$$

通过内积的方式来度量两个量子态的距离：
$$\begin{aligned}
\langle \psi(\lambda)|\psi(\lambda+d\lambda)\rangle
&=1+\langle \psi(\lambda)|\partial_\mu|\psi(\lambda)\rangle d\lambda^\mu+\frac12\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu\end{aligned}$$

如果我们要求其模方，那么对每一项的实虚分辨是必要的。分析：
- 第二项$\langle \psi(\lambda)|\partial_\mu|\psi(\lambda)\rangle$是纯虚的，因为：
$$\langle \psi(\lambda)|\partial_\mu\psi(\lambda)\rangle^*=\langle \partial_\mu\psi(\lambda)|\psi(\lambda)\rangle=-\langle \psi(\lambda)|\partial_\mu\psi(\lambda)\rangle $$
- 第三项$\partial_\mu\langle \psi(\lambda)|\partial_\nu|\psi(\lambda)\rangle$是纯虚的，即$\langle \partial_\mu\psi(\lambda)|\partial_\nu\psi(\lambda)\rangle+ \langle\psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle$，那么
$$\Re \langle \partial_\mu\psi(\lambda)|\partial_\nu\psi(\lambda)\rangle+ \Re\langle\psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle=0$$
记$r_{\mu\nu}\equiv \Re\psi(\lambda)|\partial_\mu\langle\partial_\nu|\psi(\lambda)\rangle$

那么可以表示为：
$$\begin{aligned}
|\langle \psi(\lambda)|\psi(\lambda+d\lambda)\rangle|
&=|1-i(i\langle \psi(\lambda)|\partial_\mu|\psi(\lambda)\rangle d\lambda^\mu)+\frac12\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu|\\
&=|1-iA_\mu+\frac12\Re{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu]}+\frac i2\Im{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu]}|\\
&=\sqrt{(1+\frac12\Re{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu]})^2+(\frac 12\Im{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle d\lambda^\mu d\lambda^\nu]}-A_\mu)^2}\\
&=\sqrt{1+\Re{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle+A_\mu A_\nu ]}d\lambda^\mu d\lambda^\nu}\\
&=1+\frac12\Re{[\langle \psi(\lambda)|\partial_\mu\partial_\nu|\psi(\lambda)\rangle+A_\mu A_\nu ]}d\lambda^\mu d\lambda^\nu\\
&=1-\frac12(r_{\mu\nu}-A_\mu A_\nu)d\lambda^\mu d\lambda^\nu\\
&=1-\frac12 g_{\mu\nu} d\lambda^\mu d\lambda^\nu
\end{aligned}$$
所以$g_{\mu\nu}=r_{\mu\nu}-A_\mu A_\nu$就是量子度规。可以推广为量子几何张量
$$G_{\mu\nu}=\psi(\lambda)|\partial_\mu\langle\partial_\nu|\psi(\lambda)\rangle-A_\mu A_\nu$$
那么量子度规就是量子几何张量的实部，其虚部是贝里曲率：
$$\Omega_{\mu\nu}=\partial_\mu A_{\nu}-\partial_\nu A_{\mu}=-2\Im[\langle \partial_\mu\psi(\lambda)|\partial_\nu|\psi(\lambda)\rangle]$$

综上：
$$G_{\mu\nu}=r_{\mu\nu}-i\Omega_{\mu\nu}$$


