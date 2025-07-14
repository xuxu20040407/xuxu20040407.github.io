---
title: Basic Concept
mathjax: true
date: 2024-08-15 10:56:17
tags: 量子力学2
categories: 量子力学2
cover:
---
量子力学2主要参考课程讲义以及Sarkari的《现代量子力学》。
- [量子力学公设和正则量子化](#量子力学公设和正则量子化)
  - [量子力学的五大公设](#量子力学的五大公设)
  - [正则量子化](#正则量子化)
- [基本概念](#基本概念)
  - [左矢空间和右矢空间](#左矢空间和右矢空间)
  - [算符](#算符)
  - [内积](#内积)
  - [结合公理和完备性表示](#结合公理和完备性表示)
  - [基底右矢和线性展开](#基底右矢和线性展开)
  - [矩阵表示](#矩阵表示)
  - [测量](#测量)
  - [相容可测量量和简并](#相容可测量量和简并)
  - [不确定性关系](#不确定性关系)
- [基矢的变换](#基矢的变换)
- [混合态和密度矩阵](#混合态和密度矩阵)
- [量子熵和极大熵原理](#量子熵和极大熵原理)
  - [微正则系综](#微正则系综)
  - [正则系综](#正则系综)
  - [巨正则系综](#巨正则系综)




# 量子力学公设和正则量子化
## 量子力学的五大公设
1. **波函数公设**：
   - 波函数$\psi(\vec{r})$用于描述量子系统的状态。更数学地讲，希尔伯特空间中的矢量$\left|\psi\right\rangle$可以描述微观系统的状态，那么波函数是态矢量在某一表象下的投影
   - 关于波函数的物理意义，比较公认的是玻恩的统计诠释，即波函数的模方描述在空间中某点发现粒子的概率幅：
      $$dP(\vec{r})=|\psi(\vec{r})|^2d\vec{r}=\langle \psi|\vec{r}\rangle\langle \vec{r}|\psi\rangle d\vec{r}$$
      结合后面谈到的完备性基底，可以证明概率幅是归一化的：
      $$\int dP(\vec{r})=\int \langle \psi|\vec{r}\rangle\langle \vec{r}|\psi\rangle d\vec{r}=\langle \psi|\psi\rangle=1$$
   - 态叠加原理：如果$\psi_1$和$\psi_2$是两个可能的态，那么它们的线性组合也是一个可能的态，且系数服从统计诠释（正比于概率）：
      $$\text{discrete } |\psi\rangle=\sum_i\lvert a_i\rangle c_i , c_i=\langle a_i\rvert \psi\rangle ,P=c_i^*c_i$$
      $$\text{continuous } |\psi\rangle=\int\lvert a\rangle \psi(a)da , \psi(a)=\langle a\rvert \psi\rangle ,P=\psi(a)^*\psi(a)$$

      > 态叠加原理意味着量子力学是一个线性的理论，具体而言，如果两个态的叠加是一个态，那么也应该满足薛定谔方程，即哈密顿算符应该是个线性算符。

2. **算符公设**：希尔伯特空间中的厄密算符可以描述微观系统的物理量，而物理量的具体数值，取决于算符的本征值。至于为什么必须是厄密算符，是因为实验中的测量都是实数：
   $$\hat A|\psi\rangle = \lambda|\psi\rangle\Rightarrow \langle\psi|\hat A\psi\rangle=\langle\hat A^\dagger\psi|\psi\rangle = \lambda\langle\psi|\psi\rangle\Rightarrow \hat A^\dagger=\hat A$$
3. **测量公设**：对物理量进行测量的时候，测量结果一定是本征值之一，且概率遵从态矢量的玻恩统计诠释（即态矢量中包含了“多少”该本征矢量）。测量结束后，态矢量坍缩为相应本征态矢量。测量的行为可以用投影算符描述：
   $$\hat P_a=|\psi_a\rangle\langle\psi_a|,\hat P_a |\psi\rangle=P_a|\psi_a\rangle$$
   其中$|\psi_a\rangle$是本征态矢量，$\hat P_a$是投影算符。测量后，态矢量变为：
   $$|\psi\rangle\rightarrow|\psi_a\rangle$$
   可以将厄米算符进行谱分解：
   $$\hat A=\sum_a a\hat P_a=\sum_a a|\psi_a\rangle\langle\psi_a|$$
4. **演化公设**：波函数或态矢量的演化由**薛定谔方程**决定：
    $$\mathrm{i}\hbar\frac\partial{\partial t}|\psi(t)\rangle=H|\psi(t)\rangle $$
    > 定义时间演化算符：
    > $$|\psi(t)\rangle=\hat{\Lambda}(t,t_0)|\psi(t_0)\rangle$$
    > 波函数的归一化要求$\hat{\Lambda}(t,t_0)$是幺正的，即：
    > $$\langle\psi(t)|\psi(t)\rangle=1\Rightarrow\hat{\Lambda}(t,t_0)\hat{\Lambda}^\dagger(t,t_0)=1$$
    > 初值条件同时需要：
    > $$\lim_{t\rightarrow 0}\hat{\Lambda}(t,t_0)=1$$
    > 转写为等价形式：
    > $$\hat{\Lambda}(t,t_0)=e^{i\hat{\Omega}(t-t_0)}$$
    > 对演化后的态矢量求导：
    > $$\frac{\partial}{\partial t}|\psi(t)\rangle=i\hat{\Omega}|\psi(t)\rangle$$
    > 这就有点薛定谔方程的雏形了，令$\hat{H}=-i\hbar\hat{\Omega}$，即可得到
    > $$\mathrm{i}\hbar\frac\partial{\partial t}|\psi(t)\rangle=\hat{H}|\psi(t)\rangle$$
    > 这似乎预示着算符是比方程更根本的东西，我们同样可以定义空间算符，详见 {% post_link '量子力学/对称性和守恒律' %} 。



5. **全同性原理**：全同粒子指的是内禀属性（质量、电荷、自旋等）完全相同的粒子。对于多粒子系统，出于全同粒子的不可分辨性，其概率幅随着粒子的交换而不变，也就是说波函数要么是对称的，要么是反对称的：
   $$\psi(x_1,x_2,\ldots,x_n)=\pm\psi(x_{\sigma(1)},x_{\sigma(2)},\ldots,x_{\sigma(n)})$$
   满足正号的波函数是玻色子（对称），满足负号的波函数是费米子（反对称）。

## 正则量子化
有的地方会把量子化条件纳入公设的范围，这里不作评价，仅讨论其中的逻辑。在历史上，狄拉克注意到了算符演化：
$$\frac{d}{dt}\langle \hat{O}\rangle=\frac{1}{i\hbar}\langle[\hat{O},\hat{H}]\rangle+\langle\frac{\partial \hat{O}}{\partial t}\rangle$$
和经典哈密顿力学中的物理量演化：
$$\frac{d}{dt}O=\{O,H\}+\frac{\partial O}{\partial t}$$
的相似关系，并提出通过建立对易子和泊松括号的桥梁——这正是正则量子化的思想。对于经典力学中的正则坐标和正则动量，其泊松括号和对易子分别为：
$$\{P_i,X_j\}=\delta_{ij},[P_i,X_j]=i\hbar\delta_{ij}$$

这中间只相差了一个系数$i\hbar$（事实上对于大部分物理量都是如此，但并非恒成立），这被称为一次量子化。相应地，上述量子化无法处理多粒子体系，因而需要新的量子化。对经典场论的量子化被称为二次量子化：
$$\text{boson } [\hat{a}_i,\hat{a}_j]=0,[\hat{a}_i^\dagger,\hat{a}_j^\dagger]=0, [\hat{a}_i,\hat{a}_j^\dagger]=\delta_{ij}$$
$$\text{fermion } \{\hat{c}_i,\hat{c}_j\}=0,\{\hat{c}_i^\dagger,\hat{c}_j^\dagger\}=0, \{\hat{c}_i,\hat{c}_j^\dagger\}=\delta_{ij}$$

# 基本概念
## 左矢空间和右矢空间
在量子力学中，一个物理态用态矢量表示。态矢量（右矢）定义在希尔伯特空间内，记为$|\alpha\rangle$。与之对偶的空间称为左矢空间，对偶的矢量被定义为$(|\alpha\rangle)^*=\langle\alpha|$。



右矢遵循矢量的规则，具有可加性和与常数交换性。不过需要注意的是，态矢量应当是归一化的，换句话说，我们只关心态矢量的方向。
$$\langle\alpha|\alpha\rangle=1$$
当然这要到内积的章节了。

> 希尔伯特空间是完备的内积空间，内积空间就是定义了内积的线性空间。与经典力学的欧几里得空间（有限维的内积空间）相比：

> 对比|量子力学|经典力学
> -|-|-
> 空间|希尔伯特空间|欧几里得空间
> 基底|$\lvert \psi_n\rangle$|$\hat{e_i}$
> 算符|$\sum_{n,m}\alpha_{nm}\lvert\psi_n\rangle\langle\psi_m\lvert$|$\sum_{i,j}c_{ij}\hat{e_i}\hat{e_j}$

> 唯一的区别是，量子力学中的$\alpha_{nm}$是复数，而经典力学中的$c_{ij}$是实数。量子力学是无穷维空间，经典力学是有限维空间。

## 算符

一个物理态经过一定的作用后得到了另一个物理态，即：
$$|\alpha\rangle\Rightarrow|\beta\rangle$$
我们将这种作用记为算符$\hat A$：
$$|\beta\rangle=\hat A|\alpha\rangle$$
算符相当于矩阵，或者说二维的张量，具有相应的一些列性质：可加性，加法交换性，加法结合性。值得注意的是，算符显然不满足乘法交换性，这涉及到了算符的对易。

算符作用在左矢上并非是相应的对偶，在左矢空间的对偶算符记为：
$$(\hat A |\alpha\rangle)^*=\langle\alpha|\hat A^\dagger$$
称之为厄密共轭算符。如果算符满足：
$$\hat A^\dagger=\hat A$$

如果是两个算符相乘：
$$(\hat A\hat B)^\dagger=\hat B^\dagger\hat A^\dagger$$

如果算符表示为外积：
$$\hat A=|\beta\rangle\langle\alpha|\Rightarrow\hat A^\dagger=|\alpha\rangle\langle\beta|$$



## 内积

希尔伯特空间可以定义内积$\langle\beta|\alpha\rangle$。内积具有以下性质和假定：
- 复共轭：$\langle\beta|\alpha\rangle=\langle\beta|\alpha\rangle^*$
- 长度的实数性：$\langle\alpha|\alpha\rangle\in R$，事实上$\langle\alpha|\alpha\rangle\equiv1$
- 正定度规假设：$\langle\alpha|\alpha\rangle\geq0$
- 柯西不等式推论：$|\langle\beta|\alpha\rangle|\leq\sqrt{\langle\alpha|\alpha\rangle\langle\beta|\beta\rangle}=1$

## 结合公理和完备性表示

结合公理：算符与矢量的乘法运算是可结合的，例如：
$$(|\beta\rangle\langle\alpha|)|\gamma\rangle=|\beta\rangle(\langle\alpha|\gamma\rangle)=(\langle\alpha|\gamma\rangle)|\beta\rangle$$
这表明既可以视为算符作用在右矢上，也可以视为数点乘在右矢上。

对于一组基底，如果其具有完备性，即：
$$\sum_n|n\rangle\langle n|=I$$
那么可以将其插入表达式的任意部位，这是由结合结合公理决定的。
## 基底右矢和线性展开

厄米算符具有重要的性质：
- 厄米算符的本征值均为实数；本征值均为实数的算符是厄密算符；
- 厄米算符的不同本征值正交。

那么对于厄米算符，其本征态是天生的正交标准基底（其完备性可以被证明，但是目前需要假定）。我们现在可以把任意一个矢量展开为：
$$|\alpha\rangle=\sum_{a}c_a|a\rangle$$
当然，运用完备性表示：
$$|\alpha\rangle=\sum_{a}|a\rangle\langle a|\alpha\rangle=\sum_{a}\langle a|\alpha\rangle|a\rangle$$

这表明$c_a=\langle a|\alpha\rangle$，其模方表示了该态的概率，这是量子力学的基本公设。同时：
$$\langle\alpha|\alpha\rangle=\langle\alpha|\sum_{a}|a\rangle\langle a|\alpha\rangle=\sum_ac_a^2=1$$

## 矩阵表示

对于正交标准完备基底，算符表示为：
$$\hat A=\sum_{a_i}\sum_{a_j}|a_i\rangle\langle a_i|\hat A|a_j\rangle\langle a_j|=\sum_{a_i}\sum_{a_j}|a_i\rangle A_{a_ia_j}\langle a_j|$$

厄密性和矩阵的复共轭转置的性质联系了起来。

## 测量
当我们用算符作用在一个右矢上，其物理意义是测量:
$$|\alpha\rangle=\hat A|a\rangle$$
测量一个右矢，给出了相应算符表象下物理态及其概率。

实际上作用前后的右矢我们仍然观测不了，我们真正感兴趣的是态对于算符的平均值，定义为
$$\langle\hat A\rangle=\langle\alpha|\hat A|\alpha\rangle$$
这和经典的概率诠释相符。用算符的本征基矢展开：
$$\begin{aligned}\langle\alpha|\hat A|\alpha\rangle&=\sum_{a_i}\sum_{a_j}\langle\alpha|a_i\rangle\langle a_i|\hat A|a_j\rangle\langle a_j|\alpha\rangle\\&=\sum_{a_i}\sum_{a_j}c_{a_j}\langle\alpha|a_i\rangle\langle a_i|\hat A|a_j\rangle\\&=\sum_{a_j}c_{a_j}c_{a_j}^*\langle a_j|\hat A|a_j\rangle=\sum_{a_j}c_j^2A_j\end{aligned}$$


## 相容可测量量和简并
当两个可观测量的算符对易时，称这两个可观测量是相容的。

**定理**：相容可观测量具有共同本征右矢，记为
$$|a,b\rangle$$
满足
$$\hat A|a,b\rangle=a|a,b\rangle,\hat B|a,b\rangle=b|a,b\rangle$$

## 不确定性关系
证明1：由内积的正定性：
$$\begin{aligned}
||\psi\rangle|^2&=\langle \psi|\psi\rangle=\langle \phi|(\hat A-i\lambda\hat B)(\hat A+i\lambda\hat B)|\phi\rangle\geq 0\\
&\Rightarrow \langle \phi|\hat A^2|\phi\rangle+\lambda^2\langle \phi|\hat B^2|\phi\rangle+i\lambda\langle \phi|[\hat A,\hat B]|\phi\rangle\geq 0\\
&\Rightarrow \langle \hat B^2\rangle\lambda^2+i\lambda\langle [\hat A,\hat B]\rangle+\langle \hat A^2\rangle\geq 0\\
&\Rightarrow \lambda^2\langle i[\hat A,\hat B]\rangle^2-4\langle \hat A^2\rangle\langle \hat B^2\rangle\leq 0\\
&\Rightarrow \langle \hat A^2\rangle\langle \hat B^2\rangle\geq |\frac{i}{2}\langle [\hat A,\hat B]\rangle|^2
\end{aligned}$$
这个可以约束出更强的式子，取：
$$ \hat A'= \hat A-\langle \hat A\rangle, \hat B'= \hat B-\langle \hat B\rangle$$
就可以得到：
$$(\Delta\hat A)^2(\Delta\hat B)^2\geq |\frac{i}{2}\langle [\hat A,\hat B]\rangle|^2$$

证明2：由施瓦茨不等式：
$$\begin{aligned}
(\Delta\hat A)^2(\Delta\hat B)^2&=\langle \hat A'\rangle^2\langle \hat B'\rangle^2\\
&\geq |\langle \hat A'\hat B'\rangle|^2\\
&=|\langle \frac{1}{2}[\hat A',\hat B']+\frac{1}{2}\{\hat A',\hat B'\} \rangle|^2\\
&=|\langle \frac{1}{2}[\hat A,\hat B]+\frac{1}{2}\{\hat A',\hat B'\} \rangle|^2\\
&\geq |\frac{1}{2}\langle [\hat A,\hat B]\rangle|^2
\end{aligned}$$

> 对于不显含时间的算符$\hat f$，其期望值的时间导数为：
> $$\frac{d}{dt}\langle \hat f\rangle=\frac{1}{i\hbar}\langle[\hat H,\hat f]\rangle$$
> 那么：
> $$(\Delta\hat H)^2(\Delta\hat f)^2\geq|\frac{1}{2}\langle [\hat H,\hat f]\rangle|^2=|\frac{1}{2}\langle i\hbar \dot{\hat f}\rangle|^2$$
> 即
> $$\Delta E\Delta t\geq\frac{\hbar}{2}$$

# 基矢的变换

两组正交完备标准基矢$|a\rangle,|b\rangle$可以通过一个幺正算符：
$$\hat U=\sum_{k}|b^k\rangle\langle a^k|$$
进行转换：
$$|b\rangle=\hat U|a\rangle$$


对于原来基矢的右矢，在保持系数不变的情况下，可以通过该矩阵进行转换：
$$\begin{aligned}
|\beta\rangle&=\sum_i\langle a^i|\alpha\rangle|b^i\rangle\\
&=\sum_i\sum_j\langle a^i|\alpha\rangle\hat U_{ij}|a^j\rangle\\
&=\hat U |\alpha\rangle\\
\end{aligned}$$

反过来，如果要保持右矢不变，那么右矢在新基矢的系数则为：
$$\langle b^i|\alpha\rangle=\sum_j\langle b^i|a^j\rangle\langle a^j\alpha\rangle=\sum_j\langle a^i|\hat U^\dagger|a^j\rangle\langle a^j\alpha\rangle$$

也就是说把共轭矩阵作用在系数向量。

对于原来基矢的算符，同样类似于上面的变换：
$$\hat X_b=\hat U^\dagger\hat X_a\hat U$$
相似变换不改变矩阵的迹，即迹是不依赖于表象的：
$$\begin{aligned}
Tr(\hat X)&=\sum_i \langle a^i|\hat X |a^i\rangle\\
&=\sum_i\sum_j\sum_k \langle a^i|b^j\rangle\langle b^j|\hat X|b^k\rangle\langle b^k| a^i\rangle\\
&=\sum_i\sum_j\sum_k \langle b^k| a^i\rangle\langle a^i|b^j\rangle\langle b^j|\hat X|b^k\rangle\\
&=\sum_i\sum_j\sum_k \langle b^k|b^j\rangle\langle b^j|\hat X|b^k\rangle\\
&=\sum_i\sum_j\sum_k\langle b^j|\hat X|b^k\rangle \langle b^k|b^j\rangle\\
&=\sum_i\sum_j\sum_k\langle b^j|\hat X|b^j\rangle\\
\end{aligned}$$


# 混合态和密度矩阵

**纯态（pure state）**：纯态可以表示为一些态矢量的线性组合，是相干叠加（态之间相互影响）；叠加态是纯态。

**混合态（mixed state）**：混合态是一些叠加态的概率组合，是不相干叠加（态矢量之间不相互影响）。可以理解为叠加态的叠加。纯态可以视为特别的混合态。

> 举个例子：$\frac{1}{\sqrt{2}}(|\uparrow\rangle+|\downarrow\rangle)$是纯态，则一个有一半概率产生$|\uparrow\rangle$另一半概率产生$|\downarrow\rangle$的系统，或者含有一半$|\uparrow\rangle$一半$|\downarrow\rangle$的系综是混合态。
> 
> 同样测量$\hat\sigma_x$，纯态显示1，混合态显示0。

> 再举个例子：对于纯态$\psi(x)=c_1\psi_1(x)+c_2\psi_2(x)$和混合态$\begin{cases}\psi_1(x)&P_1\\\psi_2(x)&P_2\end{cases}$，在$x_0$处测量到粒子的概率分别为：
> $$|c_1\psi_1(x_0)+c_2\psi_2(x_0)|^2\quad and \quad \begin{cases}|\psi_1(x)|^2&P_1\\|\psi_2(x)|^2&P_2\end{cases}$$

> 导致结果差别的数学本质是混合态没有交叉项，这是为什么类比为非相干叠加的原因。混合态的组合需要用外积表示，也就是下文说的密度矩阵。

**密度矩阵/算符**：当基矢为可能出现的态时，密度矩阵（在可能出现的态的表象下）定义为：
$$\begin{pmatrix}
p_1&0&\cdots&0\\
0&p_2&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&p_n
\end{pmatrix}$$

或者表示为：
$$\hat\rho=\sum_{i=1}^n p_i|\psi_i\rangle\langle\psi_i|$$

显然其本征值为各参与混合态的概率。

但是用常规的基矢表示时，密度矩阵不一定是对角化的：
$$\begin{aligned}
\hat\rho&=\sum_{i=1}^n p_i|\psi_i\rangle\langle\psi_i|\\
&=\sum_{i=1}^n p_i(\sum_jc_{ij}|\phi_j\rangle)(\sum_kc_{ik}^*\langle\phi_k|)\\
&=\sum_j\sum_k(\sum_{i=1}^n p_ic_{ij}c_{ik}^*)|\phi_j\rangle\langle\phi_k|\\
\end{aligned}$$


**密度算符的运动方程**：运用Ehrenfest定理，混合态的演化可以表示为：
$$\frac{d\hat\rho}{dt}=\frac{\partial\hat\rho}{\partial t}+\frac{i}{\hbar}[\hat H,\hat \rho]$$

其中
$$\frac{\partial\hat\rho}{\partial t}=\frac{d p_i}{dt}|\psi_i\rangle\langle\psi_i|$$

**算符的平均值**：
$$\langle \hat A\rangle=Tr(\hat\rho \hat A)$$

证明：对于混合态，
$$\begin{aligned}Tr(\hat\rho \hat A)
&=\sum_n\langle \psi_n|\hat\rho \hat A|\psi_n\rangle\\
&=\sum_{n,i}p_i\langle \psi_n|\psi_i\rangle \langle \psi_i|\hat A|\psi_n\rangle\\
&=\sum_{n,i}p_i \langle \psi_i|\hat A|\psi_n\rangle\langle \psi_n|\psi_i\rangle\\
&=\sum_{i}p_i \langle \psi_i|\hat A|\psi_i\rangle\\
&=\langle \hat A\rangle\end{aligned}$$

**密度算符的性质**：
- $Tr(\hat\rho)=1$
- $\begin{cases}
Tr(\hat\rho^2)=1&pure\\
Tr(\hat\rho^2)<1&mixed
\end{cases}$

严格证明：选取一组完备的基$|n\rangle$（当然，从下面可以看到迹和这组基的选取无关）：
$$Tr(\hat\rho)=\sum_n\sum_iP_i\langle n|\psi_i\rangle\langle\psi_i|n\rangle=\sum_n\sum_iP_i\langle\psi_i|n\rangle\langle n|\psi_i\rangle=\sum_iP_i\langle \psi_i|\psi_i\rangle=1$$

同理，运用上面的结论：
$$\begin{aligned}
Tr(\hat\rho^2)&=\sum_n\sum_i\sum_jP_iP_j\langle n|\psi_i\rangle\langle \psi_i|\psi_j\rangle\langle \psi_j|n\rangle\\

&=\sum_i\sum_jP_iP_j|\langle \psi_i|\psi_j\rangle|^2\\
&\leq\sum_i\sum_jP_iP_j\\
&=1
\end{aligned}$$

> 切不可认为$Tr(\hat\rho^2)=\sum_iP_i^2$。这是因为$\hat\rho^2$并不是原来维度的矩阵，而是维度平方（或者说直积）的矩阵。
>
> 从：
> $$\hat\rho=\sum_j\sum_k(\sum_{i=1}^n p_ic_{ij}c_{ik}^*)|\phi_j\rangle\langle\phi_k|$$
> 中可以轻松看出：
> $$Tr(\hat \rho)=\sum_j(\sum_{i=1}^n p_ic_{ij}c_{ij}^*)=\sum_j\sum_{i=1}^n p_i|c_{ij}|^2=\sum_{i=1}^n p_i=1$$
> 而：
> $$Tr(\hat \rho^2)=\sum_n\sum_m(\sum_{i}\sum_{j} p_ip_j|c_{in}|^2|c_{jm}|^2)<1$$


**约化密度矩阵**：对于两个互相联系的系统$\mathcal{H_1}\otimes \mathcal{H_2}$，他们的基底分别是$|\alpha_i\rangle,|\beta_j\rangle$。

整体系统的基底由两组基底的直积构成：
$$|\psi\rangle=\sum_{i,j}c_{ij}|\alpha_i\rangle|\beta_j\rangle$$

我们可以证明，粒子1的物理量的平均值：
$$\langle\hat F(1)\rangle=Tr(\hat F(1)\otimes I(2)\hat\rho)=Tr_1(\hat F(1)\hat\rho_{red1})$$
其中，$\hat\rho_{red1}=Tr_2(\hat\rho)$。

证明：

$$\begin{aligned}
Tr(\hat F(1)\otimes I(2)\hat\rho)
&=\sum_{i,j} \langle\alpha_i|\langle\beta_j|\hat F(1)\otimes I(2)\hat\rho|\alpha_i\rangle|\beta_j\rangle\\
&=\sum_{i,j,m,n}\langle\alpha_i|\langle\beta_j|\hat F(1)\otimes I(2)|\alpha_m\rangle|\beta_n\rangle\langle\alpha_m|\langle\beta_n |\hat\rho|\alpha_i\rangle|\beta_j\rangle\\
&=\sum_{i,m}\langle\alpha_i|\hat F(1)\otimes I(2)|\alpha_m\rangle\langle\alpha_m|\hat\rho_{red1}|\alpha_i\rangle\\
&=\sum_{i}\langle\alpha_i|\hat F(1)\otimes I(2)\hat\rho_{red1}|\alpha_i\rangle\\
&=Tr_1(\hat F(1)\hat\rho_{red1})
\end{aligned}
$$


> 举个例子，对于双电子系统，$|\psi\rangle=\frac{1}{\sqrt{2}}(|\uparrow_1\downarrow_2\rangle+|\downarrow_1\uparrow_2\rangle)$，对第一个电子求约化密度矩阵：
> $$\hat\rho_{red1}=Tr_2(\hat \rho)=\langle\uparrow_2|\psi\rangle\langle\psi|\uparrow_2\rangle+\langle\downarrow_2|\psi\rangle\langle\psi|\downarrow_2\rangle=\frac{1}{\sqrt{2}}(\langle\uparrow_1|\uparrow_1\rangle+\langle\downarrow_1|\downarrow_1\rangle)$$

# 量子熵和极大熵原理

设$X$是一个随机变量，其取值的概率为$P_X$。

经典香农熵定义为：$S(X)=-\sum_X P_X\log{P_X}$

量子香农熵定义为：$S(\hat\rho)=-Tr(\hat\rho\log\hat\rho)$

量子香农熵显然不随相似变换而改变，那么选择本征态表象，可以得到和经典一样的表达式。

## 微正则系综


对于微正则系综：
$$\hat \rho=\frac{1}{\Omega}\sum_{i=1}^{\Omega}|\psi_i\rangle\langle\psi_i|$$

证明：

$$\begin{cases}
\delta S=0\\
Tr(\hat\rho)=1
\end{cases}$$

$$S=-\sum_ip_i\log{p_i},\sum_{i}p_i=1$$

$$S_L=-\sum_ip_i\log{p_i}-\alpha(\sum_{i}p_i-1)$$

$$\delta S_L=\sum_i(-\log{p_i}-1-\alpha)\delta p_i=0\Rightarrow p_i=e^{-(1+\alpha)}$$



## 正则系综
对于正则系综：
$$\hat \rho=\frac{1}{Z}e^{-\beta\hat H},Z=Tr(e^{-\beta\hat H})$$
证明：
$$\begin{cases}
\delta S=0\\
Tr(\hat\rho)=1\\
Tr(\hat\rho\hat H)=E
\end{cases}$$


$$S_L=-Tr(\hat\rho\log\hat\rho)-\alpha(Tr\hat\rho-1)-\beta(Tr(\hat\rho\hat H)-E)$$

> $$\delta(\alpha(Tr\hat\rho-1))=\alpha Tr(\delta\hat\rho)$$
> $$\delta(\beta(Tr(\hat\rho\hat H)-E))=\beta Tr(\delta\hat\rho\hat H)$$
> $$\delta(Tr(\hat\rho\log\hat\rho))=Tr(\delta\hat\rho\log\hat\rho)+Tr(\hat\rho\delta\log\hat\rho)$$
> 假设$\hat\rho=e^{\hat A}$，那么$\hat\rho\delta\log\hat\rho=e^{\hat A}\delta\hat A=\delta e^{\hat A}=\delta \hat\rho$，所以：
> $$\delta(Tr(\hat\rho\log\hat\rho))=Tr(\delta\hat\rho\log\hat\rho)+Tr(\delta\hat\rho)$$

$$\delta S_L=Tr[(-\log\hat\rho-1-\alpha-\beta\hat H)\delta \hat\rho]=0\Rightarrow \hat\rho=Ce^{-\beta H}$$
运用$Tr(\hat\rho)=1$，得到
$$\hat\rho=\frac{e^{-\beta H}}{Z}$$
其中$Z=Tr(e^{-\beta H})$

## 巨正则系综
对于巨正则系综：
$$\hat \rho=\frac{1}{Z}e^{-\beta(\hat H-\mu\hat N)},Z=Tr(e^{-\beta(\hat H-\mu\hat N)})$$
证明：
$$\begin{cases}
\delta S=0\\
Tr(\hat\rho)=1\\
Tr(\hat\rho\hat H)=E\\
Tr(\hat\rho\hat N)=N
\end{cases}$$
粒子数算符定义为$\hat N=a^\dagger a$

$$S_L=-Tr(\hat\rho\log\hat\rho)-\alpha(Tr\hat\rho-1)-\beta(Tr(\hat\rho\hat H)-E)-\beta\mu(Tr(\hat\rho\hat N)-N)$$

$$\delta S_L=(-\log\hat\rho-1-\alpha-\beta\hat H-\beta\mu\hat N)\delta \hat\rho=0\Rightarrow \hat\rho=\frac{e^{-\beta (H-\mu \hat N)}}{Z}$$
