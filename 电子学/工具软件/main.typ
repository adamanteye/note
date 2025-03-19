#import "../../note_zh.typ": *
#show: conf.with(
  title: "模数电路工具",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= LTSpice
== 关于
`LTSpice`是Linear Technology(后被Analog Devices收购)开发的软件,集成有模拟器.

一般的工作流程为在LTSpice中创建原理图(schematic,扩展名`.asc`),然后将其导出为网表(netlist,扩展名`.net`).网表是模拟器(simulator)的输入文件.
=== 安装
#link("https://aur.archlinux.org/packages/ltspice")[AUR (en) - ltspice]上提供了使用`wine`的版本,目前版本为`24.1.0`.
=== 文档
查看手册:
```sh
open /usr/share/doc/ltspice/index.htm
```
一些其他资料:
- #link("https://cde.nus.edu.sg/ece/wp-content/uploads/sites/3/2024/09/LTspiceManual.pdf")[LTSPICE MANUAL for Teaching Module EE4415]
- #link("https://www.youtube.com/watch?v=JRcyHuyb1V0")[LTSpice Tutorial - EP1 Getting started - YouTube]
== 原理图
具有相同名称的端子具有相同的电位.
== 模拟
一定要记得给运放接电.
=== 瞬态仿真
通过数值积分得到电路响应,特别适合分析电容,运放等器件.
=== 网表文件格式
网表(netlist)描述待分析的电路.

- 以`*`开头的行都是注释,行中出现的`;`代表行中注释
- 最后一行通常为`.END`(可省略),其后的任何行都被认为是注释
- 大小写不敏感
- 忽略前导空白字符
- 第一个非空白字符定义电路元件的类型
= KiCAD
