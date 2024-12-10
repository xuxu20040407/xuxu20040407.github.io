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
- [Variantional Method](#variantional-method)
- [Scattering Theory](#scattering-theory)



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
&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle+\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle-\langle n^0|\delta \hat H|n^{0}\rangle \langle n^0|n^{1}\rangle\langle k^0|n^{0}\rangle\\
&=\langle n^0|\delta \hat H|n^{0}\rangle\langle k^0|n^{1}\rangle-\langle k^0|\delta \hat H|n^{1}\rangle+\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle-\langle n^0|\delta \hat H|n^{1}\rangle\langle k^0|n^{0}\rangle\\
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

# Variantional Method

# Scattering Theory

