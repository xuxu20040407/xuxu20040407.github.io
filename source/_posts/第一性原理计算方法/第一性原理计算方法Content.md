---
title: 第一性原理计算方法Content
date: 2026-09-15 11:00:00
tags: 第一性原理计算方法
categories: 第一性原理计算方法
mathjax: true
cover: 
---

本课程为清华大学物理系王冲（Chong Wang）老师的研究生课程《Lectures on First-Principles Calculations》（第一性原理计算方法）。课程主线参考 R. M. Martin 的 *Electronic Structure: Basic Theory and Practical Methods*，从多体薛定谔方程出发，讲清楚密度泛函理论（DFT）及其第一性原理计算的前因后果，包括 Hartree-Fock 近似、Hohenberg-Kohn 定理、Kohn-Sham 方程、交换关联泛函等，并配套两个编程项目（HF / KS 的玩具模型代码）与文献综述展示。考核方式：编程项目 50% + 文献综述与展示 50%。

先修要求：量子力学、固体物理。参考书（以 R. Martin 的 *Electronic Structure* 为主，其余为背景）：
- R. M. Martin, *Electronic Structure: Basic Theory and Practical Methods*（主教材）
- 背景参考：量子多体/场论与数值方法类经典教材

# Content:

## 理论速成参考（整合自旧 DFT 笔记）

- {% post_link '第一性原理计算方法/DFT基础' %}

一篇浓缩的多电子系统→DFT 理论框架，涵盖 Born-Oppenheimer、Hartree/Hartree-Fock、HK 定理、Thomas-Fermi-Dirac、Kohn-Sham 方程与交换关联泛函天梯，可作为课程前期各讲的速查底稿。

## 01 引言（Introduction）

- {% post_link '第一性原理计算方法/01-引言' %}

课程信息、指数墙、DFT 的基本思想、涌现物理与课程大纲。

## 02 历史概览（Historical Overview）

- {% post_link '第一性原理计算方法/02-历史概览' %}

电子结构是什么、量子统计、独立电子近似与能带论、定量计算的兴起、电子关联（交换能、Hund 定则、Mott 绝缘体、Hubbard 模型）。

## 03 Born-Oppenheimer 近似（Born-Oppenheimer Approximation）

- {% post_link '第一性原理计算方法/03-Born-Oppenheimer近似' %}

Hellmann-Feynman 定理、BO 近似的严格推导（非绝热耦合、奇异微扰）、BO 有效哈密顿量与 Berry 联络、Landau-Zener 隧穿、非绝热分子动力学。

## 04 二次量子化（Second Quantization）

- {% post_link '第一性原理计算方法/04-二次量子化' %}

置换对称性、Fock 空间与产生/湮灭算符、单体/两体算符、费米子与 Slater 行列式、紧束缚模型与 Hubbard 模型。

## 05 Hartree-Fock 近似（Hartree-Fock Approximation）

- {% post_link '第一性原理计算方法/05-Hartree-Fock近似' %}

Wick 定理、HF 自洽循环、HF 能量的物理意义、实空间 HF 方程、均匀电子气应用、局域稳定性。

## 编程项目（一）：Hartree-Fock 代码（Hartree-Fock Coding Project）

（略——二维晶格 Hubbard 模型的 HF 自洽计算，含三角格子的 120° 反铁磁序。）

## 06 密度泛函理论基础（Density Functional Theory Foundations）

- {% post_link '第一性原理计算方法/06-密度泛函理论基础' %}

Thomas-Fermi 理论、Slater Xα、Hohenberg-Kohn 定理、Levy-Lieb 表述、自旋 DFT 等扩展、Kato 尖点、密度的可表示性、Lieb 泛函与分数粒子数。

## 07 Kohn-Sham 方程（Kohn-Sham）

- {% post_link '第一性原理计算方法/07-Kohn-Sham方程' %}

KS 形式主义、两条推导路径、Janak 定理与分数占据、自旋极化 KS、电离势、基态能隙与交换关联泛函的导数不连续。

## 编程项目（二）：Kohn-Sham 代码（Kohn-Sham Coding Project）

（略——一维谐振子势中电子的 KS 自洽计算，交换-only LDA。）

## 08 交换关联泛函（Exchange-Correlation Functional）

- {% post_link '第一性原理计算方法/08-交换关联泛函' %}

精确交换与自相互作用、E_xc 的精确表示（响应函数、KS 微扰论、绝热连接、交换关联空穴）、Jellium 模型、RPA、Wigner 晶体、LDA 与 LSDA。

## 09 交换关联泛函（二）（Exchange-Correlation Functional II）

- {% post_link '第一性原理计算方法/09-交换关联泛函II' %}

弱非均匀电子气、梯度展开、广义梯度近似（GGA）、交换关联空穴的精确关系、Langreth-Mehl 与 PBE。
