---
title: Hexo的安装与配置
mathjax: true
date: 2024-09-15 19:23:14
tags: hexo
categories: hexo
cover:
---
- [建Blog有感](#建blog有感)
- [预备软件](#预备软件)
  - [Node.js](#nodejs)
  - [Git](#git)
  - [注册你的Github账号](#注册你的github账号)
  - [Git配置](#git配置)
- [Hexo的安装](#hexo的安装)
  - [下载Hexo](#下载hexo)
  - [本地建站](#本地建站)
  - [基本命令](#基本命令)
    - [清理生成的静态文件](#清理生成的静态文件)
    - [生成静态文件](#生成静态文件)
    - [启动本地服务器预览站点](#启动本地服务器预览站点)
    - [部署到远程服务器](#部署到远程服务器)
    - [新建文章](#新建文章)
- [Butterfly美化](#butterfly美化)
- [不同电脑的同步](#不同电脑的同步)



hexo的安装和配置教程已经很多了，但在照着安装的过程中仍然遇到了很多困难。笔者基于网络的教程进行更新和补充（顺便教教小学弟）。

# 建Blog有感

笔者经历了从手写笔记、平板笔记一直到电脑本地用$\LaTeX$做笔记的阶段，尽管平板笔记解决了手写笔记不容易更改和整理（并且字不好看）的问题，电脑本地笔记又解决了平板笔记不方便保存和转移的问题，$\LaTeX$本身也是极为繁琐的，而Blog本身托管到Github的同时，解决了分享的问题。

阮一峰在博客中写到：
>喜欢写 Blog 的人，会经历三个阶段。
>
>第一阶段，刚接触 Blog，觉得很新鲜，试着选择一个免费空间来写。
>
>第二阶段，发现免费空间限制太多，就自己购买域名和空间，搭建独立博客。
>
>第三阶段，觉得独立博客的管理太麻烦，最好在保留控制权的前提下，让别人来管，自己只负责写文章。

本文和大部分的教程一样，直入第三步，通过Github自己的用户主页实现对Blog的管理。以下的引用块如无说明，均来自**Kimi AI**。如有需要，请自行配置VPN或寻找国内镜像源。

本文参考教程：
[目前最新的教程](https://hpcesia.github.io/posts/2024/48acad6d/)
[Butterfly美化](https://blog.csdn.net/mjh1667002013/article/details/129290903)
[SSH配置](https://zhuanlan.zhihu.com/p/628727065)
[多端同步](https://kakaluoto.xyz/2022/01/10/Hexo%E5%9C%A8%E5%A4%9A%E5%8F%B0%E7%94%B5%E8%84%91%E4%B8%8A%E6%8F%90%E4%BA%A4%E5%92%8C%E6%9B%B4%E6%96%B0/)


# 预备软件
## Node.js
>*Node.js* 是一个基于 *Chrome V8* 引擎的 *JavaScript* 运行环境，它允许开发者在服务器端运行 *JavaScript* 代码。***Hexo*** 是一个基于 *Node.js* 的静态博客生成器，它可以让你使用 *Markdown*（或其他渲染引擎）编写内容，然后通过 *Node.js* 运行 ***Hexo*** 来生成静态的 *HTML* 页面。简而言之，*Node.js* 为 ***Hexo*** 提供了运行环境，使得 ***Hexo*** 能够处理网站生成、部署等任务。

>**npm** 是 *Node.js* 的默认包管理器，它允许开发者安装、共享和管理依赖库。所以，之后你可以使用 **npm** 进行包的下载（包括 ***Hexo*** ）。当然，如果你想选择其他的博客框架，下载对应的包即可。

[Node.js下载地址](https://nodejs.org/en/)

## Git
>如果你经常使用 ***Github*** ，你肯定对 **Git** 不会陌生。当你需要上传你的网页文件到 ***Github*** 的时候，其是必不可少的。

[Git下载地址](https://git-scm.com/downloads/)




## 注册你的Github账号

[Github](https://github.com/)

当你注册完你的账号后，假设你的用户名是Username，那么你需要创建名为Username.github.io的仓库。请记住你的邮箱和用户名。

## Git配置
显然，Git需要知道你的Github用户名是什么，并且获得你的权限，才能进行方便的同步。输入以下命令让git知道你的Github用户名和邮箱：

```powershell
git config --global user.name Username
git config --global user.email xxxx@xxxx
```
并且生成密钥：
```powershell
ssh-keygen -t rsa -C  xxxx@xxxx
```
此时，在用户文件夹下就会有一个新的文件夹.ssh，里面有刚刚创建的ssh密钥文件id_rsa和id_rsa.pub。将id_rsa.pub中的内容复制到Github网站的以下位置：
Settings-SSH and GPG keys-New SSH key

这相当于Git每次向Github请求同步时，都会发送该密钥进行确认，Github因而可以允许其对仓库的更改。

>如果需要检查是否连接成功，请执行以下命令：
>```powershell
>ssh -T git@github.com
>```

# Hexo的安装

## 下载Hexo

新建一个Blog文件夹，在文件夹内单击右键侧键栏“Open Git Bash here”（其实终端也行）。

这一步是最为艰难的一步。如果进行Hexo的下载安装：
```powershell
npm install hexo-cli -g
```

但是有部分电脑无法连接官方源，这时候可以替换为国内镜像源。大多数教程会让你替换官方源为淘宝源以提高下载速度，然而，他们给出的：
```powershell
npm config set registry https://registry.npm.taobao.org
```

这是有问题的（有的教程会将错就错，跳过证书认证，但依然有后续问题）。该网站已停止运行（有的时候却可以正常下载），新的网站为：
```powershell
npm config set registry https://registry.npmmirror.com
```
并进行检查：
```powershell
npm config get registry
```

在powershell输入以上命令，即为npm更换了国内源。重新执行Hexo的下载命令，并在终端中执行
```powershell
hexo -version
```
出现版本号即说明安装成功。

>如果你有VPN或者想换回官方源：
>```powershell
>npm config set registry https://registry.npmjs.org
>```


## 本地建站

在你的Blog文件内继续输入命令：
```powershell
hexo init GithubBlog
```
即可新建名为GithubBlog的子文件夹，并在内部进行初始化（下载必要的包）。不出意外，你的文件夹中应该有以下子文件夹：
- source # 你的文章和图片源文件
  - _post # 你的文章源文件
- public # 渲染后的网页文件
- scaffolds # 模板
  - post.md # post格式文章的模板
  - ...
- themes # 你的主题文件
  - landscape # 默认的hexo主题
- node_modules # 你的相关依赖包

以及这些文件：
- _config.yml #站点配置文件
- _config.landscape .yml #landscape主题配置文件
- package.json #相关依赖列表

>如果你在这一步出现了问题，比如没有node_modules 文件夹，执行
>```powershell
>npm install
>```
>会重新下载package.json中的依赖包。

## 基本命令

我们已经提到过，Hexo通过在本地渲染你书写的源文件后，可以上传Github或在本地服务器预览网站。一个常见的本地预览命令组为：
```powershell
hexo clean && hexo g && hexo s
```
同时，一个部署命令组为：
```powershell
hexo clean && hexo g && hexo d
```
我们介绍以下相关的命令。

### 清理生成的静态文件
```powershell
hexo clean
```

当执行该命令时，静态文件public和缓存db.json会被删除。
### 生成静态文件
```powershell
hexo generate
```
当执行该命令时，public文件夹会被创建，并增加相应的网页文件。这一步通常会伴随数学公式渲染的报错。相关的修改可以参考：
[Here](https://zhengyujie.github.io/2019/07/29/hexo%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F/)

该博主推荐安装修改后的渲染引擎并手动修改一些字符的转义。然而有时候仍然会遇到一些报错，经验表明，不要在数学公式中产生额外的花括号即可。
### 启动本地服务器预览站点
```powershell
hexo server
```
该命令启动了http://localhost:4000/ 作为本地服务器进行预览网页。
### 部署到远程服务器
```powershell
hexo deploy
```
到了这一步，需要修改_config.yml中的相关配置。找到有关deploy的部分：
```Yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: 'git'
  repo: git@github.com:Username/Username.github.io.git
  branch: master
```
这意味着当你运行hexo deploy时，git会自动帮你同步到master分支。不过在运行命令之前，hexo仍然不能与git建立联系，所以需要你下载以下插件：
```powershell
npm install hexo-deployer-git --save
```

### 新建文章
```powershell
hexo new "My New Post"
```
当你像上述命令未指定文章的类型时，hexo默认为你生成Post格式的模板文章。你可以前往Post.md修改模板。


## 你的Github主页
至此，你已经完成了对网站的部署，前往以下地址即可观赏你的网站：
https://Username.github.io/
需要注意的是，网站的部署有一定的延迟。

# Butterfly美化

请参考上文给出的参考链接。

# 不同电脑的同步

熟悉git的朋友可能会知道，hexo d这一命令其实只是执行了如下命令组：
```powershell
git add . # 将当前目录下的所有更改加入暂存区
git commit -m "update" # 将暂存区的更改提交到本地仓库
git push # 推送到远程仓库
```

通过手动执行以上命令，可以利用新分支实现不同电脑端的同步，简单来说如下：
- 创建新分支Hexo并设为默认分支；
- clone该仓库到本地，并删除其他文件，只留下.git 文件夹；
- 将GithubBlog内除.deploy_git 以外都复制到clone下来的文件夹中；
- 删除themes中的 .git文件夹，因为不能嵌套上传，导致新电脑无法接受主题文件；
- 推送到远程库：
```powershell
git add . 
git commit -m "update" 
git push 
```

至此，你的hexo分支内就存放了源文件，而master分支内则存放了静态文件。日常部署仍可以用hexo d命令，因为其配置文件指明了master分支，与default分支无关。

新电脑执行以上安装hexo的命令，但不需要新建GithubBlog文件夹，需要克隆hexo分支下来，并执行npm install安装相应依赖。这样，新的电脑也可以进行网站的部署了。

当你切换新旧电脑部署时，记得执行
```powershell
git pull 
```
同步一下之前做过的修改。

hexo分支在这里仅起到了类似网盘的作用，对你的源文件进行了同步。