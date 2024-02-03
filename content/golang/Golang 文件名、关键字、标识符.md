---
title: "Golang-基础知识"
subtitle: "Golang 基础"
date: 2022-03-29T18:26:56+08:00
lastmod: 2022-03-29T18:26:56+08:00

author: "Jonny.Chang"
authorLink: "https://archiguru.io"
description: "架构师|Java 爱好者|GitHub:ArchiGuru|这里是 ArchiGuru 博客，欢迎访问！"
tags: ["Golang"]
categories: ["Golang"]

draft: false
hiddenFromHomePage: false
hiddenFromSearch: false

toc:
  enable: true

math:
  enable: true
lightgallery: false

featuredImage: ""
featuredImagePreview: ""
license: "https://archiguru.io/LICENSE"
---

快速掌握 Go 基础知识

<!--more-->

### 标识符

1. 标识符以 **字母** 或 **下划线** 开头，大小写敏感
2. `_` 是 golang 中特殊的标识符，用来忽略结果。
3. 保留关键字与 java 类似，但是一部分也有不同，如 `go, goto, struct, fallthough, chan, range, func...` 等等

### 函数

- 使用 `func` 定义函数， `func main()` 为入口函数

- 导入包时，添加`_ {package_name}` 指仅初始化该包，而不引用；

```go
// 只有一个 main 入口，go 程序对目录敏感，目录即工程
package main

// 引入多个包，可使用小括号一次性引入
import "fmt"

func mian(){
  fmt.Println("Hello Golang!")
}
```

### 类型

- 值类型：内存在栈中分配

	- int、float、bool、string、数组、struct 

- 引用类型：内存在堆中分配

    - 指针、切片、map、chan 等

#### 关于 Channel

> `Channel` 是 Go 语言中被用来实现并行计算方程之间通信的类型。其功能是允许线程间通过发送和接收来传输指定类型的数据。其初始值是 `nil`。

**创建 Channel 的方法如下：**

```go
var c1 chan [value type]
c1 = make([channel type] [value type], [capacity])
```

- `[value type]` 定义的是 Channel 中所传输数据的类型。
- `[channel type]` 定义的是 Channel 的类型，其类型有以下三种：
	- “chan” 可读可写——“chan int” 则表示可读写 int 数据的 channel
	- "chan<-" 仅可写——“chan<- float64” 则表示仅可写64位 float 数据的 channel
	- “<-chan” 仅可读——“<-chan int” 则表示仅可读 int 数据的 channel
- `[capacity]` 是一个可选参数，其定义的是 channel 中的缓存区 (buffer)。如果不填则默认该 channel 没有缓冲区 (unbuffered)。

更多详细信息可参考[这里](https://studygolang.com/articles/25805)

#### 关于 struct

Go 中的 struct 是结构体，类似 java 中的对象

- 定义一个 struct：

```go
type Member struct {
    id     int
    name   string
    email  string
    gender int
    age    int
}

var m1 Member  //所有字段均为空值

// 普通声明方式
var m2 = Member{id:2,"name":"小红"} 

// 简短变量声明方式：
m3 := Member{id:2,"name":"小红"}
```

- 空结构体, 如:

```go
ch := make(chan struct{})
ch <- struct{}{}
```

- 参考： [更多参考信息](https://juejin.cn/post/6844903814168838151#heading-11)

#### 指针结构体

```go
var m1 *Member
m1.name = "小明" //错误用法，未初始化, m1为nil

m1 = &Member{}
m1.name = "小明" //初始化后，结构体指针指向某个结构体地址，才能访问字段，为字段赋值。
```

> 获取变量地址，使用 `&` ; 如 `var a int`, 获取 a 的地址：`&a`
> 获取指针类型所指向的值，使用 `*`; 如`var *a int`，获取 a 指向的值：`*a`






