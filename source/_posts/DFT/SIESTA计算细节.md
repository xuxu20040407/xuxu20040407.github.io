---
title: SIESTA计算细节
mathjax: true
date: 2025-03-07 12:21:39
tags: DFT
categories: DFT
cover:
---
主要程序：
- VASP：平面波基组
- Quantum Espresso：平面波
- wien2k：算的特别准，但是计算量大，用的是平面波加原子基组，活在Benchmark里面
- Gaussion
- ORCA
- ADF
- pyscf
- SIESTA：原子基组
- FHI-aims：原子基组
- OpenMX
- ABACUS
- AI2DFT

# SIESTA计算细节

## 赝势

基于价电子近似，赝势方法将价电子和芯层电子分开处理，将芯层电子的作用用赝势来模拟，从而减少计算量。主要有以下三种赝势：
- Norm-conserving赝势：保证赝势和真实势在某个截断半径内的积分相等；
- Ultrasoft赝势：放松模守恒的限制，计算效率更高；
- PAW赝势：通过算符将快速振荡部分平滑。

[PAW](https://zhuanlan.zhihu.com/p/575479762)

不同的DFT程序支持不同的赝势：


| 软件 | NCPP | USPP | PAW |
| --- | --- | --- | --- |
| VASP | √ | √ | × |
| FHI-aims | √ | × | √ |
| wien2k | √ | × | × |
| SIESTA | √ | × | × |
| GPAW | × | × | √ |
| OpenMX | √ | × | × |
| ABACUS | √ | × | × |


# SIESTA计算细节

## SIESTA总流程

### 哈密顿量的构成

在SIESTA程序中，哈密顿量由以下几项构成：

$$
\hat{H} = \hat{T} + \hat{V}^{NL} + V^{NA}(\vec{r}) + \delta V^H(\vec{r}) + V^{xc}(\vec{r})
$$

- **$\hat{T}$**：电子动能项，由基组的径向函数和球谐函数组成。
- **$\hat{V}^{NL}$**：KB赝势项，描述非局域的电子与原子核的相互作用。
- **$V^{NA}(\vec{r})$**：定域势和从Hartree势中选取的电荷的库仑屏蔽势的组合，用于描述原子的局域电势。
- **$\delta V^H(\vec{r})$**：Hartree势减去之前由于屏蔽的部分，用于描述电子间的库仑相互作用。
- **$V^{xc}(\vec{r})$**：交换关联相互作用项，用于描述电子间的交换和关联效应。

在数值求解过程中，$\delta V^H$ 可以用傅里叶变换求解：

$$
\rho\left(\vec{r}\right) \xrightarrow{FFT} \rho(\vec{G}) \longrightarrow V^H(\vec{G}) \xrightarrow{IFFT} V^H\left(\vec{r}\right)
$$

其中，前两项（动能和KB赝势）涉及双中心积分，后三项（Hartree势、交换关联势和核-核相互作用）涉及三中心积分。只有KB势不参与自洽，而外场势、Hartree势和交换关联势参与自洽。

### 能量的构成

SIESTA程序中，总能量由以下几项构成：

$$
E^{KS} = \sum_{\mu\nu} H_{\mu\nu} \rho_{\nu\mu} - \frac{1}{2} \int V^H(\boldsymbol{r}) \rho(\boldsymbol{r}) \operatorname{d}^3\boldsymbol{r} + \int (\epsilon^{xc}(\boldsymbol{r}) - V^{xc}(\boldsymbol{r})) \rho(\boldsymbol{r}) \operatorname{d}^3\boldsymbol{r} + \sum_{I<J} \frac{Z_IZ_J}{R_{IJ}}
$$

- **第一项**：能带能量，由哈密顿量矩阵元和密度矩阵计算得到。
- **第二项**：Hartree能量，由电子密度计算得到。
- **第三项**：交换关联能量，由交换关联泛函计算得到。
- **第四项**：原子核间的库仑相互作用能量。

### 实球谐函数作为基组的角向部分

SIESTA论文中使用实球谐函数作为基组的⻆向部分，主要是因为实球谐函数在计算上更简单且更通用。实球谐函数能够有效地描述电子的角向分布，同时避免了复数运算的复杂性，从而提高了计算效率。

# 双中心积分

## 双中心积分的应用

在SIESTA程序中，双中心积分主要用于求解以下两个量：

### 1. 电子动能

通过计算基组函数的动能积分，得到电子的动能贡献。动能积分的具体形式为：

$$
T_{\mu\nu} = -\frac{1}{2} \int \nabla \phi_{\mu}(\vec{r}) \cdot \nabla \phi_{\nu}(\vec{r}) \, d^3r
$$

其中，$\phi_{\mu}(\vec{r})$ 和 $\phi_{\nu}(\vec{r})$ 是基组函数。在SIESTA中，基组函数通常选择原子轨道的线性组合，这些轨道是数值求解的径向函数和球谐函数的乘积。通过这种方式，动能积分可以高效地计算，从而得到电子的动能贡献。

### 2. KB赝势

通过计算非局域赝势的投影积分，得到KB赝势的贡献。KB赝势的投影积分形式为：

$$
V_{\mu\nu}^{KB} = \sum_{I} \sum_{lmn} \int \phi_{\mu}(\vec{r}) \hat{V}_{lmn}^{KB} \phi_{\nu}(\vec{r}) \, d^3r
$$

其中，$\hat{V}_{lmn}^{KB}$ 是KB赝势的投影算符。KB赝势通过这些投影算符描述非局域的电子与原子核的相互作用。在SIESTA中，这些投影算符是预先计算并存储的，从而在自洽迭代中高效使用。

双中心积分的重要性在于，它将原本复杂的三中心积分问题简化为双中心积分，从而将计算复杂度从 $O(N^3)$ 降低到 $O(N)$，显著提高了计算效率。

## 径向傅里叶变换与快速傅里叶变换

### 径向傅里叶变换

双中心积分中的数值积分部分可以用“径向傅里叶变换”描述。具体来说，将overlap matrix用k空间的波函数表示，求解k空间波函数用球谐函数的表达式及展开系数。这些计算可以通过快速傅里叶变换（FFT）算法实现，从而进一步提高计算效率。

### 快速傅里叶变换

在SIESTA中，FFT主要用于以下几个方面：

1. **Hartree势的计算**：通过将电子密度 $\rho(\vec{r})$ 进行傅里叶变换，计算其在k空间的表示 $\rho(\vec{G})$，然后计算Hartree势 $V^H(\vec{G})$，再通过逆傅里叶变换得到实空间的Hartree势 $V^H(\vec{r})$：

$$
\rho\left(\vec{r}\right) \xrightarrow{FFT} \rho(\vec{G}) \longrightarrow V^H(\vec{G}) \xrightarrow{IFFT} V^H\left(\vec{r}\right)
$$

2. **电子动能的计算**：通过将基组函数 $\phi_{\mu}(\vec{r})$ 和 $\phi_{\nu}(\vec{r})$ 进行傅里叶变换，计算其在k空间的表示 $\phi_{\mu}(\vec{k})$ 和 $\phi_{\nu}(\vec{k})$，然后计算动能积分 $T_{\mu\nu}$：

$$
T_{\mu\nu} = -\frac{1}{2} \int \vec{k}^2 \phi_{\mu}(\vec{k})^* \phi_{\nu}(\vec{k}) \, d^3k
$$

3. **KB赝势的计算**：通过将投影算符 $\hat{V}_{lmn}^{KB}$ 进行傅里叶变换，计算其在k空间的表示，然后计算KB赝势的投影积分 $V_{\mu\nu}^{KB}$。

### 具体实现

在SIESTA中，这些傅里叶变换的实现主要通过以下步骤：

1. **初始化**：设置初始的电子密度和基组函数。
2. **傅里叶变换**：使用FFT将电子密度和基组函数从实空间变换到k空间。
3. **计算k空间的物理量**：在k空间中计算Hartree势、电子动能和KB赝势。
4. **逆傅里叶变换**：使用IFFT将k空间的物理量变换回到实空间。
5. **自洽迭代**：将计算得到的物理量用于更新哈密顿量和电子密度，直到收敛。

通过这些步骤，SIESTA能够高效地计算双中心积分，从而在处理大型体系时保持计算复杂度为 $O(N)$。

## 实空间积分

### 截断与格点密度

与平面波的截断类似，实空间积分使用的格点也可以对应于某能量截断。具体来说，这样间隔的实空间网格能够承载的最⾼频平面波的动能。如果将截断设为300 Ry，对应的实空间格点的间距可以通过以下公式计算：

$$
\Delta r \cdot k_{max} = \pi, \quad E = \frac{k^2}{2} \Rightarrow \Delta r = 0.181 \, \text{a.u.}
$$

### 原⼦基DFT对实空间格点密度的收敛性

原子基DFT对实空间格点密度的收敛性比平面波DFT好，主要原因在于平面波DFT需要更密的格点来拟合核区电子的波函数，从而需要更大的基组。而原子基DFT由于其局域性，可以在更稀疏的格点上达到更高的精度。

### SIESTA与FHI-aims的格点选择

SIESTA程序可以选⽤实空间均匀格点进行数值积分，而FHI-aims程序需要⽤以原⼦为中心的⾮均匀格点（且越接近原⼦核格点越稠密）。这是因为SIESTA的基组函数具有局域性，能够更好地适应均匀格点，而FHI-aims的基组函数需要更精细的格点来描述原子核附近的电子结构。

### Eggbox effect

实空间格点密度有限引起的DFT能量误差常被称为“eggbox effect”。这是因为硬核区波函数或者半核的情况，其空间分布接近一种“egg”，而格点取得实方框，从而导致能量误差。

## 库伦能拆分策略

### 库伦能的拆分

在SIESTA中，库伦能（包括原⼦核-原⼦核的作⽤、原⼦核-电⼦作⽤、电⼦-电⼦Hartree作⽤）进行了以下拆分：

$$
\sum_{I<J} \frac{Z_IZ_J}{R_{IJ}} = \frac{1}{2} \sum_{IJ} U_{IJ}^{local}(R_{IJ}) + \sum_{I<J} \delta U_{IJ}^{local}(R_{IJ}) - \sum_{I} U_{I}^{local}
$$

- **第一项**：来自于原子中扩散离子电荷的相互作用。
- **第二项**：用于修正软离子电荷之间可能存在的重叠。当原子核电荷密度在空间上非常延展时，需要考虑这一项。
- **第三项**：原子的自相互作用，可能是因为电荷分布不是δ函数，需要考虑这些修正。

### 中性原子势的性质

中性原⼦势在基组轨道的极限半径外为0，由填充自由原子价电子占据的第一-ζ基组轨道生成。这种势的主要性质是：

- 在原子的局域区域内，它能够准确描述原子的电势。
- 在局域区域外，它迅速衰减，避免了长程相互作用的计算复杂度。

## 自洽迭代：密度矩阵求解

### 密度矩阵求解公式

在原子基下，密度矩阵求解的主要公式如下：

- **零温**：$\rho_{\mu\nu} = \sum_{i} c_{\mu i}^* c_{\nu i}$
- **有限温**：$\rho_{\mu\nu} = \sum_{i} f_i c_{\mu i}^* c_{\nu i}$

其中，$f_i$ 是占据数，由smearing函数决定。

### 常见的smearing函数形式

在有限温的情形下，哈密顿量本征态的占据数可以是分数，由smearing函数决定。一些常见的smearing函数形式包括：

1. **高斯展宽**：
   $$
   g(E, \sigma) = \frac{1}{\sigma \sqrt{2\pi}} \exp\left(-\frac{E^2}{2\sigma^2}\right)
   $$

2. **洛伦兹展宽**：
   $$
   L(E, \gamma) = \frac{1}{\pi} \frac{\gamma}{E^2 + \gamma^2}
   $$

3. **马洛宁展宽**：
   $$
   \delta(E, \sigma) = \sum_{n=0}^N c_n H_n\left(\frac{E}{\sigma}\right) \exp\left(-\frac{E^2}{2\sigma^2}\right)
   $$

### 化学势的确定

在密度矩阵求解中，化学势的确定方法如下：

- **单k点计算**：化学势通过求解单个k点的电子结构得到。
- **多k点计算**：化学势通过求解多个k点的电子结构并进行BZ积分得到。

### 金属计算中的电⼦温度

在进行金属计算时，通常会将“电⼦温度”调大些，这是因为金属的电子结构复杂，需要更大的温度展宽来更好地描述电子的占据态。

## 交换-关联泛函

### SIESTA支持的交换-关联泛函

SIESTA支持多种交换-关联泛函，包括：

- **局域密度近似（LDA）**：$\epsilon_{xc}^{LDA}(\rho)$
- **广义梯度近似（GGA）**：$\epsilon_{xc}^{GGA}(\rho, \nabla \rho)$

### 实空间交换-关联势的推导

在LDA近似中，交换-关联势可以表示为：

$$
V^{xc}(\vec{r}) = \frac{\delta E^{xc}[\rho]}{\delta \rho(\vec{r})}
$$

其中，$E^{xc}[\rho]$ 是交换-关联能量泛函，具体形式为：

$$
E^{xc}[\rho] = \int \epsilon^{xc}(\rho(\vec{r})) \rho(\vec{r}) \operatorname{d}^3\vec{r}
$$

通过变分原理，可以得到实空间的交换-关联势：

$$
V^{xc}(\vec{r}) = \frac{\partial \epsilon^{xc}(\rho(\vec{r}))}{\partial \rho} \rho(\vec{r})
$$

在实际计算中，SIESTA程序会根据选择的交换-关联泛函，计算相应的交换-关联势，并将其用于自洽迭代中。