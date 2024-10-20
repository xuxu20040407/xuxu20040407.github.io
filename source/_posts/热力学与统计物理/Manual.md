---
title: 热力学关系记忆手册
mathjax: true
date: 2024-08-22 16:02:18
tags: 
- 热力学
categories: 统计物理
cover:
---
- [偏微分关系](#偏微分关系)
- [热力学基本函数与方程](#热力学基本函数与方程)
- [麦克斯韦关系](#麦克斯韦关系)
  - [图示](#图示)
  - [一阶关系](#一阶关系)
  - [二阶关系](#二阶关系)


# 偏微分关系
- **倒易关系**：$(\dfrac{\partial x}{\partial y})_z(\dfrac{\partial y}{\partial x})_z=1$
- **循环关系**：$(\dfrac{\partial x}{\partial y})_z(\dfrac{\partial y}{\partial z})_x(\dfrac{\partial z}{\partial x})_y=-1$
- **复合关系1**：$(\dfrac{\partial x}{\partial y})_w(\dfrac{\partial y}{\partial z})_w=(\dfrac{\partial x}{\partial z})_w$
- **复合关系2**：$(\dfrac{\partial x}{\partial y})_w=(\dfrac{\partial x}{\partial y})_z+(\dfrac{\partial x}{\partial z})_y(\dfrac{\partial z}{\partial y})_w$

# 热力学基本函数与方程


$$H=U+pV$$
$$F=U-TS$$
$$G=H-TS$$
$$dU=TdS-pdV$$
$$dH=TdS+Vdp$$
$$dF=-SdT-pdV$$
$$dG=-SdT+Vdp$$


# 麦克斯韦关系

## 图示

$$\begin{matrix}
G&p&H\\
T&&S\\
F&-V&U
\end{matrix}$$

## 一阶关系

$$\begin{aligned}\left(\frac{\partial G}{\partial T}\right)_p&=\left(\frac{\partial F}{\partial T}\right)_V=-S\\\left(\frac{\partial G}{\partial p}\right)_T&=\left(\frac{\partial H}{\partial p}\right)_S=V\\\left(\frac{\partial H}{\partial S}\right)_p&=\left(\frac{\partial U}{\partial S}\right)_V=T\\\left(\frac{\partial U}{\partial V}\right)_S&=\left(\frac{\partial F}{\partial V}\right)_T=-p\end{aligned}$$

## 二阶关系

$$(\frac{\partial T}{\partial V})_{S}=-(\frac{\partial p}{\partial S})_{V}$$
$$(\frac{\partial T}{\partial p})_{S}=(\frac{\partial V}{\partial S})_{p}$$
$$(\frac{\partial S}{\partial V})_{T}=(\frac{\partial p}{\partial T})_{V}$$

$$(\frac{\partial S}{\partial P})_{T}=-(\frac{\partial V}{\partial T})_{P}$$




1. 体积膨胀系数：$\alpha=\frac1V\left(\frac{\partial V}{\partial T}\right)_p$
2. 压强系数：$\beta=\frac1p\left(\frac{\partial p}{\partial T}\right)_V$
3. 等温压缩系数：$\kappa_T=-\frac1V\left(\frac{\partial V}{\partial P}\right)_T$

三者满足关系：
$$\left(\frac{\partial V}{\partial T}\right)_p\left(\frac{\partial p}{\partial T}\right)_V\left(\frac{\partial V}{\partial P}\right)_T=-1\Rightarrow \alpha=\kappa_T\beta p$$

