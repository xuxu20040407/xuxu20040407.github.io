---
title: Density-Matrix
mathjax: true
date: 2025-08-08 14:43:11
tags: 量子力学2
categories: 量子力学2
cover:
---

- [密度矩阵的动机和历史](#密度矩阵的动机和历史)
  - [量子统计](#量子统计)
  - [复合系统](#复合系统)
- [混合态和密度矩阵](#混合态和密度矩阵)
  - [纯态和混合态](#纯态和混合态)
  - [从纯态引入密度算符](#从纯态引入密度算符)
  - [密度算符之于混合态](#密度算符之于混合态)
  - [密度算符的运动方程](#密度算符的运动方程)
  - [复合系统和约化密度矩阵](#复合系统和约化密度矩阵)
  - [Schmidt分解定理](#schmidt分解定理)
- [量子熵和极大熵原理](#量子熵和极大熵原理)
  - [微正则系综](#微正则系综)
  - [正则系综](#正则系综)
  - [巨正则系综](#巨正则系综)

# 密度矩阵的动机和历史
## 量子统计
密度矩阵的概念起源于量子统计力学和量子测量理论，最早是由约翰·冯·诺伊曼在1927年提出的。当我们提到统计的时候，第一反应应该是量子力学中的系综是什么？系综是由许多不同的系统组成的，一个纯态$|\psi_j\rangle$可以类比为一个系统，而一堆纯态$\{|\psi_j\rangle:p_j\}$可以类比为一个系综。为了实现对系综的方便测量，比如测量其中$|m\rangle$态的比例/概率：
$$p(|m\rangle)=\sum_j p_j\langle \psi_j|\hat P_m|\psi_j\rangle$$
其中$\hat P_m=|m\rangle\langle m|$是投影算符，$p_j$是系综中第$j$个纯态的概率。稍加化简，可以得到：
$$\begin{aligned}
p(|m\rangle)&=\sum_j p_j\langle \psi_j|m\rangle\langle m|\psi_j\rangle\\
&=\sum_j p_j\langle m|\psi_j\rangle\langle \psi_j|m\rangle\\
&=\langle m|\left(\sum_j p_j|\psi_j\rangle\langle \psi_j|\right)|m\rangle\\
&=\langle m|\hat\rho|m\rangle\\
&=\text{tr}(\hat\rho\hat  P_m)\\
\end{aligned}$$
这是冯·诺伊曼的引入逻辑。解决了$|m\rangle$态的比例/概率，自然就可以解决其他统计量的计算。利用统计量算符的谱分解$\hat A=\sum_a a\hat P_a$，可以得到：
$$\langle \hat A\rangle=\langle \sum_a a\hat P_a\rangle=\sum_a a\langle \hat P_a\rangle=\sum_a a\text{tr}(\hat\rho\hat P_a)=\text{tr}(\hat\rho\hat A)$$

## 复合系统
朗道也独立提出了密度矩阵的概念，但他的动机是无法用态矢量描述复合量子系统的子系统。或者说，当我们只关心复合空间$\mathcal{H}_1\otimes\mathcal{H}_2$的纠缠态中的子系统$\mathcal{H}_1$时，这个子系统就是一个混合态：
$$p(|m\rangle)=\langle \Psi|\hat P_m \otimes\hat I|\Psi\rangle=\text{tr}\left[\hat P_m\left(\text{tr}_2\hat\rho\right)\right]$$



在下面几个小节，我们会介绍密度算符作为态矢量的替代，甚至是推广的存在。然后分别从冯·诺伊曼和朗道的角度介绍密度矩阵的应用。


# 混合态和密度矩阵
## 纯态和混合态
**纯态（pure state）**：纯态可以表示为一些态矢量的线性组合，是相干叠加（态之间相互影响）；叠加态是纯态。

**混合态（mixed state）**：混合态是一些叠加态的概率组合，是非相干叠加（态矢量之间不相互影响）。可以理解为叠加态的叠加。纯态可以视为特别的混合态。

> 举个例子：$\frac{1}{\sqrt{2}}(|\uparrow\rangle+|\downarrow\rangle)$是纯态，则一个有一半概率产生$|\uparrow\rangle$另一半概率产生$|\downarrow\rangle$的系统，或者含有一半$|\uparrow\rangle$一半$|\downarrow\rangle$的系综是混合态。
> 
> 同样测量$\hat\sigma_x$，纯态显示1，混合态显示0。

> 再举个例子：对于纯态$\psi(x)=c_1\psi_1(x)+c_2\psi_2(x)$和混合态$\begin{cases}\psi_1(x)&P_1\\\psi_2(x)&P_2\end{cases}$，在$x_0$处测量到粒子的概率分别为：
> $$|c_1\psi_1(x_0)+c_2\psi_2(x_0)|^2\quad and \quad \begin{cases}|\psi_1(x)|^2&P_1\\|\psi_2(x)|^2&P_2\end{cases}$$
> 显然，用态矢量去描述一个混合态是很丑陋的。

> 导致结果差别的数学本质是混合态没有交叉项，这是为什么类比为非相干叠加的原因。混合态的组合需要用外积表示，也就是下文说的密度矩阵。

## 从纯态引入密度算符
我们知道用一个态矢量$|\psi\rangle$可以描述一个纯态。显然，用算符也可以描述一个纯态，因为我没有增加或减少其中的任意信息：
$$\hat\rho=|\psi\rangle\langle\psi|$$
在任意正交归一化基底$\{|e_i\rangle\}$下，密度算符表示为：
$$\hat\rho=\sum_{i,j}|e_i\rangle\langle e_i|\psi\rangle\langle\psi|e_j\rangle\langle e_j|=\sum_{i,j}\langle e_i|\psi\rangle\langle\psi|e_j\rangle|e_i\rangle\langle e_j|=\sum_{i,j}\rho_{ij}|e_i\rangle\langle e_j|$$
可以证明，纯态的密度算符具有以下性质：
- **定义**：它可以写为单个态矢量的外积：
  $$\hat\rho=|\psi\rangle\langle\psi|$$
- **厄米性**：密度算符是厄米的，即$\hat\rho^\dagger=\hat\rho$。
    > 证明：只需要证明$\rho_{ij}=\rho_{ji}^*$即可。
    > $$\rho_{ij}=\langle e_i|\psi\rangle\langle\psi|e_j\rangle=\langle e_j|\psi\rangle^*\langle\psi|e_i\rangle^*=\rho_{ji}^*$$
- **幂等性**：密度算符的平方等于其自身：
  $$\hat\rho^2=\hat\rho$$
    > 证明：
    > $$\hat\rho^2=|\psi\rangle\langle\psi|\psi\rangle\langle\psi|=|\psi\rangle\langle\psi|=\hat\rho$$
- **纯度为1**：密度算符平方的迹等于1：
  $$Tr(\hat\rho^2)=Tr(\hat\rho)=1$$
    > 证明：
    > $$Tr(\hat\rho^2)=Tr(\hat\rho)=\sum_i\langle e_i|\hat\rho|e_i\rangle=\sum_i\langle e_i|\psi\rangle\langle\psi|e_i\rangle=\langle\psi|\psi\rangle=1$$
- **可观测量**：对于任意可观测量$\hat A$，其期望值可以表示为：
  $$\langle \hat A\rangle=Tr(\hat\rho \hat A)$$
    > 证明：
    > $$\begin{aligned}
    > Tr(\hat\rho \hat A)&=\sum_i\langle e_i|\hat\rho \hat A|e_i\rangle\\
    > &=\sum_i\langle e_i|\psi\rangle\langle\psi|\hat A|e_i\rangle\\
    > &=\sum_i\langle\psi|\hat A|e_i\rangle\langle e_i|\psi\rangle\\
    > &=\langle\psi|\hat A|\psi\rangle\\
    > &=\langle \hat A\rangle
    > \end{aligned}$$


## 密度算符之于混合态
密度算符是态矢量的推广，因为态矢量无法描述混合态。对于混合态，我们可以定义密度算符为：
$$\hat\rho=\sum_{i=1}^n p_i|\psi_i\rangle\langle\psi_i|$$
显然其本征值为各参与混合态的纯态的概率。

但是用常规的基矢表示时，密度矩阵不一定是对角化的，不过显然是厄密的：
$$\begin{aligned}
\hat\rho&=\sum_{i=1}^n p_i|\psi_i\rangle\langle\psi_i|\\
&=\sum_{i=1}^n p_i(\sum_jc_{ij}|e_j\rangle)(\sum_kc_{ik}^*\langle e_k|)\\
&=\sum_j\sum_k(\sum_{i=1}^n p_ic_{ij}c_{ik}^*)|e_j\rangle\langle e_k|\\
\end{aligned}$$
密度算符包含了整个系综的所有信息，所以同样可以用来计算系综中任意可观测量的期望值：
$$\langle \hat A\rangle=Tr(\hat\rho \hat A)$$

> 证明：对于混合态，
> $$\begin{aligned}Tr(\hat\rho \hat A)
    &=\sum_n\langle \psi_n|\hat\rho \hat A|\psi_n\rangle\\
    &=\sum_{n,i}p_i\langle \psi_n|\psi_i\rangle \langle \psi_i|\hat A|\psi_n\rangle\\
    &=\sum_{n,i}p_i \langle \psi_i|\hat A|\psi_n\rangle\langle \psi_n|\psi_i\rangle\\
    &=\sum_{i}p_i \langle \psi_i|\hat A|\psi_i\rangle\\
    &=\langle \hat A\rangle\end{aligned}$$

不过，相比于纯态的密度矩阵，混合态的密度矩阵不再具有幂等性和纯度为1的性质：
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

> 切不可认为$Tr(\hat\rho^2)=\sum_iP_i^2$！这是因为这样描述下的$\hat\rho^2$是在非正交纯态基上描述的，那么trace就不是一个良定义的量（不再是相似不变量）。

> 从：
> $$\hat\rho=\sum_j\sum_k(\sum_{i=1}^n p_ic_{ij}c_{ik}^*)|e_j\rangle\langle e_k|$$
> 中也可以轻松看出：
> $$Tr(\hat \rho)=\sum_j(\sum_{i=1}^n p_ic_{ij}c_{ij}^*)=\sum_j\sum_{i=1}^n p_i|c_{ij}|^2=\sum_{i=1}^n p_i=1$$
> 而：
> $$Tr(\hat \rho^2)=\sum_n\sum_m(\sum_{i}\sum_{j} p_ip_j|c_{in}|^2|c_{jm}|^2)<1$$

## 密度算符的运动方程
既然说密度算符全方位替代了态矢量，那么他的演化应该和态矢量在薛定谔方程下的演化保持一致。类似 {% post_link '量子力学/对称性和守恒律' %} 中的Ehrenfest定理：
$$\frac{d\langle A\rangle}{d t}=\left\langle\frac{\partial A}{\partial t}\right\rangle+\frac{1}{i\hbar}\langle[A,H]\rangle$$
混合态的演化可以表示为：
$$\frac{d\hat\rho}{dt}=\frac{\partial\hat\rho}{\partial t}+\frac{1}{i\hbar}[\hat H,\hat \rho]$$

其中：
$$\frac{\partial\hat\rho}{\partial t}=\frac{d p_i}{dt}|\psi_i\rangle\langle\psi_i|$$

> 跟Ehrenfest定理和海森堡方程相差一个负号。相关讨论见 {% post_link '量子力学/对称性和守恒律' %} 。

如果密度算符本身选择能量表象，则：
$$\frac{d}{dt}\rho_{mn}=\frac{1}{i\hbar}(E_m-E_n)\rho_{mn}\Rightarrow \rho_{mn}(t)=\rho_{mn}(0)e^{-i\omega_{mn}t}$$
这意味着对角元不变，非对角元随时间振荡。

## 复合系统和约化密度矩阵
对于两个互相联系的系统$\mathcal{H_1}\otimes \mathcal{H_2}$，他们的基底分别是$|\alpha_i\rangle,|\beta_j\rangle$。

整体系统的基底由两组基底的直积构成：
$$|\psi_{ij}\rangle=\sum_{i,j}c_{ij}|\alpha_i\rangle|\beta_j\rangle$$

我们可以证明，粒子1的物理量的平均值：
$$\langle\hat A(1)\rangle=Tr(\hat A(1)\otimes I(2)\hat\rho)=Tr_1(\hat A(1)\hat\rho_{red1})$$
其中，约化密度矩阵来源于对另一个系统求trace：$\hat\rho_{red1}=Tr_2(\hat\rho)$。

证明：

$$\begin{aligned}
Tr(\hat A(1)\otimes I(2)\hat\rho)
&=\sum_{i,j} \langle\alpha_i|\langle\beta_j|\hat A(1)\otimes I(2)\hat\rho|\alpha_i\rangle|\beta_j\rangle\\
&=\sum_{i,j,m,n}\langle\alpha_i|\langle\beta_j|\hat A(1)\otimes I(2)|\alpha_m\rangle|\beta_n\rangle\langle\alpha_m|\langle\beta_n |\hat\rho|\alpha_i\rangle|\beta_j\rangle\\
&=\sum_{i,m}\langle\alpha_i|\hat A(1)\otimes I(2)|\alpha_m\rangle\langle\alpha_m|\hat\rho_{red1}|\alpha_i\rangle\\
&=\sum_{i}\langle\alpha_i|\hat A(1)\otimes I(2)\hat\rho_{red1}|\alpha_i\rangle\\
&=Tr_1(\hat A(1)\hat\rho_{red1})
\end{aligned}
$$


> 举个例子，对于双电子系统，$|\psi\rangle=\frac{1}{\sqrt{2}}(|\uparrow_1\downarrow_2\rangle+|\downarrow_1\uparrow_2\rangle)$，对第一个电子求约化密度矩阵：
> $$\hat\rho_{red1}=Tr_2(\hat \rho)=\langle\uparrow_2|\psi\rangle\langle\psi|\uparrow_2\rangle+\langle\downarrow_2|\psi\rangle\langle\psi|\downarrow_2\rangle=\frac{1}{2}(|\uparrow_1\rangle\langle\uparrow_1|+|\downarrow_1\rangle\langle\downarrow_1|)$$

约化密度矩阵$\hat\rho_{red1}$含有第一个子系统的全部信息，而$\hat\rho_{red2}$含有第二个子系统的全部信息。那么复合系统的信息呢？如果两个系统没有关联，那么复合系统的密度矩阵就是两个子系统密度矩阵的直积：

$$\hat\rho=\hat\rho_{red1}\otimes \hat\rho_{red2}$$
在这种情况下，对整个复合系统求统计量，可以得到：
$$\begin{aligned}
\langle \hat A(1)\otimes \hat A(2)\rangle&=Tr(\hat\rho_{red1}\hat\rho_{red2}\hat A(1)\otimes \hat A(2))\\
&=Tr(\hat\rho_{red1}\hat A(1)\otimes \hat\rho_{red2}\hat A(2))\\
&=Tr_1(\hat A(1)\hat\rho_{red1})Tr_2(\hat A(2)\hat\rho_{red2})\\
&=\langle \hat A(1)\rangle\langle \hat A(2)\rangle
\end{aligned}
$$
但是如果两个系统有关联，算符就不能简单对易了：
$$\hat\rho_{red2}\hat A(1)\neq \hat A(1)\hat\rho_{red2}$$
这时候物理量就不是简单的乘积了：
$$\langle \hat A(1)\otimes \hat A(2)\rangle\neq\langle \hat A(1)\rangle\langle \hat A(2)\rangle$$


> 还是双电子系统的例子，$|\psi\rangle=\frac{1}{\sqrt{2}}(|\uparrow_1\downarrow_2\rangle+|\downarrow_1\uparrow_2\rangle)$，第一个电子的约化密度矩阵：
> $$\hat\rho_{red1}=\frac{1}{2}(|\uparrow_1\rangle\langle\uparrow_1|+|\downarrow_1\rangle\langle\downarrow_1|)$$
> 而第二个电子的约化密度矩阵：
> $$\hat\rho_{red2}=\frac{1}{2}(|\uparrow_2\rangle\langle\uparrow_2|+|\downarrow_2\rangle\langle\downarrow_2|)$$
> 对比整个复合系统的密度矩阵：
> $$\begin{aligned}
    \hat\rho&=\frac{1}{2}(|\uparrow_1\downarrow_2\rangle+|\downarrow_1\uparrow_2\rangle)(\langle\uparrow_1\downarrow_2|+\langle\downarrow_1\uparrow_2|)\\
    &=\frac{1}{2}(|\uparrow_1\downarrow_2\rangle\langle\uparrow_1\downarrow_2|+|\downarrow_1\uparrow_2\rangle\langle\downarrow_1\uparrow_2|+|\uparrow_1\downarrow_2\rangle\langle\downarrow_1\uparrow_2|+|\downarrow_1\uparrow_2\rangle\langle\uparrow_1\downarrow_2|)
    \end{aligned}$$
> 显然，$\hat\rho\neq\hat\rho_{red1}\otimes \hat\rho_{red2}$，这说明两个系统是有关联的。反过来，什么时候$\hat\rho=\hat\rho_{red1}\otimes \hat\rho_{red2}$呢？显然，如果$\hat\rho_{red1}$和$\hat\rho_{red2}$都是纯态，那么自然$\hat\rho=|\Psi\rangle\langle\Psi|=|\psi_1\rangle\langle\psi_1|\otimes|\psi_2\rangle\langle\psi_2|=\hat\rho_{red1}\otimes \hat\rho_{red2}$，说明纯态的复合是无关联的。
>
> 除了关心初态是否是关联的，还得关心演化后的状态是否是关联的。如果决定演化的哈密顿量子算符$\hat H$表示两个系统无相互作用$\hat H_1+ \hat H_2$，那么演化后的状态仍然是无关联的；如果$\hat H$表示两个系统有相互作用$\hat H_1+ \hat H_2+\hat V$，那么演化后的状态是关联的。

## Schmidt分解定理
一般来说，复合系统的态要分解为$N_1N_2$项，其中$N_1$和$N_2$分别是两个子系统的维数。Schmidt分解定理指出，任意一个复合系统的态都可以分解为：
$$|\Psi\rangle=\sum_{i=1}^N\sqrt{p_i}|\alpha_i\rangle|\beta_i\rangle$$
其中$N=\min(N_1,N_2)$，$p_i$是非负实数，$|\alpha_i\rangle$和$|\beta_i\rangle$分别是两个子系统的正交归一化基底。

> 证明思路为，假设$N_1\leq N_2$，原始分解为：
> $$|\Psi\rangle=\sum_{i=1}^{N_1}\sum_{j=1}^{N_2}c_{ij}|\alpha_i\rangle|\beta_j\rangle=\sum_{i=1}^{N_1}\left(\sum_{j=1}^{N_2}c_{ij}|\beta_j\rangle\right)|\alpha_i\rangle$$
> 通过Schmidt正交化过程，可以将$\left(\sum_{j=1}^{N_2}c_{ij}|\beta_j\rangle\right)$正交化为一组正交归一化的基底$|\beta'_i\rangle$。显然，在高维$N_2$空间中找出一组低维$N_1$个基底是合理的。

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

