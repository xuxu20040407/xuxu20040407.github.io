---
title: Cheating-Paper
mathjax: true
date: 2024-08-15 10:56:17
tags: 量子力学2
categories: 量子力学2
cover:
---
# Basic Concepts
## 运算规则
1. $(|\psi\rangle)^\dagger=\langle\psi|$
2. $(|\psi_i\rangle\langle\psi_j|)^\dagger=|\psi_j\rangle\langle\psi_i|$
3. $(\hat A\hat B)^\dagger=\hat B^\dagger\hat A^\dagger$
4. $(\langle\psi_j|\psi_i\rangle)^*=\langle\psi_i|\psi_j\rangle$
5. $(\langle\psi_j|\psi_i\rangle)^\dagger=(|\psi_i\rangle)^\dagger(\langle\psi_j|)^\dagger=\langle\psi_i|\psi_j\rangle=(\langle\psi_j|\psi_i\rangle)^*$
6. $\langle\psi_j|\hat A^T|\psi_i\rangle=\langle\psi_i|\hat A|\psi_j\rangle$
7. $\langle\psi_j|\hat A^\dagger|\psi_i\rangle=(\langle\psi_i|\hat A|\psi_j\rangle)^*$
8. **Hermitian operator**: $\hat A^\dagger=\hat A$
9. **Hermitian operator qualities:**
  -  Real Eigenvalues:$\langle\psi_j|\hat A|\psi_i\rangle=(\langle\psi_i|\hat A|\psi_j\rangle)^*\Rightarrow\langle\psi|\hat A|\psi\rangle\in\mathbb R$$
  -  Orthogonal Eigenvectors of different Eigenvalues:$\langle\psi_j|\hat A|\psi_i\rangle=a_i\langle\psi_j|\psi_i\rangle=a_j^*\langle\psi_j|\psi_i\rangle=(\langle\psi_i|\hat A|\psi_j\rangle)^*\Rightarrow\langle\psi_i|\psi_j\rangle=0,a_i\neq a_j$
  -  Observable:$\langle\psi|\hat A|\psi\rangle\in \mathbb R$
10. **Unitary operator**: $\hat U^\dagger\hat U=\hat U\hat U^\dagger=\hat I$
11. **Matrix Elements**: $A_{ij}=\langle i|\hat A|j\rangle$
12. **Projection operator**: $\hat P=|\psi\rangle\langle\psi|$


## 薛定谔表象和海森堡表象
1. $\hat H|\psi\rangle=i\hbar\frac{\partial}{\partial t}|\psi\rangle$
2. $\langle\psi|\hat H^\dagger=-i\hbar\frac{\partial}{\partial t}\langle\psi|$
3. **Ehrenfest's theorem**: $\frac{d\langle\hat A\rangle}{dt}=\frac{i}{\hbar}\langle[\hat H,\hat A]\rangle+\langle\frac{\partial\hat A}{\partial t}\rangle$
4. **Heisenberg equation of motion**: $\frac{d\hat A}{dt}=\frac{i}{\hbar}[\hat H,\hat A]$

|  | 薛定谔绘景 | 海森堡绘景 | 相互作用绘景 |
| --- | --- | --- | --- |
| 算符 | $\hat A_S$ | $\hat A_H(t)$ | $\hat A_I(t)$ |
| 矢量 | $\lvert\alpha_S(t)\rangle$ | $\lvert\alpha_H(t)\rangle$ | $\lvert\alpha_I(t)\rangle$ |
| 薛定谔矢量方程 | $i\hbar\frac{d}{dt}\lvert\alpha_S(t)\rangle=\hat H_S\lvert\alpha_S(t)\rangle$ | None | $i\hbar\frac{d}{dt}\lvert\alpha_I(t)\rangle=\hat V_I(t)\lvert\alpha_I(t)\rangle$ |
| 薛定谔算符方程 | None | $i\hbar\frac{d}{dt}\hat A_H(t)=[\hat A_H(t),\hat H_S]$ | $i\hbar\frac{d}{dt}\hat A_I(t)=[\hat A_I(t),\hat H_0]$ |

## 算符的对易
1. $[\hat A,\hat B]=\hat A\hat B-\hat B\hat A$
2. $[\hat x,\hat p_x]=i\hbar$
3. $[\hat x,k(\hat p_x)]=i\hbar k'(\hat p_x)$
4. $[\lambda(\hat x),\hat p_x]=i\hbar\lambda'(\hat x)$
5. **Expotential operator**: $e^{\hat A}=\sum_{n=0}^\infty\frac{\hat A^n}{n!}$
  - If $\hat A$ is Hermitian, $e^{\hat A}=\sum_n e^{a_n}|n\rangle\langle n|$
  - Further, $e^{f(\hat A)}=\sum_n e^{f(a_n)}|n\rangle\langle n|$
  - Baker-Hausdorff formula: $e^{\xi\hat A}\hat Be^{-\xi\hat A}=\hat B+\xi[\hat A,\hat B]+\frac{\xi^2}{2!}[\hat A,[\hat A,\hat B]]+\cdots$
  - Baker-Campbell-Hausdorff formula: $e^{\hat A+\hat B}=e^{\hat A}e^{\hat B}e^{-\frac{1}{2}[\hat A,\hat B]}$
6. **Uncertainty principle**: $\Delta A\Delta B\geq\frac{1}{2}|\langle[\hat A,\hat B]\rangle|$ the equality holds when $\hat A=ic \hat B$
  - $\Delta x\Delta p_x\geq\frac{\hbar}{2}$
  - $\Delta E\Delta t\geq\frac{\hbar}{2}$

# 谐振子和升降算符


# 量子几何

# 角动量理论

# 对称性

# 微扰论

# 散射理论