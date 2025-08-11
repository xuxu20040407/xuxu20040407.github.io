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
- [Example](#example)
  - [Stark Effect](#stark-effect)
    - [Quadratic Stark Effect](#quadratic-stark-effect)
    - [Linear Stark Effect](#linear-stark-effect)
  - [Fine Structure](#fine-structure)
    - [Relative Movement Correction](#relative-movement-correction)
    - [Spin-Orbit Coupling](#spin-orbit-coupling)
  - [Zeeman Effect](#zeeman-effect)
    - [Normal Zeeman Effect](#normal-zeeman-effect)
    - [Weak-Field Zeeman Effect](#weak-field-zeeman-effect)
    - [Strong-Field Zeeman Effect](#strong-field-zeeman-effect)
    - [Quadradic Zeeman Effect](#quadradic-zeeman-effect)
  - [Van der Waals Interaction](#van-der-waals-interaction)
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


> 这里的正交即认为各高级近似解$|n^i\rangle$与零级近似解$|n^0\rangle$正交。这并不是一个假设，而是一个约定，因为想要满足近似能量解$E_i$的态矢量有很多，我们需要一个约束来限制它们的自由度。

## Non-degenerate Perturbation
对于不简并的情况：
$$[\hat H^0+\lambda\delta\hat H-E_n(\lambda)]|n\rangle_\lambda=0$$
展开有：
$$[\hat H^0-E^0_n-\lambda(E^1_n-\delta \hat H)-\lambda^iE^i_n](\sum_{i=0}^\infty \lambda^i|n^i\rangle)=0$$
对不同的量级进行分开分析：

$$\begin{aligned}
\lambda^0\quad&(\hat H^0-E^0_n)|n^0\rangle=0\\
\lambda^1\quad&(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle\\
\lambda^2\quad&(\hat H^0-E^0_n)|n^2\rangle=(E^1_n-\delta \hat H)|n^1\rangle+E^2_n|n^0\rangle\\
\cdots\quad\\
\lambda^k\quad&(\hat H^0-E^0_n)|n^k\rangle=(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k E^i_n|n^{k-i}\rangle
\end{aligned}$$

### First Order Theory
我们先考虑一阶修正：
$$(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle$$
两边同时作用$\langle n^0|$：
$$\langle n^0|(\hat H^0-E^0_n)|n^1\rangle=\langle n^0|(E^1_n-\delta \hat H)|n^0\rangle$$
$$E^1_n=\langle n^0|\delta \hat H|n^0\rangle$$


现在我们完成了对能级的修正，但除了一阶，其他的能量修正因为不知道态函数修正而无法求解，这时候需要用一阶能量修正来求解一阶态矢量修正，并依次类推。一般选择本征态基底$|k^0\rangle$作展开：
$$\langle k^0|(\hat H^0-E^0_n)|n^1\rangle=\langle k^0|(E^1_n-\delta \hat H)|n^0\rangle$$
$$( E^0_k-E^0_n)\langle k^0|n^1\rangle=-\langle k^0|\delta \hat H|n^0\rangle$$
$$\langle k^0|n^1\rangle=-\frac{\langle k^0|\delta \hat H|n^0\rangle}{E^0_k-E^0_n}$$
所以一阶态矢量修正被原本的能级表示出来，系数即为上述表示：
$$|n^1\rangle=\sum_{k\neq n}|k^0\rangle\langle k^0|n^1\rangle=\sum_{k\neq n}-\frac{\langle k^0|\delta \hat H|n^0\rangle}{E^0_k-E^0_n}|k^0\rangle$$


### Second Order Theory


同理，考虑k阶修正：
$$\langle n^0|(\hat H^0-E^0_n)|n^k\rangle=\langle n^0|(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k \langle n^0|E^i_n|n^{k-i}\rangle$$
由于不同级的近似解正交，解得：
$$E^k_n=\langle n^0|\delta \hat H|n^{k-1}\rangle$$

比如2阶：
$$E^2_n=\langle n^0|\delta \hat H|n^{1}\rangle=-\sum_{k\neq n}\frac{|\langle k^0|\delta \hat H|n^0\rangle|^2}{E^0_k-E^0_n}$$



> 由于二阶能量微扰的表达式存在平方项，显然，二阶微扰总是起到互斥的作用(Level Repulsion)：
> $$E^2_n=\langle n^0|\delta \hat H|n^{1}\rangle= \sum_{k\neq n}-\frac{|\langle k^0|\delta \hat H|n^0\rangle|^2}{E^0_k-E^0_n}$$
> 这意味着，如果$E^0_k>E^0_n$，那么$E^2_n<0$，也就是说，k能级会使得n能级的能量降低；反之，如果$E^0_k<E^0_n$，那么$E^2_n>0$，也就是说，k能级会使得n能级的能量升高。这就是能级互斥效应。对于基态能级，由于不存在比它更低的能级，所以二阶微扰总是使得基态能级的能量降低。

> 按照一阶微扰论的逻辑，接下来应该求解二阶态矢量修正$|n^2\rangle$，其实也不难求解：
> $$\langle k^0|(\hat H^0-E^0_n)|n^2\rangle=\langle k^0|(E^1_n-\delta \hat H)|n^1\rangle+\langle k^0|E^2_n|n^0\rangle,\quad \langle k^0|E^2_n|n^0\rangle=\delta_{nk}E^2_n$$
> $$\langle k^0|n^2\rangle=\frac{\langle k^0|(E^1_n-\delta \hat H)|n^1\rangle+\delta_{nk}E^2_n}{E_k^0-E^0_n}$$
> 代入$|n^1\rangle$和$E^1_n,E^2_n$的表达式，得到：
> $$\begin{aligned}
    \langle k^0|n^2\rangle&=\frac{\langle k^0|(E^1_n-\delta \hat H)|n^1\rangle+\delta_{nk}E^2_n}{E_k^0-E^0_n}\\
    &=\sum_{m\neq n}-\frac{\langle k^0|(E^1_n-\delta \hat H)|\langle m^0|\delta \hat H|n^0\rangle|m^0\rangle}{(E_k^0-E^0_n)(E^0_m-E^0_n)}+\frac{\delta_{nk}E^2_n}{{E_k^0-E^0_n}}\\
    &=\sum_{m\neq n}\frac{\langle k^0|\delta \hat H|m^0\rangle\langle m^0|\delta \hat H|n^0\rangle}{(E_k^0-E^0_n)(E^0_m-E^0_n)}-\sum_{m\neq n}\frac{E^1_n\langle m^0|\delta \hat H|n^0\rangle\delta_{mk}}{(E_k^0-E^0_n)(E^0_m-E^0_n)}+\frac{\delta_{nk}E^2_n}{{E_k^0-E^0_n}}\\
    &=\sum_{m\neq n}\frac{\langle k^0|\delta \hat H|m^0\rangle\langle m^0|\delta \hat H|n^0\rangle}{(E_k^0-E^0_n)(E^0_m-E^0_n)}-\frac{\langle n^0|\delta \hat H|n^0\rangle\langle k^0|\delta \hat H|n^0\rangle}{(E_k^0-E^0_n)^2}+\frac{\delta_{nk}E^2_n}{{E_k^0-E^0_n}}\\
    \end{aligned}$$
> $$|n^2\rangle=\sum_{k\neq n}|k^0\rangle\langle k^0|n^2\rangle=\sum_{k\neq n}\left[\sum_{m\neq n}\frac{\langle k^0|\delta \hat H|m^0\rangle\langle m^0|\delta \hat H|n^0\rangle}{(E^0_k-E^0_n)(E^0_m-E^0_n)}-\frac{\langle n^0|\delta \hat H|n^0\rangle\langle k^0|\delta \hat H|n^0\rangle}{(E^0_k-E^0_n)^2}\right]|k^0\rangle$$
> 但实际上，如果只是要计算三阶能量修正，其实是不需要用到二阶态矢量修正的。代入二阶态矢量修正化简：
> $$\begin{aligned}
    E^3_n&=\langle n^0|\delta \hat H|n^{2}\rangle\\
    &=\sum_{k\neq n}\left[\sum_{m\neq n}\frac{\langle k^0|\delta \hat H|m^0\rangle\langle m^0|\delta \hat H|n^0\rangle}{(E^0_k-E^0_n)(E^0_m-E^0_n)}-\frac{\langle n^0|\delta \hat H|n^0\rangle\langle k^0|\delta \hat H|n^0\rangle}{(E^0_k-E^0_n)^2}\right]\langle n^0|\delta\hat{H}|k^0\rangle\\
    &=\sum_{k\neq n}\left[\sum_{m\neq n}\frac{\langle k^0|\delta \hat H|m^0\rangle\langle m^0|\delta \hat H|n^0\rangle\langle n^0|\delta\hat{H}|k^0\rangle}{(E^0_k-E^0_n)(E^0_m-E^0_n)}-\frac{\langle k^0|\delta \hat H|n^0\rangle\langle n^0|\delta \hat H|n^0\rangle\langle n^0|\delta\hat{H}|k^0\rangle}{(E^0_k-E^0_n)^2}\right]\\
    &=\sum_{k\neq n}\langle k^0|\frac{\langle n^0|\delta\hat{H}|k^0\rangle}{(E^0_k-E^0_n)}|\delta \hat H|\sum_{m\neq n}\frac{\langle m^0|\delta\hat{H}|n^0\rangle}{(E^0_m-E^0_n)}|m^0\rangle-\sum_{k\neq n}\langle k^0|\frac{\langle n^0|\delta\hat{H}|k^0\rangle}{(E^0_k-E^0_n)}|E_n^1\delta_{mk}|\sum_{m\neq n}\frac{\langle m^0|\delta\hat{H}|n^0\rangle}{(E^0_m-E^0_n)}|m^0\rangle\\
    &=\langle n^1|\delta \hat H|n^1\rangle-E_1\\
    \end{aligned}$$
> 这说明计算三阶能量修正只需要用到一阶态矢量修正和一阶能量修正。



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

> 实际上不需要死记硬背，对于非简并微扰，本质上是解关于修正能量和修正波函数的矩阵方程（n+1个方程确定n+1个未知数，其中n个方程为波函数各维度的线性方程，另外加上波函数的归一化方程）；对于简并微扰，本质上是解关于修正能量、修正波函数和“Good State”的矩阵方程（n+m个方程确定n+m个未知数，m为简并数）。

# Example
电磁场、相对论修正和自旋轨道耦合都可以看作是微扰。根据微扰的不同，可以分为以下效应：
- 加入外电场：**Stark效应**；
- 加入外磁场：**Zeeman效应**；
- 相对论修正和自旋轨道耦合：**精细结构**；


## Stark Effect

考虑将氢原子放入外电场，产生Stark效应：
$$\delta\hat H=-e\hat r\cdot \hat E=-ez|E|$$
- 宇称选择定则：这是一个奇宇称的算符，所以只有不同宇称，或者说$l+l'$是奇数之间的态可能；
- 角动量选择定则：$z=r\cos{\theta}=2\sqrt{\dfrac{\pi}{3}}rY_{1,0}(\theta,\phi)$，所以连接不同轨道角动量数l之间的态，且必须满足$m=m'$。



### Quadratic Stark Effect

对于$n=1$的能级，显然根据选择定则，一阶能量修正为0。代入二阶修正：
$$E^2_n=\langle n^0|\delta \hat H|n^{1}\rangle=\sum_{n\neq 1}-\frac{|\langle n,l,m|\delta \hat H|1,0,0\rangle|^2}{E^0_n-E^0_1}=-\frac12\alpha E^2$$

所以外电场使能量降低了，这和上面提到的能级互斥是一致的。


### Linear Stark Effect
考虑$n=2$的能级，此时一阶能量修正不一定为0，同时这是一个简并微扰问题，因为在不加外电场和不考虑自旋轨道耦合的情况下，$n=2$能级是四重简并的。根据选择定则写出微扰算符：
$$\delta\hat H=\begin{pmatrix}0&g|E|&0&0\\g|E|&0&0&0\\0&0&0&0\\0&0&0&0\end{pmatrix}$$
显然只连接了$|2,0,0\rangle,|2,1,0\rangle$两个态，满足$l\neq l',m=m'$的条件。"Good State"为：
$$|n^0,a\rangle=\frac{1}{\sqrt{2}}(|2,0,0\rangle+|2,1,0\rangle)$$
$$|n^0,b\rangle=\frac{1}{\sqrt{2}}(|2,0,0\rangle-|2,1,0\rangle)$$
那么一阶能量修正为：
$$E^1_a=g|E|,E^1_b=-g|E|$$
这意味着4重简并的能级最终分裂。


> 由于$n=2$对应的是一阶修正，所以是线性效应；而$n=1$对应的是二阶修正，所以是二次效应。以下是线性Stark效应中，$|n^0,a\rangle$对应的氢原子图。由于概率分布重心靠下，所以能量会降低。
> 
> ![Stark Effect](/img/量子力学2/goodstate.png)

```python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.colors import PowerNorm
from mpl_toolkits.mplot3d import Axes3D

# 定义常数
a0 = 1.0  # 玻尔半径（单位化）

# 定义波函数
def psi_200(x, y, z):
    r = np.sqrt(x**2 + y**2 + z**2)
    return (1 / (4 * np.sqrt(2 * np.pi) * a0**(3/2))) * (2 - r/a0) * np.exp(-r/(2*a0))

def psi_210(x, y, z):
    r = np.sqrt(x**2 + y**2 + z**2)
    theta = np.arccos(z/r)
    return (1 / (4 * np.sqrt(2 * np.pi) * a0**(3/2))) * (r/a0) * np.exp(-r/(2*a0)) * np.cos(theta)

# 定义Good State波函数
def psi_good_plus(x, y, z):
    return (psi_200(x, y, z) + psi_210(x, y, z)) / np.sqrt(2)

# 创建网格
R = 5
x = np.linspace(-R*a0, R*a0, 100)
z = np.linspace(-R*a0, R*a0, 100)
X, Z = np.meshgrid(x, z)
Y = 0  # 在y=0平面观察

# 计算概率密度
density_200 = np.abs(psi_200(X, Y, Z))**2
density_210 = np.abs(psi_210(X, Y, Z))**2
density_good_plus = np.abs(psi_good_plus(X, Y, Z))**2

# 找到所有概率密度的最大值和最小值用于归一化
vmin = min(np.min(density_200[density_200>0]), 
           np.min(density_210[density_210>0]), 
           np.min(density_good_plus[density_good_plus>0]))
vmax = max(np.max(density_200), np.max(density_210), np.max(density_good_plus))

# 创建图形
fig = plt.figure(figsize=(18, 6))
gs = fig.add_gridspec(1, 4, width_ratios=[1, 1, 1, 0.05])  # 为颜色条预留空间

# 创建子图
ax1 = fig.add_subplot(gs[0])
ax2 = fig.add_subplot(gs[1])
ax3 = fig.add_subplot(gs[2])
cax = fig.add_subplot(gs[3])  # 颜色条专用子图

# 使用PowerNorm进行归一化
norm = PowerNorm(gamma=0.5, vmin=vmin, vmax=vmax)

# 绘制 |2,0,0>
im1 = ax1.imshow(density_200, extent=[-R*a0, R*a0, -R*a0, R*a0], 
                origin='lower', cmap='viridis', norm=norm)
ax1.set_title(r'$|2,0,0\rangle$ Probability Density')
ax1.set_xlabel('x (a₀)')
ax1.set_ylabel('z (a₀)')

# 绘制 |2,1,0>
im2 = ax2.imshow(density_210, extent=[-R*a0, R*a0, -R*a0, R*a0], 
                origin='lower', cmap='viridis', norm=norm)
ax2.set_title(r'$|2,1,0\rangle$ Probability Density')
ax2.set_xlabel('x (a₀)')
ax2.set_ylabel('z (a₀)')

# 绘制 Good State (|a>)
im3 = ax3.imshow(density_good_plus, extent=[-R*a0, R*a0, -R*a0, R*a0], 
                origin='lower', cmap='viridis', norm=norm)
ax3.set_title(r'Good State $\frac{1}{\sqrt{2}}(|2,0,0\rangle + |2,1,0\rangle)$')
ax3.set_xlabel('x (a₀)')
ax3.set_ylabel('z (a₀)')

# 添加统一的颜色条
cbar = fig.colorbar(im3, cax=cax)
cbar.set_label('Probability Density')

plt.tight_layout()
plt.show()
```



## Fine Structure
我们一般把氢原子的非相对论的哈密顿算符写为：
$$\hat H_0=\frac{\hat p^2}{2m_e}-\frac{e^2}{r}$$
这样求解出来的氢原子能级为：
$$E_n=-\frac{m_e e^4}{2\hbar^2 n^2}=-\frac12 mc^2\alpha^2\frac{1}{n^2}$$
其中$\alpha=\frac{e^2}{\hbar c}$为精细结构常数。

若考虑相对论效应，则可以将相对论哈密顿算符展开为：
$$\hat H=\underbrace{\frac{\hat p^2}{2m_e}-\frac{e^2}{r}}_{\hat H_0}-\underbrace{\frac{\hat{p}^4}{8m^3c^2}}_{\hat{H}_{mv}}+\underbrace{\frac{1}{2m_e^2c^2}\frac{1}{r}\frac{dV}{dr}\hat L\cdot \hat S}_{\hat{H}_{SOC}}$$

### Relative Movement Correction
$$\hat{H}_{mv}=\sqrt{p^2c^2+m^2c^4}-mc^2-\frac{p^2}{2m}\approx -\frac{p^4}{8m^3c^2}$$
这部分是由于相对论效应导致的修正。本来由于能级简并需要用到简并微扰理论，但是由于：
$$[\hat L,\hat{H}_{mv}]=0$$
这意味着$\hat{H}_{mv}$已经是对角化的，不会联系不同的轨道角动量数，所以我们可以直接求解：
$$E^1_{mv}=-\frac{1}{8m^3c^2}\langle\psi|p^4|\psi\rangle=-\frac{1}{8m^3c^2}\langle p^2\psi|p^2\psi\rangle$$
根据薛定谔方程$p^2\psi=2m(E-V)\psi$，代入有：
$$E^1_{mv}=-\frac{1}{2mc^2}\langle\psi|E^2-2EV+V^2|\psi\rangle=-\frac{1}{2mc^2}\left[E_n^2+2E_n e^2\langle\frac1r\rangle+e^4\langle\frac1{r^2}\rangle\right]$$
代入：
$$\langle\frac1r\rangle=\frac{1}{n^2a_0},\quad \langle\frac1{r^2}\rangle=\frac{1}{(l+1/2)n^3a_0^2}$$
得到：
$$E^1_{mv}=-\frac{(E_n)^2}{2mc^2}\left[\frac{4n}{l+1/2}-3\right]$$

### Spin-Orbit Coupling
$$\hat{H}_{SOC}=\frac{1}{2m_e^2c^2}\frac{1}{r}\frac{dV}{dr}\hat L\cdot \hat S=\frac{1}{2m_e^2c^2}\frac{e^2}{r^3}\hat L\cdot \hat S$$
是自旋轨道耦合微扰。运动的电荷产生磁场，这本身也是一种相对论效应。这里选择LS耦合表象，即以$n,l,s,j,m_j$为一组好量子数，具体理由请见 {% post_link '原子物理/原子的精细结构' %} 。在该表象下：
$$\hat L\cdot \hat S=\frac{1}{2}(\hat J^2-\hat L^2-\hat S^2)=\frac{\hbar^2}2\left[j(j+1)-l(l+1)-s(s+1)\right]$$
$$\langle\frac1{r^3}\rangle=\frac{1}{l(l+1/2)(l+1)n^3a_0}$$
合起来得到：
$$E^1_{SOC}=\frac{(E_n)^2}{mc^2}\frac{n\left[j(j+1)-l(l+1)-\frac34\right]}{l(l+1/2)(l+1)}$$
考虑到耦合后的$j=l+\frac12$和$j=l-\frac12$，可以写成：
$$E^1_{SOC}=\dfrac{(E_n)^2}{mc^2}\begin{cases}
\dfrac{n}{(l+\frac12)(l+1)},&j=l+\frac12\\
\dfrac{-n}{l(l+\frac12)},&j=l-\frac12
\end{cases}$$

> 将两个相对论修正项加在一起，会发现无论是$j=l+\frac12$还是$j=l-\frac12$，都可以写成一个统一的表达式：
$$E^1_{mv}+E^1_{SOC}=\frac{(E_n)^2}{2mc^2}\left[3-\frac{4n}{j+1/2}\right]=-E_n\left[\frac{\alpha^2}{n^2}\left(\frac{n}{j+1/2}-\frac34\right)\right]$$



## Zeeman Effect
考虑将氢原子放入外磁场，产生Zeeman效应：
$$\vec{A}=-\frac{1}{2}B_{ext}(y\hat i-x\hat j)$$
哈密顿量修正为：
$$\hat H=\frac{\hat p^2}{2m}+V(r)-\frac{e}{m_e}(\vec{A}\cdot\hat p)+\frac{e^2}{2m_e}\vec{A}^2$$
此处有两项微扰——一阶塞曼效应和二阶塞曼效应。我们一般把一阶塞曼效应部分的哈密顿量写为：
$$\hat{H}_Z=\frac{e}{2m_e}B_{ext}(\hat L_z+2\hat S_z)$$
当我们不考虑氢原子的精细结构（如  {% post_link '原子物理/原子的精细结构' %} 所说的双电子独态没有自旋轨道耦合），即为正常塞曼效应，产生三条分裂谱线；当考虑氢原子的精细结构时，即为反常塞曼效应，产生$2j+1$条分裂谱线。此时还需要考虑弱场、强场和中间场情况，分别对应$\hat{H}_Z$为微扰、$\hat{H}_{mv}+\hat{H}_{SOC}$为微扰和简并微扰情况。


### Normal Zeeman Effect
不考虑自旋的影响时，塞曼效应为正常塞曼效应，此时一阶能量修正为：
$$\hat{H}_Z=\frac{e}{2m_e}B_{ext}\hat L_z$$
作为微扰，代入一阶能量修正：
$$E^1_n=\langle nlm_l|\hat{H}_Z|nlm_l\rangle=\frac{e}{2m_e}B_{ext}m_l=m_l\mu_B B_{ext}$$
这里的正号代表着随着$m_l$的增大，由于磁子反平行于磁场方向，所以能量增大。此时考虑 {% post_link '量子力学/对称性和守恒律' %} 中提到选择定则$\Delta m=0,\pm1$，所以能级分裂为三条谱线。


### Weak-Field Zeeman Effect
当$B_{ext}\ll B_{int}$时，内磁场强于外磁场，氢原子内部的LS耦合未被破坏。此时微扰项为：
$$\hat{H}_Z=\frac{e}{2m_e}B_{ext}(\hat L_z+2\hat S_z)=\frac{e}{2m_e}B_{ext}(\hat J_z+\hat S_z)$$
此时的好量子数为$n,l,s,j,m_j$，这意味着$\hat{J}$是容易计算的，但$\hat{S}$却是含时的。用 {% post_link '原子物理/原子的精细结构' %} 中的经典图像看，可以计算出总磁矩$\mu$在总角动量方向的投影$\mu_j$的具体数值（即朗德g因子乘以玻尔磁子$\mu_B$）。现在我们用另一种方法来推导。

在经典图像下，尽管$\hat{S}$是不守恒的（大小不变，绕着$\hat J$进动），但我们可以计算他的时间平均，即投影到$\hat J$方向的平均值：
$$\langle \hat S\rangle=\langle \frac{\hat{S}\cdot \hat{J}}{J^2}\hat{J}\rangle$$
利用$\hat{L}=\hat{J}-\hat{S}$，可以得到：
$$\langle \hat J+\hat S\rangle=\left(1+\frac12\frac{\hat{J}^2+\hat{S}^2-\hat{L}^2}{\hat{J}^2}\right)\langle \hat J\rangle$$
总磁矩为：
$$\mu_j=\frac{e}{2m_e}\left(1+\frac12\frac{\hat{J}^2+\hat{S}^2-\hat{L}^2}{\hat{J}^2}\right)\hat J=g_j\sqrt{j(j+1)}\mu_B$$
其中$g_j=1+\dfrac{j(j+1)+s(s+1)-l(l+1)}{2j(j+1)}$为朗德g因子。算出了总磁矩，再算z方向的就容易得多了，最终得到：
$$E_Z=\langle nlm_j|\hat{H}_Z|nlm_j\rangle=m_jg_j\mu_bB_{ext}$$
最终的能量为：
$$E_{njm_j}=E_{FS}+E_{Z}=-E_n\left[\frac{\alpha^2}{n^2}\left(\frac{n}{j+1/2}-\frac34\right)\right]+m_jg_j\mu_BB_{ext}$$

### Strong-Field Zeeman Effect
当$B_{ext}\gg B_{int}$时，外磁场强于内磁场，氢原子内部的LS耦合被破坏。此时塞曼项为：
$$\hat{H}_Z=\frac{e}{2m_e}B_{ext}(\hat L_z+2\hat S_z)$$
对应的能量为：
$$E_Z=\langle nlm_l|\hat{H}_Z|nlm_l\rangle=\frac{e}{2m_e}B_{ext}(m_l+2m_s)=(m_l+2m_s)\mu_B B_{ext}$$
此时的微扰项为精细结构：
$$\hat{H}_{FS}=\hat{H}_{mv}+\hat{H}_{SOC}$$
相对论运动项修正不变：
$$E^1_{mv}=-\frac{(E_n)^2}{2mc^2}\left[\frac{4n}{l+1/2}-3\right]$$
但由于LS耦合被破坏，此时j不再是好量子数，直接计算为：
$$\hat L\cdot \hat S=\frac{1}{2}(\hat J^2-\hat L^2-\hat S^2)\Rightarrow \hat L\cdot \hat S=\langle L_x\rangle\langle S_x\rangle+\langle L_y\rangle\langle S_y\rangle+\langle L_z\rangle\langle S_z\rangle=\hbar^2m_lm_s$$
$$E_{SOC}=\frac{(E_n)^2}{mc^2}\frac{2nm_lm_s\hbar^2}{l(l+1/2)(l+1)}$$
总的能量为：
$$E_{njm_j}=E_{FS}+E_Z=E_n\left[\frac{\alpha^2}{n^2}\left(\frac34-\frac{n}{l+1/2}+\frac{nm_lm_s}{l(l+1/2)(l+1)}\right)\right]+(m_l+2m_s)\mu_B B_{ext}$$

> 对于$n=2$的氢原子的8个能级，可以根据以上理论计算出能级分裂情况。中间场的情况省略，不过可以参考[知乎回答](https://zhuanlan.zhihu.com/p/669034290) （小时百科参考中文版格里菲斯的书，有错误。英文版无错误）。可以参考以下图像：
>
> ![Zeeman Effect](/img/量子力学2/zeeman.png)

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.constants import alpha, physical_constants

# 物理常数
eV = physical_constants['electron volt'][0]
E2 = -13.6 / 4  # n=2 的 Bohr 能级 (eV)
mu_B = 5.788e-5  # 玻尔磁子 (eV/T)
gamma = (alpha**2 / 8**2) * 13.6  # 精细结构常数 (eV)

# 弱场能级公式 (B -> 0)
def weak_field_energies(B):
                                                         # |n l j mj>
    energies = [
        E2 - (5/16)*alpha**2 * 13.6 / 4 + mu_B * B,      # |2 0 1/2 1/2>
        E2 - (5/16)*alpha**2 * 13.6 / 4 - mu_B * B,      # |2 0 1/2 -1/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 + (6/3)*mu_B * B,# |2 1 3/2 3/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 - (6/3)*mu_B * B,# |2 1 3/2 -3/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 + (2/3)*mu_B * B,# |2 1 3/2 1/2>
        E2 - (5/16)*alpha**2 * 13.6 / 4 + (1/3)*mu_B * B,# |2 1 1/2 1/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 - (2/3)*mu_B * B,# |2 1 3/2 -1/2>
        E2 - (5/16)*alpha**2 * 13.6 / 4 - (1/3)*mu_B * B,# |2 1 1/2 -1/2>
    ]
    return np.array(energies)



# 强场能级公式 (B -> ∞)
def strong_field_energies(B):
                                                         # |n l ml ms>
    energies = [
        E2 - (5/16)*alpha**2 * 13.6 / 4 + mu_B * B,      # |2 0 0 1/2>
        E2 - (5/16)*alpha**2 * 13.6 / 4 - mu_B * B,      # |2 0 0 -1/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 + 2 * mu_B * B,  # |2 1 1 1/2>
        E2 - (1/16)*alpha**2 * 13.6 / 4 - 2 * mu_B * B,  # |2 1 -1 -1/2>
        E2 - (7/48)*alpha**2 * 13.6 / 4 + mu_B * B,      # |2 1 0 1/2>
        E2 - (11/48)*alpha**2 * 13.6 / 4 + 0 * mu_B * B, # |2 1 1 -1/2>
        E2 - (11/48)*alpha**2 * 13.6 / 4 - 0 * mu_B * B, # |2 1 -1 1/2>
        E2 - (7/48)*alpha**2 * 13.6 / 4 - mu_B * B,      # |2 1 0 -1/2>
    ]
    return np.array(energies)

# 中间场能级公式 (任意 B)
def intermediate_field_energies(B):
    beta = mu_B * B
    sqrt_term1 = np.sqrt(4*gamma**2 + (2/3)*gamma*beta + (beta**2)/4)
    sqrt_term2 = np.sqrt(4*gamma**2 - (2/3)*gamma*beta + (beta**2)/4)
    
    energies = [
        E2 - 5*gamma + beta,       # ε₁ 1
        E2 - 5*gamma - beta,       # ε₂ -1
        E2 - gamma + 2*beta,       # ε₃ 2
        E2 - gamma - 2*beta,       # ε₄ -2
        E2 - 3*gamma + beta/2 + sqrt_term1,  # ε₅ 1
        E2 - 3*gamma + beta/2 - sqrt_term1,  # ε₆ 0
        E2 - 3*gamma - beta/2 + sqrt_term2,  # ε₇ 0
        E2 - 3*gamma - beta/2 - sqrt_term2   # ε₈ -1
    ]
    return np.array(energies)

# 生成磁场范围
wb=[0,0.5]
sb=[0.1,2]
total=[0,2]

B_weak = np.linspace(wb[0], wb[1], 100)      # 弱场范围 (0 ≤ B ≤ 0.1 T)
B_intermediate = np.linspace(total[0], total[1], 100)  # 中间场范围 (0.1 ≤ B ≤ 10 T)
B_strong = np.linspace(sb[0], sb[1], 100)  # 强场范围 (10 ≤ B ≤ 100 T)


# 计算能级
E_weak = np.array([weak_field_energies(B) for B in B_weak])
E_intermediate_weak = np.array([intermediate_field_energies(B) for B in B_weak])
E_intermediate = np.array([intermediate_field_energies(B) for B in B_intermediate])
E_intermediate_strong = np.array([intermediate_field_energies(B) for B in B_strong])
E_strong = np.array([strong_field_energies(B) for B in B_strong])

# 颜色列表（蓝、绿、红、青、品红、黄、黑、橙）
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'orange']

# 绘制能级分裂图
plt.figure(figsize=(15, 6))

# 固定高斯
plt.subplot(1, 3, 1)
for i in range(8):
    plt.plot(B_intermediate, E_intermediate[:, i], color=colors[i])
plt.xlabel('Magnetic Field B (T)', fontsize=12)
plt.ylabel('Energy (eV)', fontsize=12)
plt.title('Zeeman Splitting of Hydrogen n=2 Level', fontsize=14)
plt.grid(alpha=0.3)

plt.subplot(1, 3, 2)
for i in range(8):
    plt.plot(B_weak, E_weak[:, i], linestyle='--', color=colors[i],alpha=0.5)
    plt.plot(B_weak, E_intermediate_weak[:, i], color=colors[i],alpha=0.5)

plt.xlabel('Magnetic Field B (T)', fontsize=12)
plt.ylabel('Energy (eV)', fontsize=12)
plt.title('Weak-Field Zeeman Effect', fontsize=14)
plt.grid(alpha=0.3)

plt.subplot(1, 3, 3)
for i in range(8):
    plt.plot(B_strong, E_intermediate_strong[:, i], color=colors[i],alpha=0.5)
    plt.plot(B_strong, E_strong[:, i], linestyle='--', color=colors[i],alpha=0.5)

plt.xlabel('Magnetic Field B (T)', fontsize=12)
plt.ylabel('Energy (eV)', fontsize=12)
plt.title('Strong-Field Zeeman Effect', fontsize=14)
plt.grid(alpha=0.3)


plt.tight_layout()
plt.show()
```

### Quadradic Zeeman Effect

二阶塞曼效应为：
$$\delta\hat H=\frac{e^2}{2m_e}\vec{A}^2=-\frac{e^2}{8m_e}B^2(x^2+y^2)$$
当一阶塞曼效应为0时，比如说某自旋为0的原子的基态，利用$\langle x^2+ y^2\rangle=\frac23\langle r^2\rangle=2a_0^2$，二阶塞曼效应凸显为：
$$\delta E=\frac{e^2}{8m_e}B^2\langle nlm|\hat x^2+\hat y^2|nlm\rangle=\frac23\frac{e^2}{8m_e}B^2\langle r^2\rangle=\frac{e^2B^2a_0^2}{4m_e}$$


## Van der Waals Interaction
范德瓦尔斯相互作用表现为两个原子之间的相互吸引，可以用以下物理图像理解：电子云的涨落会导致瞬时偶极子，这些偶极子会相互作用，导致两个原子之间的相互吸引。直白地说，电子靠近产生的吸引力大于电子远离产生的排斥力。

考虑两个氢原子之间的距离为$r$（$r\gg a_0$），电子相对氢原子的位移为$(x_1,y_1,z_1)$和$(x_2,y_2,z_2)$。由于表达式是二重正负求和的（二阶项相消），考虑泰勒展开到三阶：
$$\left[(r+z)^2+x^2+y^2\right]^{-1/2}=\frac1r\left[1-\frac zr+\frac{2z^2-x^2-y^2}{2r^2}\right]$$
利用 {% post_link '量子力学/中心力场问题' %} 给出的直角坐标与球谐函数的关系，计算微扰为：
$$\begin{aligned}
\delta\hat H
&=\frac{e^2}{r}+\frac{e^2}{|r-r_1-r_2|}-\frac{e^2}{|r-r_1|}-\frac{e^2}{|r-r_2|}\\
&=\frac{e^2}{2r^3}\left[2(z_1+z_2)^2-2z_1^2-2z_2^2-(x_1+x_2)^2+x_1^2+x_2^2-(y_1+y_2)^2+y_1^2+y_2^2\right]\\
&=\frac{e^2}{r^3}(x_1x_2+y_1y_2-2z_1z_2)\\
&\propto \frac{e^2}{r^3}\left[(-Y_1^1+Y_{-1}^1)^2-(Y_1^1+Y_{-1}^1)^2-4(Y^0_1)^2\right](\delta r)^2\\
&=\frac{-2e^2}{r^3}\left[Y_1^1Y_{-1}^1+2(Y^0_1)^2\right](\delta r)^2\\
\end{aligned}$$

显然，一阶能量修正由于选择定则为0，二阶能量修正小于0，这使得两个原子之间的相互作用趋于吸引，且正比于$\dfrac{1}{r^6}$。


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

> 关于变分法，我还以此为主题写了一份大作业：

{% pdf /pdf/tem.pdf %}