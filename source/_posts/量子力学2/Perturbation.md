---
title: Approximation Method
mathjax: true
date: 2024-11-21 14:43:00
tags: 量子力学2
categories: 量子力学2
cover:
---
- [Time-independet Perturbation](#time-independet-perturbation)
  - [Non-degenerate Perturbation](#non-degenerate-perturbation)
    - [First Order Theory](#first-order-theory)
    - [Second Order Theory](#second-order-theory)
  - [Degenerate Perturbation](#degenerate-perturbation)
    - [Two-fold Degenerate](#two-fold-degenerate)
- [Time-dependet Perturbation](#time-dependet-perturbation)
  - [Interaction Picture](#interaction-picture)
    - [Example: Nuclear Magnetic Resonance](#example-nuclear-magnetic-resonance)
  - [Time-dependet Perturbation](#time-dependet-perturbation-1)
    - [Dyson Series](#dyson-series)
    - [Transition Probability](#transition-probability)
    - [Constant Perturbation](#constant-perturbation)
      - [Zero Order](#zero-order)
      - [First Order](#first-order)
      - [Second Order](#second-order)
    - [Harmonic Perturbation](#harmonic-perturbation)
    - [Expotential Decay Perturbation-Energy Shift and Decay Width](#expotential-decay-perturbation-energy-shift-and-decay-width)
      - [First Order](#first-order-1)
      - [Second Order](#second-order-1)
  - [Lamb Shift](#lamb-shift)
- [Variantional Method](#variantional-method)
  - [Helium Atom](#helium-atom)



# Time-independet Perturbation
现在有一个微扰后哈密顿量：
$$\hat H(\lambda)=\hat H^0+\lambda\delta\hat H$$
原始哈密顿量有以下能级：
$$\hat H^0|k^0\rangle=E_k^0|k^0\rangle$$
能级有以下关系：
$$E_i^0\leq E_j^0,i<j$$
现在我们的问题是，如何求解微扰后的能级：
$$\hat H(\lambda)|n\rangle_\lambda=E_n(\lambda)|n\rangle_\lambda$$
假定态矢量和能级可以用**正交**基底多项式展开：
$$|n\rangle_\lambda=\sum_{i=0}^\infty \lambda^i|n^i\rangle$$
$$E_n(\lambda)=\sum_{i=0}^\infty \lambda^iE^i_n$$
那么只需要代入薛定谔方程即可。
## Non-degenerate Perturbation
对于不简并的情况：
$$[\hat H^0+\lambda\delta\hat H-E_n(\lambda)]|n\rangle_\lambda=0$$
展开有：
$$[\hat H^0-E^0_n-\lambda(E^1_n-\delta \hat H)-\lambda^iE^i_n](\sum_{i=0}^\infty \lambda^i|n^i\rangle)=0$$
对不同的量级进行分开分析：

$$\begin{aligned}
\lambda^0\quad&(\hat H^0-E^0_n)|n^0\rangle=0\\
\lambda^1\quad&(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle\\\cdots\quad\\
\lambda^k\quad&(\hat H^0-E^0_n)|n^k\rangle=(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k E^i_n|n^{k-i}\rangle
\end{aligned}$$

### First Order Theory
我们先考虑一阶修正：
$$(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle$$
两边同时作用：
$$\langle n^0|(\hat H^0-E^0_n)|n^1\rangle=\langle n^0|(E^1_n-\delta \hat H)|n^0\rangle$$
$$E^1_n=\langle n^0|\delta \hat H|n^0\rangle$$


现在我们完成了对能级的修正，但除了一阶，其他的能量修正因为不知道态函数修正而无法求解，这时候需要用一阶能量修正来求解一阶态矢量修正，并依次类推：
$$\langle k^0|(\hat H^0-E^0_n)|n^1\rangle=\langle k^0|(E^1_n-\delta \hat H)|n^0\rangle$$
$$( E^0_k-E^0_n)\langle k^0|n^1\rangle=-\langle k^0|\delta \hat H|n^0\rangle$$
$$\langle k^0|n^1\rangle=-\frac{\langle k^0|\delta \hat H|n^0\rangle}{E^0_k-E^0_n}$$
所以一阶态矢量修正被原本的能级表示出来，系数即为上述表示：
$$|n^1\rangle=\sum_{k\neq n}|k^0\rangle\langle k^0|n^1\rangle=\sum_{k\neq n}-\frac{\langle k^0|\delta \hat H|n^0\rangle}{E^0_k-E^0_n}|k^0\rangle$$


### Second Order Theory


同理，考虑k阶修正：
$$\langle n^0|(\hat H^0-E^0_n)|n^k\rangle=\langle n^0|(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k \langle n^0|E^i_n|n^{k-i}\rangle$$
$$E^k_n=\langle n^0|\delta \hat H|n^{k-1}\rangle-\sum_{i=1}^{k-1} \langle n^0|E^i_n|n^{k-i}\rangle$$

比如2阶：
$$E^2_n=\langle n^0|\delta \hat H|n^{1}\rangle- \langle n^0|E^1_n|n^{1}\rangle$$


同样的：

$$(\hat H^0-E^0_n)|n^2\rangle=(E^1_n-\delta \hat H)|n^{1}\rangle+ E^2_n|n^{0}\rangle$$

$$( E^0_k-E^0_n)\langle k^0|n^2\rangle=E^1_n\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle+E^2_n\langle k^0|n^{0}\rangle$$

代入

$$E^1_n=\langle n^0|\delta \hat H|n^{0}\rangle$$
$$E^2_n=\langle n^0|\delta \hat H|n^{1}\rangle- \langle n^0|E^1_n|n^{1}\rangle$$

$$\begin{aligned}
(E^0_k-E^0_n)\langle k^0|n^2\rangle&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle+(\langle n^0|\delta \hat H|n^{1}\rangle- \langle n^0|E^1_n|n^{1}\rangle)\langle k^0|n^{0}\rangle\\
&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle\\&+\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle-\langle n^0|\delta \hat H|n^{0}\rangle \langle n^0|n^{1}\rangle\langle k^0|n^{0}\rangle\\
&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle\\&+\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle-\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle\\
&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle\\
\end{aligned}$$

所以：
$$\langle k^0|n^2\rangle=\frac{\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle}{E^0_k-E^0_n}$$

## Degenerate Perturbation

考虑有简并的哈密顿量：
$$\hat H_0=\begin{pmatrix}E^0_n&0\\0&E^0_n\end{pmatrix}$$

$$\hat H(\lambda)=\hat H_0+\lambda \delta\hat H$$

其中

$$\delta\hat H=\begin{pmatrix}0&V\\V&0\end{pmatrix}$$

如果我们按照非简并的方法求解，我们会发现，一阶修正能量为0：

$$E^1_n=\langle n^0|\delta \hat H|n^0\rangle=0$$


这是因为简并态的一阶修正能量是相等的，所以无法求解。这时候我们需要用另一种方法求解。为了简单起见，我们先研究两重简并态的情况。

### Two-fold Degenerate

原始哈密顿量有以下简并能级：
$$\hat H^0|n^0,a\rangle=E_n^0|n^0,a\rangle$$
$$\hat H^0|n^0,b\rangle=E_n^0|n^0,b\rangle$$

展开有：
$$\hat H(\lambda)|n\rangle_\lambda=E_n(\lambda)|n\rangle_\lambda$$

其中：
$$|n\rangle_\lambda=\sum_{i=0}^\infty \lambda^i|n^i\rangle$$
$$E_n(\lambda)=\sum_{i=0}^\infty \lambda^iE^i_n$$

我们可以得到：

$$\begin{aligned}
\lambda^0\quad&(\hat H^0-E^0_n)|n^0\rangle=0\\
\lambda^1\quad&(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle\\\cdots\quad\\
\lambda^k\quad&(\hat H^0-E^0_n)|n^k\rangle=(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k E^k_n|n^{k-i}\rangle
\end{aligned}$$

以上的步骤相对于非简并的情况是一样的，不过：
$$|n^0\rangle=\alpha|n^0,a\rangle+\beta |n^0,b\rangle$$

对于一阶，同时作用$|n^0,a\rangle$：
$$\langle n^0,a|(\hat H^0-E^0_n)|n^1\rangle=\langle n^0,a|(E^1_n-\delta \hat H)|n^0\rangle$$

显然由于哈密顿算符的简并性和态的正交性，有一些项为0：
$$0=\alpha E_n^1-\alpha\langle n^0,a|\delta \hat H|n^0,a\rangle-\beta\langle n^0,a|\delta \hat H|n^0,b\rangle$$
同样的：
$$0=\beta E_n^1-\beta\langle n^0,b|\delta \hat H|n^0,b\rangle-\alpha\langle n^0,b|\delta \hat H|n^0,a\rangle$$

写成矩阵形式：
$$E_n^1\begin{pmatrix}\alpha\\\beta\end{pmatrix}=\begin{pmatrix}\langle n^0,a|\delta \hat H|n^0,a\rangle&\langle n^0,a|\delta \hat H|n^0,b\rangle\\\langle n^0,b|\delta \hat H|n^0,a\rangle&\langle n^0,b|\delta \hat H|n^0,b\rangle\end{pmatrix}\begin{pmatrix}\alpha\\\beta\end{pmatrix}$$

所以能量的一阶修正，就是该矩阵的本征值:
$$\begin{aligned}
E_n^1&=\frac{1}{2}(\langle n^0,a|\delta \hat H|n^0,a\rangle+\langle n^0,b|\delta \hat H|n^0,b\rangle)\\&\pm\frac{1}{2}\sqrt{(\langle n^0,a|\delta \hat H|n^0,a\rangle-\langle n^0,b|\delta \hat H|n^0,b\rangle)^2+4|\langle n^0,a|\delta \hat H|n^0,b\rangle|^2}
\end{aligned}$$

同时也可以求出本征矢量：
$$\begin{pmatrix}\alpha\\\beta\end{pmatrix}$$


# Time-dependet Perturbation

从一阶微扰可以知道：
$$|n^1\rangle=\sum_k c_k|k\rangle$$
随时间的演化：
$$|n^1(t)\rangle=\sum_k c_ke^{-\frac{iE_kt}{\hbar}}|k\rangle$$

当我们考虑和哈密顿量和时间相关的时候
$$|n^1(t)\rangle=\sum_k c_k(t)e^{-\frac{iE_kt}{\hbar}}|k\rangle$$

我们的问题转化为求$c_k(t)$满足的微分方程。在求解之前，不妨先采用相互作用绘景。

##  Interaction Picture
上述的一阶修正态矢量在此处的讨论可以推广为任意态矢量：
$$|\alpha(t)\rangle=\sum_n c_n(t)e^{-\frac{iE_nt}{\hbar}}|n\rangle$$

定义：
$$|\alpha_I(t)\rangle=e^{\frac{i\hat H_0t}{\hbar}}|\alpha_S(t)\rangle$$
角标$S$表示薛定谔绘景，$I$表示相互作用绘景。

对算符也有类似的定义：
$$\hat A_I(t)=e^{\frac{i\hat H_0t}{\hbar}}\hat A_S e^{-\frac{i\hat H_0t}{\hbar}}$$
势能也是如此：
$$\hat V_I(t)=e^{\frac{i\hat H_0t}{\hbar}}\hat V_S e^{-\frac{i\hat H_0t}{\hbar}}$$

在相互作用绘景下，薛定谔方程为：
$$i\hbar\frac{d}{dt}|\alpha_I(t)\rangle=\hat V_I(t)|\alpha_I(t)\rangle$$
$$i\hbar\frac{d}{dt}\hat A_I(t)=[\hat A_I(t),\hat H_0]$$
这相当于综合了薛定谔绘景和海森堡绘景的优点：对于薛定谔绘景，薛定谔方程由$\hat H$给出；对于海森堡绘景，矢量不随时间变化，薛定谔方程是关于算符的方程。

表格如下：

|  | 薛定谔绘景 | 海森堡绘景 | 相互作用绘景 |
| --- | --- | --- | --- |
| 算符 | $\hat A_S$ | $\hat A_H(t)$ | $\hat A_I(t)$ |
| 矢量 | $\|\alpha_S(t)\rangle$ | $\|\alpha_H(t)\rangle$ | $\|\alpha_I(t)\rangle$ |
| 薛定谔矢量方程 | $i\hbar\frac{d}{dt}\|\alpha_S(t)\rangle=\hat H_S\|\alpha_S(t)\rangle$ | None | $i\hbar\frac{d}{dt}\|\alpha_I(t)\rangle=\hat V_I(t)\|\alpha_I(t)\rangle$ |
| 薛定谔算符方程 | None | $i\hbar\frac{d}{dt}\hat A_H(t)=[\hat A_H(t),\hat H_S]$ | $i\hbar\frac{d}{dt}\hat A_I(t)=[\hat A_I(t),\hat H_0]$ |


从相互作用绘景的薛定谔方程出发：
$$i\hbar\frac{d}{dt}|\alpha_I(t)\rangle=\hat V_I(t)|\alpha_I(t)\rangle$$
所以
$$i\hbar\frac{d}{dt}\langle n|\alpha_I(t)\rangle=\sum_m\langle n|\hat V_I(t)|m\rangle\langle m|\alpha_I(t)\rangle$$
也就是说：
$$i\hbar\frac{d}{dt}c_n(t)=\sum_mV_{nm} c_m(t)e^{i(E_n-E_m)t/\hbar}$$

用矩阵表示：
$$i\hbar\frac{d}{dt}\begin{pmatrix}c_1(t)\\c_2(t)\\\vdots\end{pmatrix}=\begin{pmatrix}V_{11}&V_{12}e^{i\omega_{12}t}&\cdots\\V_{21}e^{i\omega_{21}t}&V_{22}&\cdots\\\vdots&\vdots&\ddots\end{pmatrix}\begin{pmatrix}c_1(t)\\c_2(t)\\\vdots\end{pmatrix}$$

其中
$$\omega_{nm}=\frac{E_n-E_m}{\hbar}=-\omega_{mn}$$


### Example: Nuclear Magnetic Resonance
一个最简单的相互作用绘景应用例子是核磁共振，一个二能级体系：
$$\hat H_0=\begin{pmatrix}E_1&0\\0&E_2\end{pmatrix}$$
$$\hat V=\begin{pmatrix}0&Ve^{i\omega t}\\Ve^{-i\omega t}&0\end{pmatrix}$$

初始条件：$c_1(0)=1,c_2(0)=0$，求解$c_1(t),c_2(t)$。

矩阵形式：
$$i\hbar\frac{d}{dt}\begin{pmatrix}c_1(t)\\c_2(t)\end{pmatrix}=\begin{pmatrix}0&Ve^{i(\omega+\omega_{12}) t}\\Ve^{-i(\omega+\omega_{12})t}&0\end{pmatrix}\begin{pmatrix}c_1(t)\\c_2(t)\end{pmatrix}$$

记
$$\Omega=\sqrt{\frac{V^2}{\hbar^2}+\frac{(\omega+\omega_{12})^2}{4}}$$

解得：
$$c_2(t)=-\frac{\gamma}{2\Omega\hbar}e^{i\Omega t}e^{i\frac{\omega+\omega_{12}}{2}t}+\frac{\gamma}{2\Omega\hbar}e^{-i\Omega t}e^{i\frac{\omega+\omega_{12}}{2}t}=\frac{i\gamma}{\Omega\hbar}\sin{[\Omega t]}e^{i\frac{\omega+\omega_{12}}{2}t}$$
$$|c_2(t)|^2=\frac{\gamma^2}{\hbar^2\Omega^2}\sin^2{[\Omega t]}$$
$$|c_1(t)|^2=1-|c_2(t)|^2=1-\frac{\gamma^2}{\hbar^2\Omega^2}\sin^2{[\Omega t]}$$
这就是Rabi振荡。

## Time-dependet Perturbation
### Dyson Series
处理含时微扰的方法与上面处理非含时微扰的方法有所不同。我们可以通过Dyson级数来求解。

假设系数的近似解为：
$$c_n(t)=c_n^{(0)}(t)+c_n^{(1)}(t)+c_n^{(2)}(t)+\cdots$$
知道$$c_n^{(0)}(t)=c_n(0)$，是容易求得$c_n^{(1)}(t)$的，将其作为初值重新代入，我们可以不断迭代得到更高阶的近似解。

相互作用中关于时间演化算符的微分方程为：
$$i\hbar\frac{d}{dt}U_I(t,t_0)=\hat V_I(t)U_I(t,t_0)$$
初始条件：
$$U_I(t_0,t_0)=1$$
得到积分方程：
$$U_I(t,t_0)=1-\frac{i}{\hbar}\int_{t_0}^t\hat V_I(t')U_I(t',t_0)dt'$$
继续迭代：
$$\begin{aligned}
U_I(t,t_0)&=1-\frac{i}{\hbar}\int_{t_0}^t\hat V_I(t')[1-\frac{i}{\hbar}\int_{t_0}^{t'}\hat V_I(t'')U_I(t'',t_0)dt'']dt'\\
&=1-\frac{i}{\hbar}\int_{t_0}^t\hat V_I(t')dt'-\frac{1}{\hbar^2}\int_{t_0}^t\int_{t_0}^{t'}\hat V_I(t')\hat V_I(t'')U_I(t'',t_0)dt''dt'
\end{aligned}$$

这其中的第n阶项为：
$$\begin{aligned}
U_I(t,t_0)
&=\sum_{n=0}^\infty(-\frac{i}{\hbar})^n\int_{t_0}^t\cdots\int_{t_0}^{t_{n-1}}\hat V_I(t_1)\cdots\hat V_I(t_n)dt_1\cdots dt_n
\end{aligned}$$

### Transition Probability
考虑跃迁的概率：
$$c_n(t)=\langle n|U_I(t,t_0)|i\rangle$$
把$U_I(t,t_0)$代入：
$$c_n(t)=c_n^{(0)}(t)+c_n^{(1)}(t)+c_n^{(2)}(t)+\cdots$$
其中：
$$c_n^{(0)}(t)=\langle n|i\rangle$$
$$c_n^{(1)}(t)=\frac{-i}{\hbar}\int_{t_0}^t\langle n|\hat V_I(t')|i\rangle dt'=\frac{-i}{\hbar}\int_{t_0}^te^{i\omega_{ni}t'}V_{ni}(t')dt'$$
$$c_n^{(2)}(t)=\frac{-1}{\hbar^2}\sum_m\int_{t_0}^t\int_{t_0}^{t'}\langle n|\hat V_I(t')|m\rangle\langle m|\hat V_I(t'')|i\rangle dt''dt'$$

所以跃迁概率为：
$$P_{ni}(t)=|\sum_{n=0}^\infty c_n(t)|^2$$

### Constant Perturbation
考虑一个常数微扰：
$$V(t)=\begin{cases}0&t<0\\V&t\geq 0\end{cases}$$
假定在$t=0$的时候，体系处于态$|i\rangle$：
#### Zero Order
$$c_n^{(0)}(t)=\langle n|i\rangle$$
#### First Order
$$\begin{aligned}c_n^{(1)}(t)&=\frac{-i}{\hbar}\int_{0}^t\langle n|\hat V_I(t')|i\rangle dt'\\&=\frac{-i}{\hbar}\int_{0}^te^{i\omega_{ni}t'}V_{ni}dt'\\&=\frac{V_{ni}}{E_n-E_i}(1-e^{i\omega_{ni}t})\end{aligned}$$
或者：
$$|c_n^{(1)}(t)|^2=\frac{4|V_{ni}|^2}{(E_n-E_i)^2}\sin^2[\frac{\omega_{ni}t}{2}]$$

对这个式子可以进行更多的讨论：
$$|c_n^{(1)}(t)|^2=\frac{4|V_{ni}|^2}{(E_n-E_i)^2}\sin^2[\frac{\omega_{ni}t}{2}]=\frac{|V_{ni}|^2}{\hbar^2}t^2\frac{\sin^2[\frac{\omega_{ni}t}{2}]}{(\frac{\omega_{ni}t}{2})^2}$$
这意味着，当微扰刚刚打开的时候，能量变化可以很大，跃迁的选择有很多；但微扰打开的时候长了以后，能量变化的区间很窄。

当末态具有不同而相近的能级时，我们可以计算总的跃迁概率：
$$\sum_n|c_n^{(1)}(t)|^2=\int dE \rho(E)\frac{|V_{ni}|^2}{\hbar^2}t^2\frac{\sin^2[\frac{\omega_{ni}t}{2}]}{(\frac{\omega_{ni}t}{2})^2}=\frac{2\pi t}{\hbar}\overline{|V_{ni}^2}|\rho(E)|_{E_n=E_i},t\rightarrow \infty$$
所以对于长时间，总的跃迁概率正比于时间。

定义单位时间的跃迁概率——跃迁速率：
$$W_{ni}=\frac{2\pi}{\hbar}\overline{|V_{ni}^2|}\rho(E)|_{E_n=E_i}$$
该式被称为费米黄金规则。
#### Second Order
$$\begin{aligned}c_n^{(2)}(t)&=\frac{-1}{\hbar^2}\sum_m\int_{0}^t\int_{0}^{t'}\langle n|\hat V_I(t')|m\rangle\langle m|\hat V_I(t'')|i\rangle dt''dt'\\
&=\frac{-1}{\hbar^2}\sum_m\int_{0}^t\int_{0}^{t'}e^{i\omega_{nm}t'}V_{nm}e^{-i\omega_{mi}t''}V_{mi}dt''dt'\\
&=\frac{-1}{\hbar^2}\sum_mV_{nm}V_{mi}\int_{0}^t\int_{0}^{t'}e^{i\omega_{nm}t'}e^{-i\omega_{mi}t''}dt''dt'\\
&=\frac{-1}{\hbar^2}\sum_mV_{nm}V_{mi}\frac{1}{i\omega_{mi}}\int_{0}^t e^{i\omega_{nm}t'}(e^{i\omega_{mi}t'}-1)dt'\\
&=\frac{i}{\hbar}\sum_m\frac{V_{nm}V_{mi}}{E_m-E_i}\int_{0}^t (e^{i\omega_{ni}t'}-e^{i\omega_{nm}t'})dt'\\\end{aligned}$$

合并一阶修正，跃迁速率：
$$W_{ni}=\frac{2\pi}{\hbar}\overline{|V_{ni}+\sum_m\frac{V_{nm}V_{mi}}{E_i-E_m}|^2}\rho(E)|_{E_n=E_i}$$
### Harmonic Perturbation
考虑一个简谐微扰：
$$V(t)=Ve^{i\omega t}+V^\dagger e^{-i\omega t}$$
同样的方法：
$$c_n^{(1)}(t)=\frac{-i}{\hbar}\int_{0}^t\langle n|\hat V_I(t')|i\rangle dt'=\frac{1}{\hbar}[V_{ni}\frac{1-e^{i(\omega_{ni}+\omega)t}}{\omega_{ni}+\omega}+V_{ni}^\dagger\frac{1-e^{i(\omega_{ni}-\omega)t}}{\omega_{ni}-\omega}]$$
相比于常数微扰，主要区别在于：
$$\omega_{ni}\rightarrow \omega_{ni}\pm \omega$$
这里的$\hbar\omega$让人不禁想到了光子，对应的两种跃迁就是受激发射和吸收：
$$Emission:W_{ni}=\frac{2\pi}{\hbar}\overline{|V_{ni}|^2}\rho(E)|_{E_n=E_i-\hbar\omega}$$
$$Absorption:W_{ni}=\frac{2\pi}{\hbar}\overline{|V_{ni}^\dagger|^2}\rho(E)|_{E_n=E_i+\hbar\omega}$$
由：
$$|V_{ni}|^2=|V_{ni}^\dagger|^2$$
可以知道吸收和发射的概率是相等的，这叫做细致平衡原理。

### Expotential Decay Perturbation-Energy Shift and Decay Width
考虑一个指数衰减的微扰：
$$V(t)=Ve^{-\eta t}$$
同样的方法：
$$c_n^{(1)}(t)=\frac{-i}{\hbar}\int_{0}^t\langle n|\hat V_I(t')|i\rangle dt'=\frac{-i}{\hbar}V_{ni}\frac{e^{\eta t+i\omega_{ni}t}}{\eta+i\omega_{ni}}$$
跃迁概率：
$$|c_n^{(1)}(t)|^2=\frac{|V_{ni}|^2}{\hbar^2}\frac{e^{2\eta t}}{\eta^2+\omega_{ni}^2}$$
跃迁速率：
$$W_{ni}=\frac{2|V_{ni}|^2}{\hbar^2}\frac{\eta e^{2\eta t}}{\eta^2+\omega_{ni}^2}$$
现在要求$t\rightarrow \infty$或者说，$\eta\rightarrow 0^+$，这时候可以得到：
$$\lim_{\eta\rightarrow 0^+}\frac{\eta}{\eta^2+\omega_{ni}^2}=\pi\delta(\omega_{ni})$$
$$W_{ni}=\frac{2\pi}{\hbar}|V_{ni}|^2\delta(E_n-E_i)$$
这同样满足费米黄金规则。

#### First Order
$$c_i^{(1)}(t)=\frac{-i}{\hbar}\lim_{t_0\rightarrow \infty}\int_{t_0}^t\langle i|\hat V_I(t')|i\rangle dt'=\frac{-i}{\hbar\eta}V_{ii}e^{\eta t}$$
#### Second Order
$$c_i^{(2)}(t)=\frac{-1}{\hbar^2}|V_{ii}|^2\frac{e^{2\eta t}}{2\eta^2}+\frac{-i}{\hbar}\sum_{m\neq i}\frac{|V_{mi}^2|e^{2\eta t}}{2\eta(E_i-E_m+i\hbar \eta)}$$

合并起来，跃迁概率为：
$$c_i(t)=1-\frac{i}{\hbar\eta}V_{ii}e^{\eta t}-\frac{1}{\hbar^2}|V_{ii}|^2\frac{e^{2\eta t}}{2\eta^2}+\frac{-i}{\hbar}\sum_{m\neq i}\frac{|V_{mi}^2|e^{2\eta t}}{2\eta(E_i-E_m+i\hbar \eta)}$$

$$\frac{\dot{c_i}}{c_i}=\frac{-i}{\hbar\eta}V_{ii}+\frac{-i}{\hbar}\sum_{m\neq i}\frac{|V_{mi}^2|}{E_i-E_m+i\hbar \eta}$$
解得：
$$c_i(t)=e^{-i\Delta_i t/\hbar},E_i\rightarrow E_i+\Delta_i$$

其中：
$$\Delta_i^{(1)}=V_{ii}$$
$$\Re\Delta_i^{(2)}=\Pr.\sum_{m\neq i}\frac{|V_{mi}|^2}{E_i-E_m}$$
$$\Im\Delta_i^{(2)}=-\pi\sum_{m\neq i}|V_{mi}|^2\delta(E_i-E_m)=-\frac{\hbar}{2}\sum_{m\neq i}W_{im}$$

定义：
$$\Gamma_i=-2\Im\Delta_i$$
那么：
$$|c_i(t)|^2=e^{-\Gamma_i t/\hbar}$$
这意味着$1/\Gamma_i$是衰减时间，$\Gamma_i$是对应的能级展宽。


## Lamb Shift





# Variantional Method

对于非微扰情况，得不到精确解又得不到近似解，那可以通过变分法来求解。

**定理**：对于任意能量的估计，都大于基态能量——具体来说：
$$\frac{\langle \tilde{0}|\hat H|\tilde0\rangle}{\langle \tilde{0}|\tilde0\rangle}\geq E_0$$
**证明**：
$$\begin{aligned}|\tilde0\rangle=\sum_{k}|k\rangle\langle k|\tilde0\rangle\end{aligned}$$
$$\begin{aligned}
\frac{\langle \tilde{0}|\hat H|\tilde0\rangle}{\langle \tilde{0}|\tilde0\rangle}&=\frac{\sum_{k}\langle \tilde0|k\rangle\langle k|\hat H|k\rangle\langle k|\tilde0\rangle}{\sum_{k}|\langle 0|k\rangle|^2}\\
&=\frac{\sum_k E_k|\langle 0|k\rangle|^2}{\sum_k |\langle 0|k\rangle|^2}\\
&\geq E_0
\end{aligned}$$
显然，误差来源于$|\tilde0\rangle$和$|0\rangle$的不同。我们可以在$|\tilde0\rangle$加上许多自由度$|\tilde0(\alpha,\beta,\cdots)\rangle$，在最后的估计能量上取极值，就可以找到最佳近似。

## Helium Atom
对于氦原子，我们可以用变分法求解基态能量。

$$\hat H=-\frac{\hbar^2}{2m}(\nabla_1^2+\nabla_2^2)-\frac{e^2}{4\pi\epsilon}(2/r_1+2/r_2-1/r_{12})$$
假如忽略电子之间的相互作用，那么基态波函数是
$$\psi_1(r_1,r_2)=\psi_{1s}(r_1)\psi_{1s}(r_2)=\frac{8}{\pi a^3}e^{-2r_1/a}e^{-2r_2/a}$$
这时候的能量是：
$$E_{He_0}=8E_{H_0}+V_{ee}$$
其中
$$V_{ee}=\int d^3r_1d^3r_2\frac{|\psi_{1s}(r_1)|^2|\psi_{1s}(r_2)|^2}{r_{12}}=-\frac{5}{2}E_{H_0}$$
所以：
$$E_{He_0}=\frac{11}{2}E_{H_0}=-75eV$$
很接近实验值$-79eV$。

进一步引入参数：
$$\psi_1(r_1,r_2)=\frac{Z^3}{\pi a^3}e^{-Z(r_1+r_2)/a}$$
这时候可以将哈密顿量看成：
$$\hat H=-\frac{\hbar^2}{2m}(\nabla_1^2+\nabla_2^2)-\frac{e^2}{4\pi\epsilon}(Z/r_1+Z/r_2)+\frac{e^2}{4\pi\epsilon}(\frac{Z-2}{r_1}+\frac{Z-2}{r_2}+1/r_{12})$$
$$\begin{aligned}E_{He_0}&=2Z^2E_{H_0}+2(Z-2)\frac{e^2}{4\pi\epsilon}\langle \frac1r\rangle+V_{ee}\\&=(2Z^2-4Z(Z-2)-\frac54Z)E_{H_0}\end{aligned}$$
当$Z=\frac{27}{16}$时，能量最低，为$-77.5eV$。

