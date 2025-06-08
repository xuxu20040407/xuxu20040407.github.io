---
title: SIESTA的安装
mathjax: true
date: 2025-03-12 19:12:08
tags:
categories:
cover:
---

# SIESTA官方教程

SIESTA的官方教程可以在[这里](https://docs.siesta-project.org/projects/siesta/en/stable/tutorials/00-TutorialSetup.html)找到。相关文件保存在`siesta-docs`文件夹下。

# 构建SIESTA的Docker镜像


当我们安装好Docker后，我们可以着手构建SIESTA的镜像。SIESTA的安装过程比较复杂，需要一些前置的依赖包，因此我们需要一个Dockerfile来构建SIESTA的镜像。

```Dockerfile
# 使用官方 Ubuntu 镜像作为基础镜像
FROM ubuntu:22.04

# 安装必要的工具
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    mercurial \
    subversion

# 安装 Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda
ENV PATH="/opt/conda/bin:$PATH"

# 安装 SIESTA
RUN conda install -c conda-forge siesta=5.2.2
```

在Dockerfile所在的目录下，我们可以运行以下命令来构建SIESTA的镜像：

```bash
docker build -t siesta:latest . # siesta是镜像的名字，latest是标签
```



# 运行SIESTA

构建完成后，我们可以运行以下命令来启动SIESTA的容器：

```bash
docker run -it --name siesta -v "D:\SIESTA\siesta-docs:/app" siesta:latest /bin/bash
```
此处的`D:\SIESTA\siesta-docs`是文件的路径，`/app`是挂在到容器下的路径，`-v`参数用来挂载宿主机的目录到容器中。此时输入命令`ls`即可查看到`siesta-docs`文件夹下的文件。

进入到`/app/work-files/tutorials/basic/first-encounter`文件夹下，我们可以运行SIESTA的教程：

```bash
siesta <ch4.fdf> output.txt
```

即可得到运行后的结果。