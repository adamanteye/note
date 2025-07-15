#import "../../../note_zh.typ": *
#show: conf.with(
  title: "Linux逆向",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= ELF逆向
== 符号表
```sh
nm -s|--print-armap <binary>
```
或
```sh
readelf -s <binary>
```
对应地,通过
```sh
strip -s|--strip-all <binary>
```
擦除符号.

如果想要查看特定段的hexdump:
```sh
readelf -x .data <binary>
```
== 返回导向编程
可执行程序中大量存在以`ret`结尾的可资利用的片段,称为gadget.一些工具可以对此进行查找,例如#link("https://github.com/JonathanSalwan/ROPgadget")[ROPgadget].
= 工具
== LLDB使用
参考:
- #link("https://lldb.llvm.org/use/map.html")[GDB to LLDB command map - LLDB]
运行:
```sh
(lldb) r(un)
```
附带参数运行:
```sh
(lldb) r(un) ans
```
下断点:
```sh
(lldb) br(eakpoint) s(et) --name/-n phase_2
(lldb) b phase_2
```
查看所有断点:
```sh
(lldb) br(eakpoint) l(ist)
```
删除断点:
```sh
(lldb) br(eakpoint) del(ete) 1
```
步进:
```sh
(lldb) s(tep)
```
步过:
```sh
(lldb) n(ext)
```
栈回溯:
```sh
(lldb) bt
```
查看通用寄存器:
```sh
(lldb) re(gister) r(ead)
```
为寄存器写入十进制值:
```sh
(lldb) re(gister) w(rite) rax 123
```
退出:
```sh
(lldb) q
```
== Binary Ninja
注意默认以简化Intel格式显示x86-64汇编,可改为AT&T格式.
