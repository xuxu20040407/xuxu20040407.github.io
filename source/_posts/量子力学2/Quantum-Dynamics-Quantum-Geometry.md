---
title: Quantum Dynamics & Quantum Geometry
mathjax: true
date: 2024-08-15 10:56:17
tags: 量子力学2
categories: 量子力学2
cover:
---


# Evolution Operator

# Heisenberg Picture

考虑一个自由运动的粒子：
$$\hat H =\frac{\hat p^2}{2m}$$

$$\frac{d\hat p}{dt}=0\Rightarrow \hat p(t)=\hat p(0)$$
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}\Rightarrow \hat x(t)=\hat x(0) +\frac{\hat p(0)}{m}t$$
所以：
$$[\hat x(t),\hat x(0)]=\frac{-i\hbar t}{m}\Rightarrow \Delta\hat x(t)\Delta\hat x(0)\geq \frac{\hbar t}{2m}$$


对于势场中的粒子：
$$\frac{d\hat x}{dt}=\frac{\hat p(0)}{m}$$
$$\frac{d^2\hat x}{dt^2}=-\frac{\vec\nabla\hat V(\vec x)}{m}$$
$$m\frac{d^2\langle\hat x\rangle}{dt^2}=-\langle\vec\nabla\hat V(\vec x)\rangle$$


# Harmonic Oscillator and Coherence State

## 谐振子

## 相干态
湮灭算符的本征右矢定义为相干态：
$$\hat a|\lambda\rangle=\lambda |\lambda\rangle$$

$$|\lambda\rangle=e^{\frac{-|\lambda|^2}{2}}e^{\lambda \hat a^\dagger}|0\rangle$$

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