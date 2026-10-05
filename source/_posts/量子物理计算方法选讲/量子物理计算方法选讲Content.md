---
title: 量子物理计算方法选讲Content
date: 2026-09-15 10:00:00
tags: 量子物理计算方法选讲
categories: 量子物理计算方法选讲
mathjax: true
cover: 
---

本课程为清华大学研究生课程"量子物理计算方法选讲"（Selected Topics in Computational Quantum Physics）。课程的骨架可以概括为"**一个方程 + 四类方法**"：一个方程是定态薛定谔方程 $\hat H|\Psi\rangle = E|\Psi\rangle$；四类方法是精确对角化（ED）、密度矩阵重整化群与矩阵乘积态（DMRG/MPS）、张量网络、量子蒙特卡罗（QMC），另外还会涉及数值重整化群（NRG）、动力学平均场（DMFT）与机器学习等方法。课程聚焦定义在**格点**上的**强关联量子多体系统**。

参考书：
- Fehske, Schneider, Weiße (eds.), *Computational Many-Particle Physics*, LNP 739, Springer (2008)
- Avella, Mancini (eds.), *Strongly Correlated Systems: Numerical Methods*, Springer Series in Solid-State Sciences 176 (2013)
- 背景书：Altland & Simons《Condensed Matter Field Theory》、Sachdev《Quantum Phase Transitions》、Nielsen & Chuang《Quantum Computation and Quantum Information》

# Content:

## 01 导论（第 0 章：量子力学简述、微观格点模型、量子相变、矩阵运算）
- {% post_link '量子物理计算方法选讲/01-课程导论与格点模型' %}

## 02 精确对角化 I（第 1 章上半场：哈密顿量的矩阵表示、对称性、实时演化）
- {% post_link '量子物理计算方法选讲/02-精确对角化' %}

## 03 迭代对角化与谱函数（第 1 章下半场 ED II：变分法、Lanczos、格林函数与谱函数）
- {% post_link '量子物理计算方法选讲/03-迭代对角化与谱函数' %}

## 04 密度矩阵重整化群与矩阵乘积态（第 2 章：DMRG/MPS）

## 05 张量网络（第 3 章：PEPS、MERA、张量网络与拓扑序）

## 06 量子蒙特卡罗（第 4 章：重要性抽样、费米子符号问题、DQMC/PI-QMC/VMC/SSE）

## 07 其它方法（第 5 章：NRG、DMFT、机器学习）

## 08 总结与讨论（第 6 章：普适性与有限尺度标度、方法比较）
