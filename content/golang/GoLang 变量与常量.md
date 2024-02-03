---
title: "Golang 变量与常量"
subtitle: " 关于变量与常量的一些重点总结"
date: 2022-03-29T14:43:43+08:00
lastmod: 2022-03-29T14:43:43+08:00

author: "Jonny.Chang"
authorLink: "https://archiguru.io"
description: "架构师|Java 爱好者|GitHub:ArchiGuru|这里是 ArchiGuru 博客，欢迎访问！"
tags: ["所有博客"]
categories: ["所有博客"]

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

Go语言是静态类型语言，因此变量（variable）是有明确类型的，编译器也会检查变量类型的正确性。

<!--more-->

## Go语言类型

Go 的数据类型分四大类：

1. **基础类型：** 数字 `number`，字符串 `string` 和布尔型 `boolean`。

2. **聚合类型：** 数组 `array` 和结构体 `struct`。

3. **引用类型：** 指针 `pointer`，切片 `slice`，字典 `map`，函数 `func` 和通道 `channel`。

4. **接口类型：** 接口 `interface`。



### 基本类型

| 类 别 | 类 型 | 说 明 |
|:---|:--|:--|
|布尔型|bool|布尔型和整型不能相互转换|
|字符串|string|使用\`定义不做转义的原始字符串,支持换行(即原始字符串)|
|整型|int、int8、int16、int32、int64|均为整型,支持正负数|
|整型|uint、uint8、uint16、<br>uint32、uint64、uintptr|无符号整数，即只支持正数形式，不支持负数的形式。|
|整型|byte |uint8 的别名 (仅正数)|
|整型|rune |int32 的别名 代表一个 Unicode 码|
|浮点型|float32、float64|当对浮点数进行比较运算时，不能直接使用 == 和 !=，结果会不稳定。应该使用 math 标准库。|
|复数类型|complex64、complex128 |a.`complex`：构造一个复数；<br>b.`real`：获取复数的实部；<br>c.`imag`：获取复数的虚部。|

#### 整型取值范围

|类型| 长度（字节）|范围|
|---|:---:|---|
|int8|1|-128 ~ 127|
|uint8|1|0~255|
|byte|1|0~255|
|int16|2|-32768~32767|
|uint16|2|0~65535|
|int32|4|-2147483648~2147483647|
|uint32|4|0~4294967295|
|int64|8|-9223372036854775808~9223372036854775807|
|uint64|8|0~18446744073709551615|
|int|4/8|同上|
|uint|4/8|同上|
|uintptr|4/8|同上，足以存储指针的 uint|

> int 类型的具体大小是跟机器的 CPU 位数相关的。如果 CPU 是 32 位的，那么 int 就占 4 字节，如果 CPU 是 64 位的，那么 int 就占 8 字节。

#### 字符串总结

- `Count(s string, str string) int` 计算字符串`str`在`s`中的非重叠个数。如果`str`为空串则返回`s`中的字符（非字节）个数+1。

- `Index(s string, str string) int ` 返回子串`str`在字符串`s`中第一次出现的位置。如果找不到则返回`-1`；如果`str`为空，则返回`0`

- `LastIndex(s string, str string) int`  返回子串`str`在字符串`s`中最后一次出现的位置。如果找不到则返回`-1`；如果`str`为空则返回字符串`s`的长度。

- `IndexRune(s string, r rune) int ` 返回字符r在字符串`s`中第一次出现的位置。如果找不到则返回`-1`

- `IndexAny(s string, str string) int ` 返回字符串`str`中的任何一个字符在字符串`s`中第一次出现的位置。如果找不到或`str`为空则返回`-1`

- `LastIndexAny(s string, str string) int`  返回字符串`str`中的任何一个字符在字符串`s`中最后一次出现的位置。如果找不到或`str`为空则返回`-1`

- `Contains(s string, str string) bool` 判断字符串`s`中是否包含个子串`str`。包含或者`str`为空则返回`true`

- `ContainsAny(s string, str string) bool` 判断字符串`s`中是否包含个子串`str`中的任何一个字符。包含则返回`true`，如果`str`为空则返回`false`

- `ContainsRune(s string, r rune) bool` 判断字符串`s`中是否包含字符`r`

- `SplitN(s, str string, n int) []string` 以`str`为分隔符，将`s`切分成多个子串，结果中 **不包含** `str`本身。如果`str` 为空则将`s`切分成`Unicode`字符列表。如果`s`中没有`str`子串，则将整个`s`作为`[]string`的第一个元素返回。参数`n`表示最多切分出几个子串，超出的部分将不再切分，最后一个`n`包含了所有剩下的不切分。如果`n`为`0`，则返回`nil`；如果`n`小于`0`，则不限制切分个数，全部切分。

- `SplitAfterN(s, str string, n int) []string` 以`str`为分隔符，将`s`切分成多个子串，结果中**包含** `str` 本身。如果`str`为空，则将`s`切分成`Unicode`字符列表。如果`s` 中没有`str`子串，则将整个`s`作为 `[]string` 的第一个元素返回。参数`n`表示最多切分出几个子串，超出的部分将不再切分。如果`n`为`0`，则返回 `nil`；如果 `n` 小于 `0`，则不限制切分个数，全部切分。

- `Split(s, str string) []string` 以str为分隔符，将s切分成多个子切片，结果中 **不包含** `str`本身。如果`str`为空，则将`s`切分成`Unicode`字符列表。如果`s`中没有`str`子串，则将整个`s`作为`[]string`的第一个元素返回。

- `SplitAfter(s, str string) []string` 以str为分隔符，将s切分成多个子切片，结果中 **包含** `str`本身。如果 `str` 为空，则将 `s` 切分成`Unicode`字符列表。如果`s`中没有`str`子串，则将整个`s`作为`[]string`的第一个元素返回。

- `Fields(s string) []string` 以连续的空白字符为分隔符，将`s`切分成多个子串，结果中不包含空白字符本身。空白字符有 `\t, \n, \v, \f, \r, 空格, U+0085 (NEL), U+00A0 (NBSP) ` 。如果 `s` 中只包含空白字符，则返回一个空列表。

- `FieldsFunc(s string, f func(rune) bool) []string` 以一个或多个满足`f(rune)`的字符为分隔符，将`s`切分成多个子串，结果中不包含分隔符本身。如果`s`中没有满足`f(rune)`的字符，则返回一个空列表。

- `Join(s []string, str string) string` 将`s`中的子串连接成一个单独的字符串，子串之间用`str`分隔。

- `HasPrefix(s string, prefix string) bool` 判断字符串`s`是否以`prefix`开头。

- `HasSuffix(s, suffix string) bool` 判断字符串`s`是否以`prefix`结尾。

- `Map(f func(rune) rune, s string) string` 将`s`中满足`f(rune)`的字符替换为`f(rune)`的返回值。如果`f(rune)`返回负数，则相应的字符将被删除。

- `Repeat(s string, n int) string` 将`n`个字符串`s`连接成一个新的字符串。

- `ToUpper(s string) string` 将`s`中的所有字符修改为其大写格式。对于非`ASCII`字符，它的大写格式需要查表转换。

- `ToLower(s string) string` 将`s`中的所有字符修改为其小写格式。对于非`ASCII`字符，它的小写格式需要查表转换。

- `ToTitle(s string) string` 将`s`中的所有字符修改为其`Title`格式，大部分字符的`Title`格式就是`Upper`格式，只有少数字符的`Title`格式是特殊字符。这里的`ToTitle`主要给`Title`函数调用。

- `TrimLeftFunc(s string, f func(rune) bool) string` 删除`s`头部连续的满足`f(rune)`的字符。

- `TrimRightFunc(s string, f func(rune) bool) string` 删除`s`尾部连续的满足`f(rune)`的字符。

- `TrimFunc(s string, f func(rune) bool) string` 删除`s`首尾连续的满足`f(rune)`的字符。

- `IndexFunc(s string, f func(rune) bool) int` 返回`s`中第一个满足`f(rune)` 的字符的字节位置。如果没有满足 `f(rune)` 的字符，则返回 `-1`

- `LastIndexFunc(s string, f func(rune) bool) int` 返回`s`中最后一个满足`f(rune)`的字符的字节位置。如果没有满足 `f(rune)` 的字符，则返回 `-1`

- `Trim(s string, str string) string` 删除s首尾连续的包含在`str`中的字符。

- `TrimLeft(s string, str string) string` 删除s头部连续的包含在`str`中的字符串。

- `TrimRight(s string, str string) string` 删除`s`尾部连续的包含在`str`中的字符串。

- `TrimSpace(s string) string` 删除`s`首尾连续的的空白字符。

- `TrimPrefix(s, prefix string) string` 删除s头部的`prefix`字符串。如果`s`不是以`prefix`开头，则返回原始`s`

- `TrimSuffix(s, suffix string) string` 删除s尾部的`suffix`字符串。如果`s`不是以`suffix`结尾，则返回原始`s`。（只去掉一次，注意和`TrimRight`区别）

- `Replace(s, old, new string, n int) string` 返回`s`的副本，并将副本中的`old`字符串替换为`new`字符串，替换次数为`n`次，如果`n`为`-1`，则全部替换；如果 `old` 为空，则在副本的每个字符之间都插入一个`new`

- `EqualFold(s1, s2 string) bool` 比较`UTF-8`编码在小写的条件下是否相等，不区分大小写，同时它还会对特殊字符进行转换。比如将`ϕ`转换为`Φ`、将`Ǆ`转换为`ǅ`等，然后再进行比较。`==`比较字符串是否相等，区分大小写，返回`bool`

- `Compare(s1 string, s2 string) int1` 比较字符串，区分大小写，比”==”速度快。相等为0，不相等为-1。

### 引用类型


