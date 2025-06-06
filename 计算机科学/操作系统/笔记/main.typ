#import "../../../note_zh.typ": *
#show: conf.with(
  title: "操作系统笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 导论
#figure(
  table(
    columns: 2, table.hline(),
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
