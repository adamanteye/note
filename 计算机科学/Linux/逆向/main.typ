#import "../../../note-zh.typ": *
#show: conf.with(
  title: "Linux逆向",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= ELF逆向
== 程序头
```sh
readelf -l|--program-headers <binary>
```
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
== LLDB
参考:
- #link("https://lldb.llvm.org/use/map.html")[GDB to LLDB command map - LLDB]
=== 运行
```
(lldb) r(un)
```
附带参数运行:
```
(lldb) r(un) ans
```
=== 断点
下断点:
```
(lldb) br(eakpoint) s(et) --name/-n phase_2
(lldb) b phase_2
(lldb) br(eakpoint) s(et) --address/-a 4017a8
```
查看所有断点:
```
(lldb) br(eakpoint) l(ist)
```
删除断点:
```
(lldb) br(eakpoint) del(ete) 1
```
=== 执行
步进:
```
(lldb) s(tep)
(lldb) si|stepi
```
步过:
```
(lldb) n(ext)
(lldb) ni|nexti
```
直到下一个断点:
```
(lldb) c(ontinue)
```
栈回溯:
```
(lldb) bt
```
=== 寄存器
查看通用寄存器:
```
(lldb) re(gister) r(ead)
(lldb) re(gister) r(ead) rsp
```
为寄存器写入十进制值:
```
(lldb) re(gister) w(rite) rax 123
```
=== 内存
检查所属的内存区域:
```
(lldb) memory region 55619b28
```
查看内存:
```
(lldb) m(emory) read --format y --size 1 --count 16 $rsp
```
=== 退出
```
(lldb) q
```
== Binary Ninja
注意默认以简化Intel格式显示x86-64汇编,可改为AT&T格式.
