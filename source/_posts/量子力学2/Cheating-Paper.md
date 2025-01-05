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
  -  Real Eigenvalues:$\langle\psi_j|\hat A|\psi_i\rangle=(\langle\psi_i|\hat A|\psi_j\rangle)^*\Rightarrow\langle\psi|\hat A|\psi\rangle\in\mathbb R$
  -  Orthogonal Eigenvectors of different Eigenvalues:$\langle\psi_j|\hat A|\psi_i\rangle=a_i\langle\psi_j|\psi_i\rangle=a_j^*\langle\psi_j|\psi_i\rangle=(\langle\psi_i|\hat A|\psi_j\rangle)^*\Rightarrow\langle\psi_i|\psi_j\rangle=0,a_i\neq a_j$
  -  Observable:$\langle\psi|\hat A|\psi\rangle\in \mathbb R$
10. **Unitary operator**: $\hat U^\dagger\hat U=\hat U\hat U^\dagger=\hat I$
11. **Matrix Elements**: $A_{ij}=\langle i|\hat A|j\rangle$
12. **Projection operator**: $\hat P=|\psi\rangle\langle\psi|$
13. **Trace**: $Tr(\hat A)=\sum_i\langle i|\hat A|i\rangle$
  - Linearity: $Tr(\hat A+\hat B)=Tr(\hat A)+Tr(\hat B)$
  - Cyclic property: $Tr(\hat A\hat B\hat C)=Tr(\hat B\hat C\hat A)=Tr(\hat C\hat A\hat B)$
  - Similarity: $Tr(\hat A)=Tr(\hat U\hat A\hat U^\dagger)\Rightarrow Tr(\hat A)=\sum_i \lambda_i$


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
2. $[\hat A,\hat B]^\dagger=[\hat B^\dagger,\hat A^\dagger]$
3. $[\hat A,\hat B+\hat C]=[\hat A,\hat B]+[\hat A,\hat C]$
4. $[\hat A,\hat B\hat C]=[\hat A,\hat B]\hat C+\hat B[\hat A,\hat C]$
5.  $[\hat A,\hat B\hat C]+[\hat B,\hat C\hat A]+[\hat C,\hat A\hat B]=0$
6. $[\hat x,\hat p_x]=i\hbar$
7. $[\hat x,k(\hat p_x)]=i\hbar k'(\hat p_x)$
8. $[\lambda(\hat x),\hat p_x]=i\hbar\lambda'(\hat x)$
9. **Expotential operator**: $e^{\hat A}=\sum_{n=0}^\infty\frac{\hat A^n}{n!}$
  - If $\hat A$ is Hermitian, $e^{\hat A}=\sum_n e^{a_n}|n\rangle\langle n|$
  - Further, $e^{f(\hat A)}=\sum_n e^{f(a_n)}|n\rangle\langle n|$
  - Baker-Hausdorff formula: $e^{\xi\hat A}\hat Be^{-\xi\hat A}=\hat B+\xi[\hat A,\hat B]+\frac{\xi^2}{2!}[\hat A,[\hat A,\hat B]]+\cdots$
  - Baker-Campbell-Hausdorff formula: $e^{\hat A+\hat B}=e^{\hat A}e^{\hat B}e^{-\frac{1}{2}[\hat A,\hat B]}$
10. **Uncertainty principle**: $\Delta A\Delta B\geq\frac{1}{2}|\langle[\hat A,\hat B]\rangle|$ the equality holds when $\hat A=ic \hat B$
  - $\Delta x\Delta p_x\geq\frac{\hbar}{2}$
  - $\Delta E\Delta t\geq\frac{\hbar}{2}$

## 混合态和密度矩阵
- **Density matrix**: $\hat\rho=\sum_i p_i|\psi_i\rangle\langle\psi_i|$
- **Density matrix Quality**:
  - Trace: $Tr(\hat\rho)=1$
  - Idempotent: $\begin{cases}\hat\rho^2=\hat\rho&pure~state\\\hat\rho^2\neq\hat\rho&mixed~state\end{cases}$
  - Trace of Square: $\begin{cases}Tr(\hat\rho^2)=1&pure~state\\Tr(\hat\rho^2)<1&mixed~state\end{cases}$
  - Hermitian: $\hat\rho^\dagger=\hat\rho$
  - Positive: $\langle\psi|\hat\rho|\psi\rangle\geq 0$
- **Motion of density matrix**: $\frac{d\hat\rho}{dt}=\frac{i}{\hbar}[\hat H,\hat\rho]+\frac{\partial\hat\rho}{\partial t}$
- **Average value**: $\langle\hat A\rangle=Tr(\hat\rho\hat A)$
- **Reduced density matrix**: $\hat\rho_A=Tr_B(\hat\rho_{AB})$
  - Average value of partial system: $\langle\hat A\rangle=Tr_A(\hat\rho_{A}\hat A)=Tr_A(Tr_B(\hat\rho_{AB})\hat A)$

# 谐振子和升降算符

1. **Hamiltonian**: $\hat H=\frac{\hat p^2}{2m}+\frac{1}{2}m\omega^2\hat x^2$
2. **Eigenvalue equation**: $\hat H|n\rangle=E_n|n\rangle=\hbar\omega(n+\frac{1}{2})|n\rangle$
3. **Creation and Annihilation operator**: $\hat a=\frac{1}{\sqrt{2\hbar m\omega}}(i\hat p+m\omega \hat x),\hat a^\dagger=\frac{1}{\sqrt{2\hbar m\omega}}(-i\hat p+m\omega \hat x)$
4. **Commutation relation**: $[\hat a,\hat a^\dagger]=1$
5. **Hamiltonian in terms of $\hat a$ and $\hat a^\dagger$**: $\hat H=\hbar\omega(\hat a^\dagger\hat a+\frac{1}{2})=\hbar\omega(\hat a\hat a^\dagger-\frac{1}{2})$
6. **Quality of $\hat a$ and $\hat a^\dagger$**:
  - $\hat a|n\rangle=\sqrt{n}|n-1\rangle$
  - $\hat a^\dagger|n\rangle=\sqrt{n+1}|n+1\rangle$
  - $\hat x=\sqrt{\frac{\hbar}{2m\omega}}(\hat a+\hat a^\dagger)$
  - $\hat p=i\sqrt{\frac{\hbar m\omega}{2}}(\hat a-\hat a^\dagger)$
7. **Ground state**: $\hat a|0\rangle=0\Rightarrow|0\rangle=(\frac{m\omega}{\pi\hbar})^{\frac14}e^{-\frac{m\omega}{2\hbar}x^2}$

# 粒子数表象
1. **Particle number operator**: $\hat N=\hat a^\dagger\hat a,\hat H=\hbar\omega(\hat N+\frac12)$
2. **Eigenvalue equation**: $\hat N|n\rangle=n|n\rangle$
3. **Amplitude Operator**: $\hat B=\sqrt{\hat N+1}=\sum_n \sqrt{n+1}|n\rangle\langle n|$
4. **Phase Operator**: $e^{i\hat \Phi}=\sum_{n=0} |n\rangle\langle n+1|,e^{-i\hat \Phi}=\sum_{n=0} |n+1\rangle\langle n|$
5. **Quality**:
  - $\hat a=\hat B e^{i\hat \Phi}=\sum_n\sqrt{n+1}|n\rangle\langle n+1|$
  - $\hat a^\dagger=e^{-i\hat \Phi}\hat B=\sum_n\sqrt{n+1}|n+1\rangle\langle n|$
  - $[\hat N,\cos{\hat\Phi}]=-i\sin{\hat\Phi}$
  - $[\hat N,\sin{\hat\Phi}]=i\cos{\hat\Phi}$


# 量子几何
哈密顿算符变化一周的时候，本征态的变化分为动力学相位和几何相位：
$$\begin{aligned}C_m(t_0)&=C_m(0)\exp{[-\int^{t_0}_0 \frac{i}{\hbar}E_m(t) dt]}\exp{[-\int^{t_0}_0\langle m(t)|\dot{m}(t)\rangle dt]}\\&=C_m(0)\exp{[-\frac{i}{\hbar}\int^{t_0}_0 E_m(t) dt]}\exp{[i\gamma(t_0)]}\end{aligned}$$
其中
$$\gamma(t_0)=i\int^{t_0}_0\langle m(t)|\dot{m}(t)\rangle dt$$
当然，如果引起本征态或哈密顿算符变化的参数不直接是时间而是$\lambda(t)$，原定义推广为：
$$\gamma(\lambda_0)=i\int^{\lambda_0}_0\langle m(\lambda(t))|\vec{\nabla_\lambda}|m(\lambda(t))\rangle dt$$
其中
$$\langle m(\lambda(t))|\vec{\nabla_\lambda}|m(\lambda(t))\rangle$$
被称为Berry联络。



# 角动量理论
## 轨道角动量
1. **Definition**: $[\hat L_i,\hat L_j]=i\hbar\epsilon_{ijk}\hat L_k$
2. **Commutation relation**:
   - Scalar Operator: $[\hat L_i,\hat S]=0$
   - Vector Operator: $[\hat L_i,\hat V_j]=i\hbar\epsilon_{ijk}\hat V_k$
   - $[\hat L^2,\hat L_i]=0$
   - Hamiltonian: $[\hat L^2,\hat H]=[\hat L_z,\hat H]=0$
3. **Eigenvalue equation**: $\hat L^2|l,m\rangle=l(l+1)\hbar^2|l,m\rangle,\hat L_z|l,m\rangle=m\hbar|l,m\rangle$ 
4. **Creation and Annihilation operator**: $\hat L_\pm=\hat L_x\pm i\hat L_y$
   - $[\hat L_z,\hat L_\pm]=\pm\hbar\hat L_\pm$
   - $\hat L_\pm|l,m\rangle=\hbar\sqrt{l(l+1)-m(m\pm1)}|l,m\pm1\rangle$
 
## 自旋角动量
1. **Definition**: $[\hat S_i,\hat S_j]=i\hbar\epsilon_{ijk}\hat S_k$
2. **Commutation relation** is as same as orbital angular momentum
3. **Pauli matrices**: $\sigma_x=\begin{pmatrix}0&1\\1&0\end{pmatrix},\sigma_y=\begin{pmatrix}0&-i\\i&0\end{pmatrix},\sigma_z=\begin{pmatrix}1&0\\0&-1\end{pmatrix}$
   - $\sigma_x^2=\sigma_y^2=\sigma_z^2=\hat I$
   - $\sigma_x\sigma_y=i\sigma_z,\sigma_y\sigma_z=i\sigma_x,\sigma_z\sigma_x=i\sigma_y$
   - $\sigma_x\sigma_y\sigma_z=i\hat I$
   - Commutation relation: $[\sigma_i,\sigma_j]=2i\epsilon_{ijk}\sigma_k$
   - Inverse Commutation relation: $\{\sigma_i,\sigma_j\}=2\delta_{ij}$
4. **Eigenvalue Vector of Pauli matrices**:
   - $\sigma_x=\begin{cases}&1&\frac{1}{\sqrt{2}}\begin{pmatrix}1\\1\end{pmatrix}\\&-1&\frac{1}{\sqrt{2}}\begin{pmatrix}1\\-1\end{pmatrix}\end{cases}$
   - $\sigma_y=\begin{cases}&1&\frac{1}{\sqrt{2}}\begin{pmatrix}1\\i\end{pmatrix}\\&-1&\frac{1}{\sqrt{2}}\begin{pmatrix}1\\-i\end{pmatrix}\end{cases}$
   - $\sigma_z=\begin{cases}&1&\begin{pmatrix}1\\0\end{pmatrix}\\&-1&\begin{pmatrix}0\\1\end{pmatrix}\end{cases}$
   - $\sigma_n=\begin{cases}&1&\begin{pmatrix}\cos{\frac\theta2}\\\sin{\frac\theta2}e^{i\phi}\end{pmatrix}\\&-1&\begin{pmatrix}\sin{\frac\theta2}e^{i\phi}\\-\cos{\frac\theta2}\end{pmatrix}\end{cases}$





# 对称性



# 微扰论
## 不含时微扰
1. **Perturbation Hamiltonian**: $\hat H=\hat H_0+\lambda\hat V$
2. **Eigenvalue equation**: $\hat H(\lambda)|n\rangle_\lambda=E_n(\lambda)|n\rangle_\lambda$
3. **Modification of Eigenvalue and Vector**: $|n\rangle_\lambda=\sum_{i=0}^\infty \lambda^i|n^i\rangle,E_n(\lambda)=\sum_{i=0}^\infty \lambda^iE^i_n$
4. **Correction Equation**: 
$$\begin{aligned}
\lambda^0\quad&(\hat H^0-E^0_n)|n^0\rangle=0\\
\lambda^1\quad&(\hat H^0-E^0_n)|n^1\rangle=(E^1_n-\delta \hat H)|n^0\rangle\\\cdots\quad\\
\lambda^k\quad&(\hat H^0-E^0_n)|n^k\rangle=(E^1_n-\delta \hat H)|n^{k-1}\rangle+\sum_{i=2}^k E^i_n|n^{k-i}\rangle
\end{aligned}$$
5. **First Order Correction**: $E^1_n=\langle n^0|\hat V|n^0\rangle,|n^1\rangle=\sum_{m\neq n}\frac{\langle m^0|\hat V|n^0\rangle}{E^0_n-E^0_m}|m^0\rangle$
6. **Second Order Correction**: $E^2_n=\langle n^0| \hat V|n^{1}\rangle- \langle n^0|E^1_n|n^{1}\rangle$
7. **Degenrate Case**: Only to find "Good" basis

## 含时微扰
1. **Perturbation Hamiltonian**: $\hat H=\hat H_0+\lambda\hat V(t)$
2. **Expansion**: $|n(t)\rangle=\sum_{i=0}^\infty c_i(t)|i\rangle$
3. **Accurate Equation**: $i\hbar\frac{d}{dt}c_n(t)=\sum_mV_{nm} c_m(t)e^{i(E_n-E_m)t/\hbar}$
$$i\hbar\frac{d}{dt}\begin{pmatrix}c_1(t)\\c_2(t)\\\vdots\end{pmatrix}=\begin{pmatrix}V_{11}&V_{12}e^{i\omega_{12}t}&\cdots\\V_{21}e^{i\omega_{21}t}&V_{22}&\cdots\\\vdots&\vdots&\ddots\end{pmatrix}\begin{pmatrix}c_1(t)\\c_2(t)\\\vdots\end{pmatrix}$$
4. **Dyson series**: $c_n(t)=c_n^{(0)}(t)+c_n^{(1)}(t)+c_n^{(2)}(t)+\cdots$
5. **Approximate Equation**:
$$U_I(t,t_0)
=\sum_{n=0}^\infty(-\frac{i}{\hbar})^n\int_{t_0}^t\cdots\int_{t_0}^{t_{n-1}}\hat V_I(t_1)\cdots\hat V_I(t_n)dt_1\cdots dt_n$$
6. **Zero Order Approximation**: $c_n^{(0)}(t)=\langle n|i\rangle$, $i$ is the initial state
7. **First Order Approximation**: $c_n^{(1)}(t)=-\frac{i}{\hbar}\int_{t_0}^t\langle n|\hat V(t')|i\rangle dt'$
8. **Second Order Approximation**: $c_n^{(2)}(t)=\frac{-1}{\hbar^2}\sum_m\int_{t_0}^t\int_{t_0}^{t'}\langle n|\hat V_I(t')|m\rangle\langle m|\hat V_I(t'')|i\rangle dt''dt'$


## 变分法
$$\frac{\langle \tilde{0}|\hat H|\tilde0\rangle}{\langle \tilde{0}|\tilde0\rangle}\geq E_0$$

# 散射理论
- **Scatter Wave Function**: $\psi(\vec{r})=e^{i\vec{k}\cdot\vec{r}}+f(\theta,\phi)\frac{e^{ikr}}{r}$, $f(\theta,\phi)$ is the **scattering amplitude**
- **Differential Cross Section**: $D(\theta,\phi)=|f(\theta,\phi)|^2$
- **Green Function Method**: $\psi(\vec{r})=\phi(\vec{r})+\int_{-\infty}^\infty G_0(k_i,\vec{r}-\vec{r'})V(\vec{r'})\psi(\vec{r'})d\vec{r'}$
- **Green Function**: $G_0(k_i,\vec{r}-\vec{r'})=-\frac{m}{2\pi\hbar^2}\frac{1}{|\vec{r}-\vec{r'}|}e^{\pm ik|\vec{r}-\vec{r'}|}$
- **Operator Form**: $|\psi^+_p\rangle=|k_i\rangle+\hat G_0^+\hat V|\psi^+_p\rangle$
  - $|\psi^+_p\rangle=|k_i\rangle+\hat G_0^+\hat V|k_i\rangle+\hat G_0^+\hat V\hat G_0^+\hat V|k_i\rangle+\cdots=\sum_n (\hat G_0^+\hat V)^n|k_i\rangle$
  - $f(\theta,\phi)=-\frac{4\pi^2m}{\hbar^2}\langle \vec{k_f}|V|\psi^+_p\rangle$
  - $\hat T^+|k_i\rangle=\hat V|\psi^+_p\rangle$
  - $\hat T^+=\hat V+\hat V\hat G_0^+\hat V+\hat V\hat G_0^+\hat V\hat G_0^+\hat V+\cdots$
- **Optical Theorem**: $\frac{k}{4\pi}\sigma_{tot}=\Im [f(\theta=0,\phi=0)]$


