---
title: Angular Momentumn and Symmetry
mathjax: true
date: 2024-11-05 16:18:06
tags: 量子力学2
categories: 量子力学2
cover:
---

在经典力学中，我们通过类比动量，我们可以推广得到角动量。然而，更深层次的理解需要结合群论和对称性规律来阐释，这也是为什么起这个标题的原因。


- [转动和角动量对易](#转动和角动量对易)
  - [有限转动和无穷小转动](#有限转动和无穷小转动)
  - [量子力学的无穷小转动](#量子力学的无穷小转动)
- [群论和李代数](#群论和李代数)
  - [群的基本概念](#群的基本概念)
  - [二维群](#二维群)
    - [O(2) Group](#o2-group)
    - [SO(2) Group](#so2-group)
    - [U(1) Group](#u1-group)
  - [三维群](#三维群)
    - [SO(3) Group](#so3-group)
    - [U(2) Group](#u2-group)
    - [SU(2) Group](#su2-group)
- [自旋1/2系统与有限转动](#自旋12系统与有限转动)
- [基本作用力和对称性](#基本作用力和对称性)
  - [基本作用力](#基本作用力)
  - [对称性](#对称性)
  - [简并度](#简并度)
  - [氢原子的四维旋转对称](#氢原子的四维旋转对称)
  - [宇称对称性](#宇称对称性)
    - [宇称算符的本征态](#宇称算符的本征态)
    - [自发对称性破缺](#自发对称性破缺)
    - [选择定则](#选择定则)
  - [时间反演对称性](#时间反演对称性)
    - [经典力学的时间反演](#经典力学的时间反演)
    - [量子力学的时间反演](#量子力学的时间反演)

# 转动和角动量对易

## 有限转动和无穷小转动

我们在之前的学习就知道有限转动是不对易的，这意味着先进行哪个操作影响最后的结果。

我们可以写出有限转动的转动矩阵：
$$R_x(\phi)=\begin{pmatrix}
1&0&0\\
0&\cos{\phi}&-\sin{\phi}\\
0&\sin{\phi}&\cos{\phi}
\end{pmatrix}$$

$$R_y(\phi)=\begin{pmatrix}
\cos{\phi}&0&\sin{\phi}\\
0&1&0\\
-\sin{\phi}&0&\cos{\phi}
\end{pmatrix}$$

$$R_z(\phi)=\begin{pmatrix}
\cos{\phi}&-\sin{\phi}&0\\
\sin{\phi}&\cos{\phi}&0\\
0&0&1
\end{pmatrix}$$

$$R_x(\phi)R_y(\phi) - R_y(\phi)R_x(\phi) = \begin{pmatrix} 0 & -\sin^2{\phi} & 0 \\ \sin^2{\phi} & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}$$

但如果我们计算无穷小转动，可以得到：
$$R_x(\epsilon)R_y(\epsilon) - R_y(\epsilon)R_x(\epsilon) = \begin{pmatrix} 0 & -\epsilon^2 & 0 \\ \epsilon^2 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}=R_z(\epsilon^2)-1$$

## 量子力学的无穷小转动
我们知道动量算符是平移算符的生成元：
$$\hat T(d\vec{x})=1-\frac{i}{\hbar}\hat{\vec{p}}d\vec{x}=\exp{[-\frac{i}{\hbar}\hat{\vec{p}}d\vec{x}]}$$
哈密顿算符是演化算符的生成元：
$$\hat U(dt)=1-\frac{i}{\hbar}\hat{\hat{H}}dt=\exp{[-\frac{i}{\hbar}\hat{\hat{H}}dt]}$$
同样地，角动量算符是旋转算符的生成元：
$$\hat D(\hat n,d\phi)=1-\frac{i}{\hbar}\hat{\vec{J}}\cdot\hat nd\phi=\exp{[-\frac{i}{\hbar}\hat{\vec{J}}\cdot\hat nd\phi]}$$
> D源自德语Drehung，意为转动。

从经典力学的$R$矩阵到量子力学的$\hat D(R)$算符，假设其具有相同的性质，比如其对易性质，有：
$$(1-\frac{i}{\hbar}J_x\epsilon-\frac{1}{2\hbar^2}J_x^2\epsilon^2)(1-\frac{i}{\hbar}J_y\epsilon-\frac{1}{2\hbar^2}J_y^2\epsilon^2)-(1-\frac{i}{\hbar}J_y\epsilon-\frac{1}{2\hbar^2}J_y^2\epsilon^2)(1-\frac{i}{\hbar}J_x\epsilon-\frac{1}{2\hbar^2}J_x^2\epsilon^2)=1-\frac{i}{\hbar}J_z\epsilon^2-1$$
化简得到：
$$[J_x,J_y]=i\hbar J_z$$
推广得
$$[J_i,J_j]=i\hbar\epsilon_{ijk} J_k$$


# 群论和李代数

## 群的基本概念

> 群是一种代数结构，它是一个集合，集合中的元素之间有一种二元运算，满足封闭性、结合律、单位元、逆元。

一个群$G$就是一个集合$\{X,Y,\cdots\}$与这个集合中任意两个元素中的某种运算$\cdot$。满足以下条件：

- Closure: $G\cdot G\in G$
- Associativity: $X\cdot (Y\cdot Z)=(X\cdot Y)\cdot Z$
- Unitarity: $I\cdot X=X=X\cdot I,I\in G$
- Invertibility: $X\cdot X^{-1}=I=X^{-1}\cdot X,X^{-1}\in G$

对于物理来说，这四个性质代表了：
- 系统不变性：在一定操作后系统仍然在群内，即不变；
- 系统操作的顺序性：按照顺序操作的系统与操作的顺序无关；
- 幺正性：什么都不做，系统不变；
- 可逆性：通过相反的操作可以使系统变回来。

如果操作的顺序可以颠倒，那么这个群就是阿贝尔群，即：
- Abel: $X\cdot Y=Y\cdot X$

在物理中，平移操作的群是阿贝尔的，但是旋转不是，就是因为不对易性。

## 二维群

### O(2) Group
保持向量长度不变的操作构成了$O(2)$群，即：
$$O(2)=\{A\in R^{2\times2}|A^{T}A=I\}$$
$$\langle a^\prime|a^\prime \rangle=\langle a |A^{T}A|a \rangle=\langle a |a \rangle\Rightarrow A^{T}A=I$$
旋转和镜像翻转都是其中的元素：
$$R(\theta)=\begin{pmatrix}\cos{\theta}&-\sin{\theta}\\\sin{\theta}&\cos{\theta}\end{pmatrix}$$
$$P_x=\begin{pmatrix}-1&0\\0&1\end{pmatrix},P_y=\begin{pmatrix}1&0\\0&-1\end{pmatrix}$$
> O取自orthogonal，O(2)的基底是正交归一的，所以才有如上的性质。

### SO(2) Group
保持向量长度不变且手性不变的操作构成了$SO(2)$群，即：
$$SO(2)=\{A\in O(2)|\det{A}=1\}$$
这是显然的，因为在线性代数中就讲到$\det{A}=-1$相当于翻转。
> S取自special，是特殊的O(2)群。

### U(1) Group
保持复数模不变的操作构成了$U(1)$群，即：
$$U(1)=\{z\in C||z|=1\}$$
> U取自Unitary，代表矩阵是幺正的。


我们发现为了描述二维旋转，需要定义复数的概念：
$$i^2=-1,z=e^{i\phi}=\cos{\phi}+i\sin{\phi}$$
为了和SO(2)的表示相结合，我们定义：
$$1=\begin{pmatrix}1&0\\0&1\end{pmatrix},i=\begin{pmatrix}0&-1\\1&0\end{pmatrix}$$
对这两个单位的线性组合描述了二维旋转，且满足：
$$U^\dagger U=1$$

> U(1)和SO(2)是同构的，即$U(1)\cong SO(2)$。但是$\phi=\theta$并不是普遍的关系，我们在下面会谈到。

## 三维群
### SO(3) Group
$$O(3)=\{A\in R^{3\times3}|A^{T}A=I\}$$
$$SO(3)=\{A\in O(3)|\det{A}=1\}$$
绕三条旋转轴的旋转矩阵为：
$$R_x(\phi)=\begin{pmatrix}
1&0&0\\
0&\cos{\phi}&-\sin{\phi}\\
0&\sin{\phi}&\cos{\phi}
\end{pmatrix}$$

$$R_y(\phi)=\begin{pmatrix}
\cos{\phi}&0&\sin{\phi}\\
0&1&0\\
-\sin{\phi}&0&\cos{\phi}
\end{pmatrix}$$

$$R_z(\phi)=\begin{pmatrix}
\cos{\phi}&-\sin{\phi}&0\\
\sin{\phi}&\cos{\phi}&0\\
0&0&1
\end{pmatrix}$$


### U(2) Group
按照同样的定义，我们可以得到：
$$U(2)=\{A\in C^{2\times2}|A^\dagger A=I\}$$
一般表示为：
$$U=\begin{pmatrix}
a&b\\
-e^{i\theta}b^*&e^{i\theta}a^*
\end{pmatrix}$$

### SU(2) Group
$$SU(2)=\{A\in U(2)|\det{A}=1\}$$
一般表示为：
$$U=\begin{pmatrix}
a&b\\
-b^*&a^*
\end{pmatrix}$$
我们也可以从四元数的定义去理解：
$$q=a+ib+jc+kd$$
其中：
$$1=\begin{pmatrix}1&0\\0&1\end{pmatrix},i=\begin{pmatrix}0&-1\\1&0\end{pmatrix}$$
$$j=\begin{pmatrix}0&i\\i&0\end{pmatrix},k=\begin{pmatrix}i&0\\0&-i\end{pmatrix}$$

可惜的是，$SU(2)$和$SO(3)$虽然是同构的，即$SU(2)\cong SO(3)$，但是其中的角度旋转并不相同，为$\theta=2\phi$。这不禁让我们想到之前对旋量的操作，的确如此。


# 自旋1/2系统与有限转动
> 自旋角动量是$SU(2)$对称性的反应，而轨道角动量是$SO(3)$的对称性的反应。




# 基本作用力和对称性

## 基本作用力

|基本作用力|作用范围|无量纲量|交换粒子|群|
|---|---|---|---|---|
|引力|长程力|$\alpha_{gravity}=10^{-38}$|引力子(graviton)|/|
|电磁力|长程力|$\alpha=\frac{1}{137}$|光子(photon)|U(1)|
|弱相互作用力|短程力|$\alpha_{weak}=10^{-14}$|W/Z|SU(2)|
|强相互作用力|短程力|$\alpha_{strong}=1$|胶子(gluon)|SU(3)|

## 对称性

- 连续对称性
  - 平移对称性
  - 旋转对称性
- 离散对称性
  - 空间宇称对称性
  - 时间反演对称性
  - 电荷共轭对称性
- 规范“对称性”

## 简并度

满足系统不变的对称变换有：
$$\hat S^{-1}\hat H\hat S=\hat H$$

如果对称变换是厄密算符：
$$\hat S^{\dagger}\hat H\hat S=\hat H\Rightarrow[\hat H,\hat S]=0$$

这必然会导致能级的简并，因为：
$$\hat H|n\rangle=E_n|n\rangle\Leftrightarrow \hat H|(\hat S|n\rangle)=\hat S|(\hat H|n\rangle)=\hat S|(E_n|n\rangle)=E_n(\hat S|n\rangle)$$




## 氢原子的四维旋转对称

哈密顿量属于任意本征值的本征子空间都有其对称性群的不可约表示。

什么意思呢，以氢原子的n=2能级为例，有四个本征态：
$$|l=1,m=1\rangle$$
$$|l=1,m=0\rangle$$
$$|l=1,m=-1\rangle$$
$$|l=0,m=0\rangle$$
其对应的旋转矩阵是可分块对角化的，这与上面违背了，这说明我们关于旋转的对称性认知还不完整。

从龙格楞次矢量的守恒性可以启发氢原子的另一守恒量：
$$\hat M=\frac{1}{2m}(\hat p\times\hat L-\hat L\times\hat p)$$

检查其对易关系：
$$[\hat M,\hat H]=0$$

其对应了新的三个生成元：
$$\hat {M_x},\hat {M_y},\hat {M_z}$$
这说明SO(4)

计算分量的对易关系:
$$\begin{cases}
[L_i,L_j]&=i\hbar \epsilon_{ijk}L_k\\
[M_i,M_j]&=-i\hbar \epsilon_{ijk}\frac{2\hat H}{m}L_k\\
[M_i,L_j]&=i\hbar \epsilon_{ijk}M_k\\
\end{cases}$$


我们记$\hat N=(\frac{m}{-2E})^\frac12\hat M$：
$$\begin{cases}
[L_i,L_j]&=i\hbar \epsilon_{ijk}L_k\\
[L_i,N_j]&=-i\hbar \epsilon_{ijk}N_k\\
[N_i,N_j]&=i\hbar \epsilon_{ijk}L_k\\
\end{cases}$$


对三维坐标动量引入第四维坐标和动量，则会多三个角动量：
$$(x_1,x_2,x_3,x_4)\times(p_1,p_2,p_3,p_4)$$
$$L_{12}=x_1p_2-x_2p_1\equiv L_1$$
$$L_{23}=x_2p_3-x_3p_2\equiv L_2$$
$$L_{31}=x_3p_1-x_1p_3\equiv L_3$$
$$L_{14}=x_1p_4-x_4p_1\equiv N_1$$
$$L_{24}=x_2p_4-x_4p_2\equiv N_2$$
$$L_{34}=x_3p_4-x_4p_3\equiv N_3$$


定义重组算符：
$$\hat I=\frac{\hat L+\hat N}{2},\hat K=\frac{\hat L-\hat N}{2}$$
那么：
$$\begin{cases}
[I_i,I_j]&=i\hbar \epsilon_{ijk}I_k\\
[K_i,K_j]&=i\hbar \epsilon_{ijk}K_k\\
[I_i,K_j]&=0\\
\end{cases}$$

重组算符可以看作独立的角动量算符，那么：
$$[\hat I,\hat H]=[\hat K,\hat H]=0$$
他们分别具有本征值：$i(i+1)\hbar^2$和$k(k+1)\hbar^2$

由于
$$\hat I^2-\hat K^2=\hat L\cdot\hat N=0\Rightarrow i=k$$

另外：
$$\hat I^2+\hat K^2=\frac12(\hat L^2-\frac{m}{2E}\hat M^2)$$

## 宇称对称性

宇称变换定义为：
$$\hat \Pi | \vec{x}, t\rangle =|-\vec{x},t\rangle$$

可以推导出以下性质：
- 对动量本征态的变换：
$$\hat \Pi | \vec{p}, t\rangle =|-\vec{p},t\rangle$$
- 对位移算符的变换：
$$\hat \Pi^\dagger\hat x\hat \Pi=-\hat x$$
- 对动量算符的变换：
$$\hat \Pi^\dagger\hat p\hat \Pi=-\hat p$$
- 对角动量算符的变换：
$$\hat \Pi^\dagger\hat L\hat \Pi=\hat L$$
- 对平移算符的变换：
$$\hat \Pi^\dagger\hat T(\vec{dx})\hat \Pi=-\hat T(\vec{dx})$$



### 宇称算符的本征态

如果宇称算符和哈密顿算符对易：
$$[\hat \Pi,\hat H]=0$$
并且$|n\rangle$是$\hat H$的非简并本征态，那么$|n\rangle$同时也是宇称算符的本征态。

证明：
$$\hat H\hat \Pi|n\rangle=\hat \Pi\hat H|n\rangle=\hat \Pi E_n|n\rangle=E_n(\hat \Pi|n\rangle)$$

所以
$$\hat \Pi|n\rangle=\lambda|n\rangle$$
如果$\lambda=1$，那么是偶宇称；如果$\lambda=-1$，那么是奇宇称。


例如：
- 量子谐振子$|0\rangle$是偶宇称的，但是$|1\rangle=\hat a^\dagger|0\rangle$是奇的，因为作用在$\hat a^\dagger$会变号；
- 自由粒子由于是简并的，所以$\hat \Pi|\vec{p}\rangle=|\vec{-p}\rangle$；
- 角动量的本征态：由于$\hat \Pi Y_{l,m}=(-1)^lY_{l,m}$，也就是说奇偶宇称只跟*l*有关。

### 自发对称性破缺



### 选择定则

我们似乎发现有些量被宇称操作的结果是不一样的，实际上由如下结果：


Classification|Parity|Rotations
---|---|---
$\text{true vector }\hat{\mathbf{V}}$|$\left\{\hat{\Pi},\hat{V}_i\right\}=0$|$\left[\hat{L}_i,\hat{V}_j\right]=i \hbar \epsilon_{ijk} \hat{V}_k$
$\text{pseudovector }\hat{\mathbf{V}}$|$\left[\hat{\Pi},\hat{V}_i\right]=0$|$\left[\hat{L}_i,\hat{V}_j\right]=i \hbar \epsilon_{ijk} \hat{V}_k$
$\text{true scalar }\hat{f}$|$\left[\hat{\Pi},\hat{f}\right]=0$|$\left[\hat{L}_i,\hat{f}\right]=0$
$\text{pseudoscalar }\hat{f}$|$\left\{\hat{\Pi},\hat{f}\right\}=0$|$\left[\hat{L}_i,\hat{f}\right]=0$

## 时间反演对称性

### 经典力学的时间反演

### 量子力学的时间反演

$$i\hbar \partial_t \psi=\hat H\psi$$
考虑时间反演算符：
$$\psi^\prime(x,t)=\hat T\psi(x,t)=\psi^*(x,-t)$$
代入原来的薛定谔方程检验：
$$i\hbar \partial_{\tilde{t}} \psi^*(x,\tilde{t})=\hat H \psi^*(x,\tilde{t})$$

当然，以上需要$\hat H$是时间反演对称的。



时间反演算符是一个反线性算符，即：
$$\hat T(a|\psi_1\rangle+b|\psi_2\rangle)=a^*\hat T|\psi_1\rangle+b^*\hat T|\psi_2\rangle$$

考虑时间反演后的内积：
$$\langle \hat T\psi_1|\hat T\psi_2\rangle=\langle \hat T\psi_1|\int|\hat x\rangle\langle\hat x|dx|\hat T\psi_2\rangle=\psi_2(x)\psi_1^*(x)=\langle \psi_1|\psi_2\rangle^*$$

对于球谐函数：
$$\hat TY_l^m=(Y_l^m)^*=(-1)^mY_l^{-m}$$
即
$$\hat T|l,m\rangle=(-1)^m|l,-m\rangle$$
对于有自旋的情况：
$$\hat T|l,s\rangle=(-1)^{2s}|l,-s\rangle$$