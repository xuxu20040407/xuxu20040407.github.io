---
title: First-Encounter
mathjax: true
date: 2025-03-12 22:28:27
tags:
categories:
cover:
---

本教程参考了[SIESTA官方文档](https://docs.siesta-project.org/projects/siesta/en/stable/tutorials/00-TutorialSetup.html)。

# First-Encounter

## fdf Format

SIESTA的输入文件是一个文本文件，通常以`.fdf`为后缀。这个文件包含了所有的输入参数，包括计算的类型、晶胞参数、原子位置、计算方法等等。这个文件的格式是自由格式，可以包含注释，注释以`#`开头。下面是一个简单的例子`ch4.fdf`：

- 系统描述
```fdf
SystemName          CH4 molecule
SystemLabel         ch4
NumberOfAtoms       5
NumberOfSpecies     2
```

- 化学物种
```fdf
%block ChemicalSpeciesLabel
 1  6 C   # Species index, atomic number, species label
 2  1 H   # Species index, atomic number, species label
%endblock ChemicalSpeciesLabel
```

- 原子坐标
```fdf
AtomicCoordinatesFormat  Ang
%block AtomicCoordinatesAndAtomicSpecies
  1  0.000000  0.000000  0.000000  1
  2  0.000000  0.000000  1.089000  2
  3  1.026719  0.000000 -0.363000  2
  4 -0.513360 -0.889165 -0.363000  2
  5 -0.513360  0.889165 -0.363000  2
%endblock AtomicCoordinatesAndAtomicSpecies
```

- 晶格参数
```fdf
#Unit cell for the calculation
LatticeConstant 15 Ang
%block LatticeVectors
  1.000 0.000 0.000
  0.000 1.000 0.000
  0.000 0.000 1.000
%endblock LatticeVectors
```

- 基组
```fdf
# Basis set definition
PAO.EnergyShift 250 meV
PAO.SplitNorm   0.15
PAO.BasisSize   SZ
```
> PAO.BasisSize：
> - SZ: Single-zeta basis set (s+p)
> - DZ: Double-zeta basis set
> - SZP: Single-zeta polarized basis set
> - DZP: Double-zeta polarized basis set
> - TZP: Triple-zeta polarized basis set



- 计算参数
```fdf
#Real space grid
MeshCutoff 125.0 Ry
```

> 利用公式$E=\frac{h^2}{8m_ed^2}$，可以计算出以下常用的MeshCutoff：
> - 300Ry: 0.096 Angstrom
> - 200eV: 0.354 Angstrom
> - 520Ry: 0.269 Angstrom
>
> $1Ry=13.6057eV=2.17987\times 10^{18}J$

- 计算控制
```fdf
# Convergence of SCF
MaxSCFIterations 50
DM.MixingWeight 0.4
DM.NumberPulay  2
```

- 计算方法
```fdf
# Type of solution
SolutionMethod diagon
```

## psf Format

`.psf`文件是赝势（pseudopotential）文件，包含了原子核和电子之间的相互作用。



## RUN SIESTA

```bash
siesta <ch4.fdf> ch4.out
```


## out Format

SIESTA的输出文件是一个文本文件，通常以`.out`为后缀。这个文件包含了计算的结果。下面是一个简单的例子`ch4.out`：

- Header：SIESTA 的版本号、编译器版本和编译选项
- Input File：输入文件的内容
- Details on the basis set generation：基组的生成和赝势
- Total energy decomposition and forces, and stress:能量的构成和力学性质

# First-Encounter-theorylevel
## Pseudopotentials
在 SIESTA 中，选择合适的赝势（pseudopotential）是影响计算精度和效率的关键因素之一。赝势通常以`.psf`或`.psml`格式的外部文件提供。

## fdf Modifications
选择相应的赝势需要在`.fdf`文件中进行相应的指定，包括：
- ChemicalSpeciesLabel block
```fdf
%block ChemicalSpeciesLabel
 1  6 C.gga   # Species index, atomic number, species label
 2  1 H.gga   # Species index, atomic number, species label
%endblock ChemicalSpeciesLabel
```
- Exchange-correlation functional
```fdf
XC.functional  GGA
XC.authors    PBE
```

对比：
| Pseudopotentials | Total Energy (eV) | Runtime (s) |
| :------------ | :---------------- | :---------- |
| LDA               | -216.514681           | 9.500       |
| GGA               | -217.482725           | 9.527       |

# Try

## Change PAO.BasisSize

| PAO.BasisSize | Total Energy (eV) | Runtime (s) |
| :------------ | :---------------- | :---------- |
| SZ            | -214.704321           | 2.136         |
| DZ            | -215.973123           | 3.156         |
| TZ            | -216.076327           | 3.304         |
| SZP           | -215.002556           | 3.304         |
| DZP           | -216.477078           | 18.114        |
| TZP           | -216.168898           | 19.244         |

## Change MeshCutoff

| MeshCutoff (Ry) | Total Energy (eV) | Runtime (s) |
| :-------------- | :---------------- | :---------- |
| 75              | -214.707126           |  1.837         |
| 125             | -214.704321           | 2.136         |
| 250             | -214.704137           | 3.359         |



## Change EnergyShift

BasisSize: DZP

| EnergyShift (meV) | Total Energy (eV) | Runtime (s) |
| :---------------- | :---------------- | :---------- |
| 250               | -216.514681           | 9.500       |
| 100               | -216.742603           | 9.996      |
| 50                | -216.766565           | 10.154      |
| 10                | -216.755123           | 11.480      |


## Change SplitNorm

| SplitNorm  | Total Energy (eV) | Runtime (s) |
| :---------------- | :---------------- | :---------- |
| 0.20               | -216.543082           | 9.706      |
| 0.15               | -216.514681           | 9.500       |
| 0.10               | -216.399940           | 9.488      |

## Close SoftDefault
`PAO.SoftDefault`用软约束的方法优化基组，使得截断处更加平滑。

| SoftDefault  | Total Energy (eV) | Runtime (s) |
| :---------------- | :---------------- | :---------- |
| False              | -217.573318           | 10.535      |
| Ture               | -216.514681           | 9.500       |




# Conclusion

- 完整的项目至少包含以下几个文件：`.fdf`、`.psf` or `.psml`
- 运行`siesta <ch4.fdf> ch4.out`，查看输出文件`ch4.out`，检查计算结果
- 通过修改`.fdf`文件中的参数，可以调整计算的精度和效率
  - `PAO.BasisSize`：基组的大小
  - `MeshCutoff`：网格精度
  - `PAO.EnergyShift`：原子轨道的能量范围
  - `PAO.SplitNorm`：原子轨道的分裂参数
- 还可以选择不同的赝势和交换相关泛函
  - `LDA`：局域密度近似
  - `GGA`：广义梯度近似