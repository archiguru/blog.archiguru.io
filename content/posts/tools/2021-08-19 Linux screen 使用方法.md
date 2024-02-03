---
title: "Linux screen 使用方法.md"
subtitle: "Linux 中 screen 使用基本方法与技巧总结"
author: "Jonny.Chang"
date: 2022-03-31
lastmod: 2022-03-31
authorLink: "https://github.com/archiguru"
categories: ["Linux", "工具"]
hiddenFromHomePage: false
fontawesome: true
linkToMarkdown: true
rssFullText: true
draft: false
lightgallery: true
---


<a name="60f7fb42"></a>
### 一、语法

```bash
screen [-AmRvx -ls -wipe][-d <名称>][-h <行数>][-r <名称>][-s ][-S <名称>]
```
<a name="45fff18f"></a>
### 二、参数说明
```bash

-R     # ** 先试图恢复离线的作业。若找不到离线的作业, 即建立新的 screen 作业。
-S     # ** 新建 <作业名称> 指定screen作业的名称。
-ls    # ** 或 --list  显示目前所有的screen作业。
-r     # ** 恢复离线的作业。

-x     # 恢复之前离线的 screen 作业。
-A     # 将所有的视窗都调整为目前终端机的大小。
-d     # <作业名称> 将指定的screen作业离线。
-h     # <行数>  指定视窗的缓冲区行数。
-m     # 即使目前已在作业中的screen作业, 仍强制建立新的 screen 作业。
-s     # 指定建立新视窗时, 所要执行的shell。
-v     # 显示版本信息。
-wipe  # 检查目前所有的screen作业, 并删除已经无法使用的screen作业。
```

<a name="svbhE"></a>
### 三、常用 screen 参数
```bash
screen -S <name>    # 新建
screen -ls          # 列出当前所有 session
screen -r <name>    # 回到 <name> 这个 session
screen -d <name>    # 远程 detach(分离) 某个 session
screen -d -r <name> # 结束当前 session 并回到 <name> 这个 session
```

<a name="MCJ6U"></a>
### 四、控制命令
> 在每个 screen session 下，所有命令都以 Ctrl + a(C-a) 开始。

```bash
C-a ?     # 显示所有键绑定信息
C-a c     # 创建一个新的运行shell的窗口并切换到该窗口
C-a n     # Next，切换到下一个 window 
C-a p     # Previous，切换到前一个 window 
C-a 0..9     # 切换到第 0..9 个 window
Ctrl+a [Space]     # 由视窗0循序切换到视窗9
C-a C-a     # 在两个最近使用的 window 间切换 
C-a x     # 锁住当前的 window，需用用户密码解锁
C-a d     # detach，暂时离开当前session，将目前的 screen session (可能含有多个 windows) 丢到后台执行，并会回到还没进 screen 时的状态，此时在 screen session 里，每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
C-a z     # 把当前session放到后台执行，用 shell 的 fg 命令则可回去。
C-a w     # 显示所有窗口列表
C-a t     # Time，显示当前时间，和系统的 load 
C-a k     # kill window，强行关闭当前的 window
C-a [     # 进入 copy mode，在 copy mode 下可以回滚、搜索、复制就像用使用 vi 一样
        C-b Backward，PageUp 
        C-f Forward，PageDown 
        H(大写) High，将光标移至左上角 
        L Low，将光标移至左下角 
        0 移到行首 
        $ 行末 
        w forward one word，以字为单位往前移 
        b backward one word，以字为单位往后移 
        Space 第一次按为标记区起点，第二次按为终点 
        Esc 结束 copy mode 
C-a ]     # Paste，把刚刚在 copy mode 选定的内容贴上
```

