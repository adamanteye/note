#import "../../note_zh.typ": *
#show: conf.with(
  title: "模数电路工具",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= LTSpice
== 关于
`LTSpice`是Analog Devices, Inc.开发的软件,集成有模拟器.

一般的工作流程为在LTSpice中创建原理图(schematic),然后将其导出为网表(netlist).网表是模拟器(simulator)的输入文件.
=== 安装
#link("https://aur.archlinux.org/packages/ltspice")[AUR (en) - ltspice]上提供了使用`wine`的版本,目前版本为`24.1.0`.
=== 文档
查看手册:
```sh
open /usr/share/doc/ltspice/index.htm
```
一些其他资料:
- #link("https://cde.nus.edu.sg/ece/wp-content/uploads/sites/3/2024/09/LTspiceManual.pdf")[LTSPICE MANUAL for Teaching Module EE4415]
== 原理图
== 模拟
= KiCAD
