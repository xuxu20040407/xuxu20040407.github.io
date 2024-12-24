---
title: Scattering-Theory
mathjax: true
date: 2024-12-23 14:18:35
tags: 量子力学2
categories: 量子力学2
cover:
---


# Classic Scattering Theory

## Differential Cross Section
<img src=/img/量子力学2/image.png width="300" height="300" alt="Scattering Geometry" align=center />
微分散射截面定义为：
$$D(\theta)=\frac{d\sigma}{d\Omega}$$
其中$d\sigma$是单位立体角$d\Omega$内的散射截面。显然，微分散射截面是一个碰撞参数$b$或角度$\theta$的函数。其中：
$$d\sigma =4\pi bdb,d\Omega=4\pi \sin\theta d\theta$$
所以：
$$D(\theta)=\frac{d\sigma}{d\Omega}=\frac{b}{\sin\theta}|\frac{db}{d\theta}|$$


## Rigid Sphere Scattering

对于刚球，即无限高势垒：
$$b=R\sin{\frac{\theta}{2}}$$
得到：
$$D(\theta)=\frac{R^2}{4}$$
积分得到：
$$\sigma=\pi R^2$$
这和我们的直觉是相符的，即总的散射截面就是球本身截面面积。


## Rutherford Scattering
代入：
$$b=\frac{Z_1Z_2e^2}{4\pi\epsilon_0E}\cot{\theta}$$

得到：
$$D(\theta)=\frac{Z_1^2Z_2^2e^4}{4\pi^2\epsilon_0^2E^2}\csc^4{\frac{\theta}{2}}$$

积分发现该积分发散，这是由于在小角度的不匹配导致的。

# Quamtum Scattering Theory

用微扰理论求解散射问题。根据费米黄金规则：
$$W_{in}=\frac{2\pi}{\hbar}|<n|V|i>|^2\delta(E_n-E_i)$$
为了