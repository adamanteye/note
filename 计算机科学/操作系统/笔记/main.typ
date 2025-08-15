#import "../../../note-zh.typ": *
#show: conf.with(
  title: "操作系统笔记",
  author: "adamanteye",
)
= 内核概述
内核是硬件和技术之间的一个中间层.作用是将应用程序的请求传递给硬件,充当底层驱动程序,对系统中的各种设备和组件进行寻址.

/ 微内核: 最基本的功能由中央内核(微内核)提供,其他功能都委托给一些独立进程,通过独立接口与中心内核通信.
/ 宏内核: 传统方法,子系统都可以被互相访问.
- #link(
    "https://linux-kernel-labs.github.io/refs/heads/master/index.html",
  )[Linux Kernel Teaching]
== 其他
#figure(
  table(
    columns: 2,
    table.hline(),
    [L1 cache reference], [0.5 ns],
    [Branch mispredict], [5 ns],
    [L2 cache reference], [7 ns],
    [Mutex lock/unlock], [25 ns],
    [Main memory reference], [100 ns],
    [Compress 1K bytes with Zippy], [30,00 ns],
    [Send 2K bytes over 1 Gbps network], [20,000 ns],
    [Read 1 MB sequentially from memory], [250,000 ns],
    [Round trip within same datacenter], [500,000 ns],
    [Disk seek], [10,000,000 ns],
    [Read 1 MB sequentially from disk], [20,100,000 ns],
    table.hline(),
  ),
  caption: "Numbers Everyone Should Know",
)
