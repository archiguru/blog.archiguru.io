---
title: "vim translate"
author: "Jonny.Chang"
authorLink: "https://archiguru.io"
description: "VIM|vimrc|GitHub|ArchiGuru|这里是 ArchiGuru 博客，欢迎访问！"
tags: ["vim"]
categories: ["vim"]
draft: false
hiddenFromHomePage: true
hiddenFromSearch: false
toc:
  enable: true

math:
  enable: true
lightgallery: false
featuredImage: ""
featuredImagePreview: ""
license: "https://archiguru.io/LICENSE"
weight: 9976
---


### 第一部分

![第一部分](https://vip2.loli.io/2022/03/30/Kakw2U3hrcbJlMH.png)

```
启动
      ｜vim [文件] +123             打开指定的文件，并跳转到第123行
      ｜vim [文件] -t tag           编辑 tag 定义处的文件
      ｜vim [文件] -c '<command>'		加载第一个文件后执行 <command>
GUI   ｜vim [文件] -g			          使用图形界面 (同 "gvim")
GUI   ｜Linux	    :set guifont=ProggyTinyTT\ 12
GUI   ｜OSX		    :set guifont=ProggyTiny\ :h11
diff  ｜gvimdiff <file1> <file2> [<file3>]  多个文件对比文件

bug   ｜错误指令： Ctrl-l = Tab, Ctrl-[ = ESC 
       Vim 仍然无法映射某些键供您自己使用,例如：
       Caps, Ctrl-1, Ctrl-Shift-1, Ctrl-l, Ctrl-\, etc.

 0    ｜参阅: src/ops.c -c "/valid yank reg" for " reg. names
 6    ｜参阅: src/normal.c -c "/nv cmds " for g· extra cmds
 11   ｜参阅: See: src/edit.c -c "/ctrl_x msgs" for ^x· insert cmds

```

### 第二部分

![第二部分](https://vip1.loli.io/2022/03/30/xVNw8mkyUhP4qzf.png)

```
命令模式：基本帮助
:r file       插入文件
:w            保存
:gui          跳转到GUI
:q            退出
:q!           强制退出，不保存，可配合w/o使用
:e <file>     在新缓冲区中编辑文件
:source %     在当前行执行命令
:exec '<cmd>' 执行<cmd>命令

可视模式：光标移动
soft ^      移动到行首的非空白符
hard 0      移动到行首
     $      移动到行尾
     G      移动到文件最后一行
     2|     移动到第2列
     C-#    移动到上一个相同字符
     C-b    上一页 ⬆
     C-f    下一页 ⬇
     C-u    上1/2页 ⬆
     C-d    下1/2页 ⬇
     C-e    向上滚动1行 ⬆
     C-y    向下滚动1行 ⬇
     5gg    移动到从第5行
     gj     向下移动光标 (多行文本)
     gk     向上移动光标 (多行文本)
     ge     移动到上个单词结尾
     e      移动到下个单词结尾
     o      在当前行之下另起一行, 开始插入字符
     O      在当前行之上另起一行, 开始插入字符
     [[     移动到函数开通,即："{"
     ]]     移动到函数结束,即："}"

命令模式：查找/替换
?Foo       向上查找 Foo
\vFoo      Foo 中的非字母数字字符被视为正则表达式特殊字符 (不需转义字符)
n          查找下一个
N          查找上一个
:%s/old/new/g    替换全部
:%s/old/new/gc   (逐个)替换
:noh[lsearch]    移除搜索结果的高亮显示
'<         开始选择
'>         结束选择
+5         往后移动5行，并移动到行首非空白字符

```

### 其他

```shell
设置代码
:set backspace=indent,eol,start  允许退格键删除换行
:set shiftwidth=4                智能缩进空格数量为4
:set autoindent!                 自动切换缩进
:set tabstop=4                   Tab宽度为4空格(default:8)
:set expandtab!                  Tab替换为空格
:set listchars=...               配置显示不可见字符
:set list!                       切换显示或隐藏不可见字符
:set colorcolumn=80              显示右边距为80
noremap + :s/^/\/\//<CR>         屏蔽注释
:set numbers!                    显示行号
:set wrap!                       换行显示
:set showmatch                   高亮匹配小括号

文件/目录
:Explore              浏览当前目录
:set browsedir=...    设置打开的起始目录(last/buffer/current/{path})

```
