#import "../../note_zh.typ": *
#show: conf.with(
  title: "Rust编程笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)

- #link("https://cheats.rs/")[Rust单页手册]
= 调试技巧
#link("https://doc.rust-lang.org/std/macro.dbg.html")[dbg!]宏用于打印到`stderr`.
可以在`cargo test`下使用,也可以调试release构建下出现的问题.
= 超好用的库
== 错误处理
- #link("https://github.com/dtolnay/anyhow")[dtolnay/anyhow: Flexible concrete Error type built on std::error::Error]
== 输入输出
- #link("https://github.com/kkawakam/rustyline")[kkawakam/rustyline: Readline Implementation in Rust]
- #link("https://github.com/nukesor/comfy-table")[Nukesor/comfy-table: Build beautiful terminal tables with automatic content wrapping]
- #link("https://github.com/clap-rs/clap")[clap-rs/clap: A full featured, fast Command Line Argument Parser for Rust]
== 异步
无脑tokio全家桶就对了:
- #link("https://github.com/tokio-rs/tokio")[tokio-rs/tokio: A runtime for writing reliable asynchronous applications with Rust. Provides I/O, networking, scheduling, timers, ...]
支持并发读写的容器:
- #link("https://github.com/xacrimon/dashmap")[xacrimon/dashmap: Blazing fast concurrent HashMap for Rust]
== 并行
多线程并行化:
- #link("https://github.com/rayon-rs/rayon")[rayon-rs/rayon: Rayon: A data parallelism library for Rust]
== 内存分配
- #link("https://github.com/purpleprotocol/mimalloc_rust")[purpleprotocol/mimalloc_rust: A Rust wrapper over Microsoft's MiMalloc memory allocator]
== 解析器
- #link("https://github.com/zesterer/chumsky")[zesterer/chumsky: Write expressive, high-performance parsers with ease]
