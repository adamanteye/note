#import "../../note_zh.typ": *
#show: conf.with(
  title: "Linux逆向",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= LLDB使用
运行:
```sh
(lldb) run
```
附带参数运行:
```sh
(lldb) run ans
```
下断点:
```sh
(lldb) breakpoint set --name phase_2
```
步进:
```sh
(lldb) n
```
退出:
```sh
(lldb) q
```
