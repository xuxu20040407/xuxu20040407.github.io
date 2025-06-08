---
title: 前言
date: 2024-08-12 22:34:22
tags: 电动力学
categories: 电动力学
---

# 电动力学Content
电动力学是研究电磁现象的学科，主要包括电磁学和电动力学两个部分。主要参考教
材为格里菲斯的《电动力学导论》。

- {% post_link '电动力学/矢量分析初步' %}
- {% post_link '电动力学/静电学' %}
- {% post_link '电动力学/静磁学' %}
- {% post_link '电动力学/电磁感应' %}
- {% post_link '电动力学/麦克斯韦方程组' %}
- {% post_link '电动力学/电磁波' %}
- {% post_link '电动力学/电磁波的辐射' %}
- {% post_link '电动力学/相对论' %}

大体上讲，电磁学唯像地归纳出麦克斯韦方程组，而电动力学则是从麦克斯韦方程组出发，研究电磁现象的规律。从麦克斯韦方程组出发，可以对以上目录进行分类：

1. $\nabla\cdot\vec{E}=\dfrac{\rho}{\varepsilon_0}$：静电学
2. $\nabla\cdot\vec{B}=0,\nabla\times\vec{B}=\mu_0 \vec{J}$：静磁学
3. $\nabla\times\vec{E}=-\dfrac{\partial \vec{B}}{\partial t},\nabla\times\vec{B}=\mu_0 \vec{J}+\mu_0\varepsilon_0\dfrac{\partial \vec{E}}{\partial t}$：电磁感应
4. $\nabla^2\vec{E}=\mu_0\varepsilon_0\dfrac{\partial^2 \vec{E}}{\partial t^2}, \nabla^2\vec{B}=\mu_0\varepsilon_0\dfrac{\partial^2 \vec{B}}{\partial t^2}$：电磁波
5. $\vec{B}=\nabla\times\vec{A}, \vec{E}=-\nabla\varphi-\dfrac{\partial \vec{A}}{\partial t}$：规范变换和电磁波的辐射