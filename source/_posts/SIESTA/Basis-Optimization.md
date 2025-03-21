---
title: Basis-Optimization
mathjax: true
date: 2025-03-12 22:28:27
tags:
categories:
cover:
---

# Cardinality

基组的基数（Cardinality）是指基组中的基函数的数量。对于碳原子：
- SZ(Singer-Zeta): 2s+3*2p=4
- DZ(Double-Zeta): (2s+3*2p)*2=8
- TZ(Triple-Zeta): (2s+3*2p)*3=12
- QZ(Quadruple-Zeta): (2s+3*2p)*4=16
- SZP(Singer-Zeta Plus Polarization): 2s+3*2p+5*2d=9
- DZP(Double-Zeta Plus Polarization): (2s+3*2p)*2+5*2d=13

SIESTA的计算成本和基组的基数的三次方成正比，因此在选择基组时需要权衡计算成本和计算精度。

# Cut-off Radii

截止半径（Cut-off Radii）是指在计算中，对于原子核和电子之间的相互作用，只考虑距离小于截止半径的部分。截止半径的选择会影响计算的精度和计算成本。
- 对于SZ基组，截止半径意味着更远的地方为0
- 对于多$\zeta$基组，截止半径意味着更远的地方等同第一$\zeta$函数

# Basis Enthalpy

基组焓（Basis Enthalpy）用于评估基组的大小是否合理：
$$H=PV$$
其中$P$是虚构的压力，一般取0.2GPa，$V$是轨道体积。对于小原子，可以取$P=0.02GPa$。

> 另一种办法是用玻尔半径来判断轨道是否足够大：一般小于5Bohr的轨道太小，而大于10Bohr的轨道太大。

# Take Water as an Example

不同于选择基组，我们可以自定义基组的大小：

```fdf
%block PAO.Basis
  H 1
    n=1 0 2 P 1     # n, l (=0, s-orbital), number of zetas, include 1 set of polarization orbitals
        0.0 0.0     # rcut for first zeta, rmatch for second zeta
  O 2               # Number of different l
    n=2 0 2         # n, l (=0, s-orbital), number of zetas
        0.0 0.0     # rcut for first zeta, rmatch for second zeta
    n=2 1 2 P 1     # n, l (=1, p-orbital), number of zetas, include 1 set of polarization orbitals
        0.0 0.0     # rcut for first zeta, rmatch for second zeta
%endblock PAO.Basis
```

这个例子中，氢原子采用了两个$n=1,l=0$的轨道，并添加了极化轨道（1p轨道）；氧原子采用了两个$n=2,l=0$的轨道和两个$n=2,l=1$的轨道，并添加了极化轨道（2d轨道）。所以等同于DZP基组。

下面的截止半径设为0，意思为让SIESTA程序自动设置。

## Optimizing the first-zeta cutoff radii

```fdf
%block PAO.Basis
  H 1
    n=1 0 2 P 1     # n, l (=0, s-orbital), number of zetas, include 1 set of polarization orbitals
        *0.0* 0.0     # rcut for first zeta, rmatch for second zeta
  O 2               # Number of different l
    n=2 0 2         # n, l (=0, s-orbital), number of zetas
        *0.0* 0.0     # rcut for first zeta, rmatch for second zeta
    n=2 1 2 P 1     # n, l (=1, p-orbital), number of zetas, include 1 set of polarization orbitals
        *0.0* 0.0     # rcut for first zeta, rmatch for second zeta
%endblock PAO.Basis
```

