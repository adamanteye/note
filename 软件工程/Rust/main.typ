#import "../../note_zh.typ": *
#show: conf.with(
  title: "Rust编程笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 文档及参考
== 手册
- #link("https://cheats.rs/")[Rust单页手册]
== 代码规范
- #link("https://rust-lang.github.io/api-guidelines/")[Rust API Guidelines]
=== 命名
`crate`的命名应当为`snake_case`,更多讨论参考#link("https://github.com/rust-lang/api-guidelines/discussions/29")[Naming convention for crates · rust-lang/api-guidelines · Discussion #29]
== 性能
- #link("https://nnethercote.github.io/perf-book/")[The Rust Performance Book]
= 调试技巧
#link("https://doc.rust-lang.org/std/macro.dbg.html")[dbg!]宏用于打印到`stderr`.
可以在`cargo test`下使用,也可以调试release构建下出现的问题.
= 异步
参考:
- #link("https://www.tisonkun.org/2023/11/05/async-rust/")[Async Rust 的实现 | 夜天之书]
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
- #link("https://lib.rs/crates/nom")[Nom — Parser]
- #link("https://github.com/zesterer/chumsky")[zesterer/chumsky: Write expressive, high-performance parsers with ease]
=== chumsky
`chumsky`是一个#link("https://en.wikipedia.org/wiki/Parsing_expression_grammar")[PEG]解析器.
- `choice`选择第一个成功匹配的,注意安排优先级
- `to_slice`会把整个解析器的输入范围都捕获为原始字符串,所以应该放在可能有的`then_ignore`之前
== 网页服务器
自己一直习惯用`axum`来着,虽然上手会费劲一点,但感觉逻辑还是很自洽的,其他著名的库还有`actix-web`, `poem`, `rocket`,前者开发不顺,后两者没有试过.

此外,支持OpenAPI规范的`utoipa`也是简化文档编写的利器.
