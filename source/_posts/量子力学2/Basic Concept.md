---
title: Basic Concept
mathjax: true
date: 2024-08-15 10:56:17
tags: 量子力学2
categories: 量子力学2
cover:
---
- [混合态和密度矩阵](#混合态和密度矩阵)
- [量子熵和极大熵原理](#量子熵和极大熵原理)
  - [微正则系综](#微正则系综)
  - [正则系综](#正则系综)
  - [巨正则系综](#巨正则系综)



# 混合态和密度矩阵

**纯态（pure state）**：纯态可以表示为一些态矢量的线性组合，是相干叠加（态之间相互影响）；叠加态是纯态。

**混合态（mixed state）**：混合态是一些叠加态的概率组合，是不相干叠加（态矢量之间不相互影响）。可以理解为叠加态的叠加。纯态可以视为特别的混合态。

> 举个例子：$\frac{1}{\sqrt{2}}(|\uparrow\rangle+|\downarrow\rangle)$是纯态，则一个有一半概率产生$|\uparrow\rangle$另一半概率产生$|\downarrow\rangle$的系统，或者含有一半$|\uparrow\rangle$一半$|\downarrow\rangle$的系综是混合态。
> 
> 同样测量$\hat\sigma_x$，纯态显示1，混合态显示0。

> 再举个例子：对于纯态$\psi(x)=c_1\psi_1(x)+c_2\psi_2(x)$和混合态$\begin{cases}\psi_1(x)&P_1\\\psi_2(x)&P_2\end{cases}$，在$x_0$处测量到粒子的概率分别为：
> $$|c_1\psi_1(x_0)+c_2\psi_2(x_0)|^2\quad and \quad \begin{cases}|\psi_1(x)|^2&P_1\\|\psi_2(x)|^2&P_2\end{cases}$$

> 导致结果差别的数学本质是混合态没有交叉项，这是为什么类比为非相干叠加的原因。混合态的组合需要用外积表示，也就是下文说的密度矩阵。

**密度矩阵/算符**：定义为：
$$\begin{pmatrix}
p_1&0&\cdots&0\\
0&p_2&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&p_n
\end{pmatrix}$$

或者表示为：
$$\hat\rho=\sum_{i=1}^n p_i|\psi_i\rangle\langle\psi_i|$$

显然其本征值为各参与混合态的概率。

**密度算符的运动方程**：运用Ehrenfest定理，混合态的演化可以表示为：
$$\frac{d\hat\rho}{dt}=\frac{\partial\hat\rho}{\partial t}+\frac{i}{\hbar}[\hat H,\hat \rho]$$

其中
$$\frac{\partial\hat\rho}{\partial t}=\frac{d p_i}{dt}|\psi_i\rangle\langle\psi_i|$$

**算符的平均值**：
$$\langle \hat A\rangle=Tr(\hat\rho \hat A)$$

证明：对于纯态，
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

简化证明：选取混合态中的纯态作为一组基$|\alpha_i\rangle$，这组基内部互不相干，即$\langle\alpha_i|\alpha_j\rangle=0$，那么显然：
$$Tr(\hat\rho)=\sum_iP_i=1$$
$$Tr(\hat\rho^2)=\sum_iP_i^2\leq1$$

严格证明：选取一组完备的基$|n\rangle$（当然，从下面可以看到迹和这组基的选取无关）：
$$Tr(\hat\rho)=\sum_n\sum_iP_i\langle n|\psi_i\rangle\langle\psi_i|n\rangle=\sum_n\sum_iP_i\langle\psi_i|n\rangle\langle n|\psi_i\rangle=\sum_iP_i\langle \psi_i|\psi_i\rangle=1$$

同理，运用上面的结论：
$$Tr(\hat\rho^2)=\sum_i\sum_jP_iP_j|\psi_i\rangle\langle \psi_i|\psi_j\rangle\langle \psi_j|=\sum_i\sum_jP_iP_j|\langle \psi_i|\psi_j\rangle|^2\leq1$$

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

## 微正则系综
$$\begin{cases}
\delta S=0\\
Tr(\hat\rho)=1
\end{cases}$$


以二维系统为例，可以用经典方法解释：
$$S=-p_i\log{p_i},\sum_{i}p_i=1$$

$$S_L=-p_i\log{p_i}-\alpha(\sum_{i}p_i-1)$$

$$\delta S_L=(-\log{p_i}-1-\alpha)\delta p_i=0\Rightarrow p_i=e^{-(1+\alpha)}$$

甚至不需要用到量子的概念。

## 正则系综
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

$$\delta S_L=(-\log\hat\rho-1-\alpha-\beta\hat H)\delta \hat\rho=0\Rightarrow \hat\rho=Ce^{-\beta H}$$
运用$Tr(\hat\rho)=1$，得到
$$\hat\rho=\frac{e^{-\beta H}}{Z}$$
其中$Z=Tr(e^{-\beta H})$

## 巨正则系综
$$\begin{cases}
\delta S=0\\
Tr(\hat\rho)=1\\
Tr(\hat\rho\hat H)=E\\
Tr(\hat\rho\hat N)=N
\end{cases}$$
粒子数算符定义为$\hat N=a^\dagger a$

$$S_L=-Tr(\hat\rho\log\hat\rho)-\alpha(Tr\hat\rho-1)-\beta(Tr(\hat\rho\hat H)-E)-\beta\mu(Tr(\hat\rho\hat N)-N)$$

$$\delta S_L=(-\log\hat\rho-1-\alpha-\beta\hat H-\beta\mu\hat N)\delta \hat\rho=0\Rightarrow \hat\rho=\frac{e^{-\beta H}}{Z}$$

$$\hat\rho=\frac{e^{-\beta (H-\mu \hat N)}}{Z}$$

$$\beta=(k_BT)^{-1}$$
