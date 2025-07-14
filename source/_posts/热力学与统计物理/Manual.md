---
title: 热力学关系记忆手册
mathjax: true
date: 2024-08-22 16:02:18
tags: 统计物理
categories: 统计物理
cover:
---
- [偏微分关系](#偏微分关系)
- [热力学基本函数与方程](#热力学基本函数与方程)
- [麦克斯韦关系](#麦克斯韦关系)
  - [图示](#图示)
  - [一阶关系](#一阶关系)
  - [二阶关系](#二阶关系)
- [一阶导处理方法](#一阶导处理方法)
- [二阶导处理](#二阶导处理)
- [所有结果一览](#所有结果一览)
  - [常数](#常数)
  - [$S$](#s)
  - [$U$](#u)
  - [$H$](#h)


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

# 一阶导处理方法
对于自由度为2的系统，有自变量$a,b$和因变量$X,Y,Z$，均可以做一下预处理。

- **三阶**$(\dfrac{\partial X}{\partial Y})_Z$
$$(\dfrac{\partial X}{\partial Y})_Z=(\dfrac{\partial X}{\partial a})_Z(\dfrac{\partial a}{\partial Y})_Z$$
- **二阶**$(\dfrac{\partial X}{\partial Y})_a$
$$(\dfrac{\partial X}{\partial Y})_a=(\dfrac{\partial X}{\partial b})_a(\dfrac{\partial b}{\partial Y})_a$$
- **二阶**$(\dfrac{\partial X}{\partial a})_Y$
$$(\dfrac{\partial X}{\partial a})_Y=(\dfrac{\partial X}{\partial a})_b+(\dfrac{\partial X}{\partial b})_a(\dfrac{\partial b}{\partial a})_Y$$
- **一阶**$(\dfrac{\partial b}{\partial a})_X$
$$(\dfrac{\partial b}{\partial a})_X=-(\dfrac{\partial b}{\partial X})_a(\dfrac{\partial X}{\partial a})_b$$

通过这样的办法，可以将所有的式子转换为一阶表达式

![alt text](\img\热力学\image.png)


# 二阶导处理
$$(\dfrac{\partial C_V}{\partial V})_T=T(\dfrac{\partial^2 S}{\partial V\partial T})=T(\dfrac{\partial^2 S}{\partial T\partial V})=T(\dfrac{\partial^2 p}{\partial T^2})_V$$
$$(\dfrac{\partial C_P}{\partial p})_T=T(\dfrac{\partial^2 S}{\partial p\partial T})=T(\dfrac{\partial^2 S}{\partial T\partial p})=-T(\dfrac{\partial^2 V}{\partial T^2})_p$$

# 所有结果一览

一般在化简的时候有技巧可循：如果你的形式是热力学函数偏两个自变量，那么四个热力学函数中总有对应的自变量组：
$$U\rightarrow S,V$$
$$H\rightarrow S,p$$
$$F\rightarrow T,V$$
$$G\rightarrow T,p$$

另一种方法是采用全微分的办法；或者用偏微分关系。

## 常数

1. 体积膨胀系数：$\alpha=\frac1V\left(\frac{\partial V}{\partial T}\right)_p$
2. 压强系数：$\beta=\frac1p\left(\frac{\partial p}{\partial T}\right)_V$
3. 等温压缩系数：$\kappa_T=-\frac1V\left(\frac{\partial V}{\partial P}\right)_T$
4. 等容热容：$C_V=(\dfrac{\partial U}{\partial T})_V(definition)=T(\dfrac{\partial S}{\partial T})_V$
5. 等压热容：$C_P=(\dfrac{\partial H}{\partial T})_p(definition)=T(\dfrac{\partial S}{\partial T})_p$

> 三者满足关系：
> $$\left(\frac{\partial V}{\partial T}\right)_p\left(\frac{\partial p}{\partial T}\right)_V\left(\frac{\partial V}{\partial P}\right)_T=-1\Rightarrow \alpha=\kappa_T\beta p$$
> 二者满足的关系：
> $$C_P-C_V=T(\dfrac{\partial S}{\partial T})_p-T(\dfrac{\partial S}{\partial T})_V=T(\dfrac{\partial p}{\partial T})_V(\dfrac{\partial V}{\partial T})_p=-T(\dfrac{\partial p}{\partial V})_T$$


## $S$
由于热力学函数对S的偏导可以全部转化为TPV对S的偏导，这里整合到下面。

$$\begin{aligned}
(\frac{\partial S}{\partial P})_T&=-(\frac{\partial V}{\partial T})_P\\
(\frac{\partial S}{\partial V})_T&=(\frac{\partial P}{\partial T})_V\\
(\frac{\partial S}{\partial T})_V&=(\frac{\partial S}{\partial U})_V(\frac{\partial U}{\partial T})_V=\frac{C_V}{T}\\
(\frac{\partial S}{\partial P})_V&=(\frac{\partial S}{\partial T})_V(\frac{\partial T}{\partial P})_V=\frac{C_V}{T}(\frac{\partial T}{\partial P})_V\\
(\frac{\partial S}{\partial T})_P&=(\frac{\partial S}{\partial H})_P(\frac{\partial H}{\partial T})_P=\frac{C_P}{T}\\
(\frac{\partial S}{\partial V})_P&=(\frac{\partial S}{\partial T})_P(\frac{\partial T}{\partial V})_P=\frac{C_P(\frac{\partial T}{\partial V})_P}{T}\\
\end{aligned}$$

## $U$

$$\begin{aligned}
(\frac{\partial U}{\partial T})_V&=C_V\\
(\frac{\partial U}{\partial V})_T&=(\frac{\partial [F+TS]}{\partial V})_T=T(\frac{\partial P}{\partial T})_V-P\\
(\frac{\partial U}{\partial T})_P&=(\frac{\partial [H-PV]}{\partial V})_T=C_P-P(\frac{\partial V}{\partial T})_P\\
(\frac{\partial U}{\partial P})_T&=(\frac{\partial [G+TS-PV]}{\partial V})_T=-P(\frac{\partial V}{\partial P})_T-T(\frac{\partial V}{\partial T})_P\\
(\frac{\partial U}{\partial P})_V&=(\frac{\partial U}{\partial T})_V(\frac{\partial T}{\partial P})_V=C_V(\frac{\partial T}{\partial P})_V\\
(\frac{\partial U}{\partial V})_P&=(\frac{\partial [H-PV]}{\partial T})_P(\frac{\partial T}{\partial V})_P=C_P(\frac{\partial T}{\partial V})_P-P\\
\end{aligned}$$

> 当然可以配合$\alpha,\beta,\kappa_T$进一步简写，不过就没什么必要了。


## $H$
H和U对偶，相当于把$C_V$和$C_P$，$V$和$P$对换，不过注意符号。

$$\begin{aligned}
(\frac{\partial H}{\partial T})_P&=C_P\\
(\frac{\partial H}{\partial P})_T&=-T(\frac{\partial V}{\partial T})_P+V\\
(\frac{\partial H}{\partial T})_V&=C_V+V(\frac{\partial P}{\partial T})_V\\
(\frac{\partial H}{\partial V})_T&=V(\frac{\partial P}{\partial V})_T+T(\frac{\partial P}{\partial T})_V\\
(\frac{\partial H}{\partial V})_P&=C_P(\frac{\partial T}{\partial V})_P\\
(\frac{\partial H}{\partial P})_V&=C_V(\frac{\partial T}{\partial P})_V+V\\
\end{aligned}$$