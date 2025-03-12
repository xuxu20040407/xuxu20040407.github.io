---
title: Docker的配置
mathjax: true
date: 2025-03-12 16:43:18
tags:
categories:
cover:
---

# What's Docker

Docker是一个开源的应用容器引擎，基于Go语言并遵从Apache2.0协议开源。Docker可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的Linux机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。

在Docker之前，要想在不同的环境中运行同一个应用，需要在不同的环境中安装相同的依赖包。如果操作系统相同，这件事情可能还是个简单的问题，用Conda可以在Python环境中解决。然而，当问题扩展到区别于Python的其他操作系统时，问题就变得复杂了。一个常见的运维的笑话是：“在我的机器上是可以运行的”。Docker的出现解决了这个问题。

Docker的核心思想和Conda有很多相似之处，都是通过容器的方式来管理应用的依赖包：

| | Docker | Conda |
| --- | --- | --- |
| 容器 | Container | Environment |
| 镜像 | Image | Package |
| 仓库 | Registry | Repository |
| 配置文件 | Dockerfile | Environment.yml |

通过一个Dockerfile文件，可以将一个应用的运行环境打包成一个镜像，然后通过这个镜像可以生成一个容器，这个容器就是一个独立的运行环境。这个容器可以在任何支持Docker的机器上运行，而不需要担心环境的问题。

# Install Docker

## Preparation

Docker需要的Linux内核可以通过WSL2来提供。
- 进入Windows的控制面板
- 选择“**程序和功能**”
- 选择“**启用或关闭windows功能**”
- 勾选“适用于Linux的Windows子系统”和“虚拟机平台(Virtual Machine Platform)”。

然后通过以下命令设置WSL2：
```shell
wsl --set-default-version 2
```
如果你此前没有下载，可能需要几分钟安装WSL2.

## Docker Installation

前往[官网下载](https://docs.docker.com/desktop/install/windows-install/)下载相应的安装包。直接安装即可。

## Docker Mirros

Docker的镜像下载速度可能会很慢，可以通过修改镜像源来提高下载速度。在Docker Desktop中，可以在“**Settings**”中的“**Docker Engine**”中添加镜像源：

```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false,
  "registry-mirrors": [
    "https://docker.m.daocloud.io/",
    "https://huecker.io/",
    "https://dockerhub.timeweb.cloud",
    "https://noohub.ru/",
    "https://dockerproxy.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://docker.nju.edu.cn",
    "https://xx4bwyg2.mirror.aliyuncs.com",
    "http://f1361db2.m.daocloud.io",
    "https://registry.docker-cn.com",
    "http://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn"
  ]
}
```

或者前往"./user/.docker/daemon.json"文件中添加镜像源。

# Docker Commands

登陆和登出：

```shell
docker login
docker logout
```

查看镜像：

```shell
docker images
```

查看容器：

```shell
docker ps
```

创建和删除镜像：

```shell
docker build -t <image_name> -f <Dockerfile_path> 
docker rmi <image_name>
```

创建和删除容器：

```shell
docker create --name <container_name> <image_name>
docker rm <container_name>
```

创建并运行容器：

```shell
docker run -it --name <container_name> <image_name> /bin/bash
```
> - `-it`：交互式运行容器
> - `--name`：容器的名字
> - `/bin/bash`：容器启动后执行的命令，启动一个终端

启动和停止容器：

```shell
docker start <container_name>
docker stop <container_name>
```

进入和退出容器：

```shell
docker exec -it <container_name> /bin/bash
exit
```

# Dockerfile

前面提到，Dockerfile是用来构建镜像的配置文件。Dockerfile的语法如下：

```shell
FROM <base_image> # 基础镜像
RUN <command> # 执行命令
ADD <src> <dest> # 添加文件
COPY <src> <dest> # 复制文件
WORKDIR <path> # 工作目录
ENV <key> <value> # 环境变量
CMD <command> # 容器启动后执行的命令
```

一个简单的Dockerfile示例：

```shell
FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y python3
CMD python3
```

> 一个RUN命令对应一个镜像层，可以通过合并多个命令来减少镜像层的数量。当然，多个RUN命令可以保存中间结果，以防运行失败需要重新创建。
>
> RUN和CMD的区别在于，RUN是在构建镜像时执行，CMD是在容器启动时执行。所以一般CMD命令用于测试镜像是否构建成功。








