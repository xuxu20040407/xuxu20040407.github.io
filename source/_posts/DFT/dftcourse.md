---
title: dftcourse
mathjax: true
date: 2025-04-17 14:24:49
tags:
categories:
cover:
password: password
---

# 服务器连接

选择任一第三方SSH客户端，填写会话信息：
- 主机名（Host Name）：`dftcourse-w003`
- 主机（Host）：`166.111.247.240`
- 端口（Port）：`4399`
- 用户名（User Name）：`dftcourse`
- 密钥

推荐MobaXTerm。

# Linux 系统命令简介


- `ls`：列出目录内容
  - `ls -l`或`ll`：长格式列出目录内容
  - `ls -a`：列出所有文件，包括隐藏文件
- `cd`：更改目录
  - `cd ..`：返回上一级目录
  - `cd ~`：返回用户主目录
  - `cd {path}`：返回指定目录
- `pwd`：显示当前工作目录
- `mkdir`：创建目录
  - `mkdir {dir}`：创建指定目录
  - `mkdir -p {dir1/dir2}`：递归创建目录
- `rm`：删除文件或目录
  - `rm {file}`：删除指定文件
  - `rm -r {dir}`：递归删除目录及其内容
  - `rm -rf {dir}`：强制递归删除目录及其内容
- `cp`：复制文件或目录
  - `cp {source} {destination}`：复制文件
  - `cp -r {source} {destination}`：递归复制目录
- `mv`：移动或重命名文件或目录
  - `mv {source} {destination}`：移动文件或目录
  - `mv {oldname} {newname}`：重命名文件或目录
- `cat`：查看文件内容
  - `cat {file} >> {newfile}`：将文件内容追加到新文件
- `history`：查看命令历史

> `>`是覆盖重定向，`>>`是追加重定向。

- `grep`：搜索文件内容
  - `grep {pattern} {file}`：在文件中搜索指定模式
  - `grep -r {pattern} {dir}`：在目录中递归搜索指定模式
  - `history | grep {str}`：在历史命令中搜索指定字符串
- `chmod`：更改文件权限
  - `chmod {permissions} {file}`：更改文件权限
  - `chmod 755 {file}`：设置文件为可读、可写、可执行
- `sed`：流编辑器
  - `sed 's/{old}/{new}/g' {file} > {new-file}`：替换文件中的字符串重定向到新文件
  - `sed -i 's/{old}/{new}/g' {file}`：直接在文件中替换字符串
  - `sed -i 's/\r$//' {file}`：替换Windows换行符为Linux换行符
- `top`：实时查看系统资源使用情况
  - `htop`：更友好的系统资源监控工具


# PBS 系统命令简介

PBS是一种作业调度系统，常用于高性能计算集群。以下是一些常用的PBS命令：
- `qsub {script}`：提交作业脚本
- `qstat`：查看作业状态
  - `qstat -u {username}`：查看指定用户的作业状态
  - `qstat -f {jobid}`：查看指定作业的详细信息
- `qdel {jobid}`：删除指定作业
- `j`：查看自己的任务（某一任管理员自定义的命令）
- `node`：查看当前节点的状态

PBS脚本：
- Header
  ```bash
  #!/bin/bash % bash脚本
  #PBS -N calc-Wangzx % 作业名称
  #PBS -l nodes=1:ppn=24 % 节点数和每个节点的处理器数
  #PBS -l walltime=96:00:00 % 最大运行时间
  #PBS -q cmt % 队列名称

  cd ${PBS_O_WORKDIR} % 切换到提交作业的目录
  cp $PBS_NODEFILE node % 将节点列表文件复制到当前目录
  nodes_num=$(cat ${PBS_NODEFILE} | wc -l) % 计算节点的处理器数量
  module load intel/19u5 % 加载Intel编译器模块
  mpirun -np $nodes_num -machinefile $PBS_NODEFILE {Code} > {OutFile} % 使用MPI并行运行程序
  ```


# Openmx 运行
## 需要用到的网址
[OpenMX 官网](https://www.openmx-square.org/)

[OpenMX 赝势/基组推荐](https://www.openmx-square.org/openmx_man3.9/node27.html)

[Material Project网址](https://next-gen.materialsproject.org/materials)

## 上手使用
`calc.sh`脚本示例：
```bash
...

module load intel/19u5

mpirun -np ${nodes_num} /home/tangzc/openmx3.9/work/openmx openmx_in.dat > openmx.std

cat openmx.out >> openmx.scfout
mkdir preprocessed

/home/tangzc/julia-166/julia-1.6.6/bin/julia /home/lihe/anaconda3/envs/3_9/lib/python3.9/site-packages/deeph/preprocess/openmx_get_data.jl --input_dir . --output_dir ./preprocessed -s true
```
这个脚本包含了OpenMX的运行和数据的后处理步骤。

1. OpenMX的输入文件为`openmx_in.dat`文件。
2. 通过`mpirun -np ${nodes_num} /home/tangzc/openmx3.9/work/openmx openmx_in.dat > openmx.std`来运行OpenMX，重定向输出到`openmx.std`文件。
3. 在`preprocessed`目录中存储当前文件夹下运行`openmx_get_data`处理后的数据。这些数据对接了DeepH：
  - `site_position.dat`是晶体的笛卡尔坐标；
  - `lat.dat`是晶体的正格矢；
  - `rlat.dat`是晶体的倒格矢；
  - `element.dat`是结构的原子序数；
  - ` hamiltonians.h5`, `overlaps.h5`是每个原子对的哈密顿量和交叠矩阵；
  - `orbital_types.dat`是原子轨道信息。
4. 利用`band_config.json`文件来指定计算能带的基本参数，数据从`preprocessed`目录中读取。使用`band.sh`来计算能带，输出结果为`openmx.Band`文件。（运行之前需要使用`ln -s hamiltonians.h5 hamiltonians_pred.h5`来建立软链接）
  ```bash
  /home/tangzc/julia-166/julia-1.6.6/bin/julia /home/lihe/DeepH-pack/deeph/inference/dense_calc.jl --input_dir ./ --output_dir ./ --config ./band_config.json
  ```
5. 利用`python /home/dftcourse/Users/admin/plot_openmx_band.py`来绘制能带图。

## 进阶使用


1. 从Material Project中选择`Cu-Pb-O`来寻找元素结构，比如选定$CuPbO_3$。导出位置信息为`POSCAR`文件。其中会包含相应的笛卡尔坐标和基矢信息。在OpenMX推荐的赝势和基组中，选择相应的设置。
2. 修改`openmx_in.dat`文件：
  - 设置`Atoms.Number`为5；
  - 设置`Atoms.SpeciesAndCoordinates`块为相应的原子坐标和自旋：
  ```bash
  <Atoms.SpeciesAndCoordinates
  1 Cu 0.0000000000000000    0.0000000000000000    0.0000000000000000 5.5 5.5 
  2 Pb 0.5000000000000000    0.5000000000000000    0.5000000000000000 7.0 7.0
  3 O  0.0000000000000000    0.0000000000000000    0.5000000000000000 3.0 3.0
  4 O  0.0000000000000000    0.5000000000000000    0.0000000000000000 3.0 3.0
  5 O  0.5000000000000000    0.0000000000000000    0.0000000000000000 3.0 3.0
  Atoms.SpeciesAndCoordinates>
  ```
  - 设置`Atoms.UnitVectors`块为相应的基矢：
  ```bash
  <Atoms.UnitVectors
   3.8731889999999991    0.0000000000000000    0.0000000000000002
  -0.0000000000000002    3.8731889999999991    0.0000000000000002
   0.0000000000000000    0.0000000000000000    3.8731889999999991
  Atoms.UnitVectors>
  ```
  - 修改`Species.Number`为3；
  - 修改`Definition.of.Atomic.Species`块为相应的赝势和基组：
  ```bash
  <Definition.of.Atomic.Species
  Cu    Cu6.0S-s2p1d1	          Cu_PBE19S
  Pb    Pb8.0-s3p2d2             Pb_PBE19
  O     O6.0-s2p2                O_PBE19
  Definition.of.Atomic.Species>
  ```
3. 运行`calc.sh`脚本，在`preprocessed`目录中中找到`info.json`文件，里面有$FermiLevel$；
4. 运行`/home/tangzc/vaspkit -task 303 `，这个命令会根据`POSCAR`文件生成高对称点$HighSymmetryPoints$；
5. 将这两个数据填入`band_config.json`文件中，即可画新的能带图。


