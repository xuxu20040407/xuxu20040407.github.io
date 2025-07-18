---
title: 固体物理Content
mathjax: true
date: 2025-02-22 09:08:42
tags: 固体物理
categories: 固体物理
cover:
---

本专题参照Kittle的《固体物理学导论》和胡安的《固体物理学》。

# 固体物理Content

- {% post_link '固体物理/晶体结构' %}
- {% post_link '固体物理/晶体的结合' %}
- {% post_link '固体物理/晶格动力学' %}
- {% post_link '固体物理/金属电子论' %}
- {% post_link '固体物理/能带论' %}
- {% post_link '固体物理/Bloch电子动力学' %}

研究固体的物理学性质，首先得从其几何学性质出发，这是我们研究 {% post_link '固体物理/晶体结构' %} 的原因。晶体学可以作为一门专门的学科，结合群论来研究。

从经典图像可以得到 {% post_link '固体物理/晶体的结合' %} ：

我们知道固体的量子力学描述实质上是一个多体问题。假设有N个离子实和NZ个电子，系统的哈密顿量可以写成：
$$H=\underbrace{\sum_i\frac{\vec{p_i}^2}{2m_e}}_{\text{电子动能}}+\underbrace{\sum_n\frac{\vec{p_n}^2}{2M_n}}_{\text{离子实动能}}+\underbrace{\frac12\sum_{i\neq j}\frac{e^2}{|\vec{r_i}-\vec{r_j}|}}_{\text{电子电子相互作用}}+\underbrace{\frac12\sum_{n\neq m}\frac{Z_nZ_m e^2}{|\vec{R_n}-\vec{R_m}|}}_{\text{离子实相互作用}}+\underbrace{\sum_{i,n}\frac{eZ_n}{|\vec{r_i}-\vec{R_n}|}}_{\text{电子离子相互作用}}$$
其中$i=1,\cdots,NZ,n=1,\cdots,N$。可以发现三个相互作用项时最为复杂的，因此我们需要对其进行简化。在绝热近似下，电子在任意离子偏移下能迅速变为本征态，因而可以等效研究固定离子实下的电子的运动。离子的哈密顿量为：
$$H_n=\sum_n\frac{\vec{p_n}^2}{2M_n}+\frac12\sum_{n\neq m}\frac{Z_nZ_m e^2}{|\vec{R_n}-\vec{R_m}|}$$
因而可以忽略电子求解声子的运动： {% post_link '固体物理/晶格动力学' %} 。

绝热近似中电子离子相互作用被归为电子的哈密顿项：
$$H_e=\sum_i\frac{\vec{p_i}^2}{2m_e}+\frac12\sum_{i\neq j}\frac{e^2}{|\vec{r_i}-\vec{r_j}|}+\sum_n\frac{eZ_n}{|\vec{r_i}-\vec{R_n}|}$$

如果不考虑电子电子相互作用和电子离子相互作用，则电子的行为类似金属中退局域的电子，可以建立**Drude模型**和**Sommerfeld模型**，推导出 {% post_link '固体物理/金属电子论' %} 中的一些性质。

在 {% post_link '固体物理/能带论' %} 中通过单电子近似和周期场近似变为周期势场，进一步在**近自由电子近似**或**紧束缚近似**下求解问题。在 {% post_link '固体物理/Bloch电子动力学' %} 中介绍电子从经典模型到**半经典模型**的描述转变。

以上考虑的都是零级近似（即离子实固定在平衡位置下）的电子结果，如果考虑一级近似，可以推出更广泛的结论。

