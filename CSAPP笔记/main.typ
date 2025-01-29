#import "../note_zh.typ": *
#show: conf.with(
  title: "CSAPP 笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)

= Representing and Manipulating Information
== Integer
`char`类型是`signed`还是`unsigned`,取决于编译器(大部分编译器认为是`signed`).如果需要明确指定,可以使用`signed char`或者`unsigned char`.

移位运算是从左到由结合的.
- `<< k`表示左移$k$位.
- `>> k`表示右移$k$位.如果是逻辑右移,填充`0`.如果是算术右移,填充最高位.
C 标准没有规定有符号数的右移是算术的还是逻辑的,但几乎所有编译器-平台对有符号数执行算术右移.

无符号数的表示:
$ "B2U"_w (va(x)):=sum_(i=0)^(w-1)x_i 2^i $

有符号数(补码)的表示:
$ "B2T"_w (va(x)):=-x_(w-1)2^(w-1)+sum_(i=0)^(w-2)x_i 2^i $

两者间的转换:
$ "T2U"_w(x)&=x+x_(w-1)2^w\ "U2T"_w(x)&=x-x_(w-1)2^w $

无符号数必须执行逻辑右移.

/ 微妙的特例: 补码表示中,只有`0`和`0x80000000`的负数表示是它自身.

+ 可以依靠符号位判断是`0`或者不是`0`.
  ```C
  int logicalNeg(int x) {
      int a = x | (~x + 1);
      return (a >> 31) + 1; // 等价于 !x
  }
  ```
+ 对于`x`, `y`同号的减法(肯定不会溢出),为了处理`x`是`0x80000000`的边界情况,需要写成`~x+y-1`.

常量乘法的优化: 编译器会将`x * 14`这样的常量乘法优化为`(x >> 4) - (x >> 1)`.后面会提到`lea`指令,更详细地讨论这个问题.
== Floating Point
= Machine-Level Representation of Programs
== Historical Perspective
8086(1978, 29K晶体管)是第一代x86系列处理器, 16位寄存器. i386(1985, 275K晶体管)扩展到32位,成为第一个可以运行UNIX的x86处理器. Pentium 4E(2004, 125M晶体管)引入超线程技术与EM64T(现在称为x86-64). Core i7, Sandy Bridge(2011, 1.16B晶体管)引入了AVX指令集.
== Program Encodings
对`gcc`或`clang`, `-S`编译选项输出汇编文件(以`.s`结尾). `-c`编译选项输出目标文件(以`.o`结尾). `-o`编译选项指定输出文件名.

ATT格式(`gcc`, `objdump`的默认格式)与Intel格式(Intel, 微软的默认格式)都是汇编语言的表示方式. Intel格式中操作数逆向排列.

如果要在C中使用汇编代码,可以通过`asm`关键字内联使用,也可以链接汇编文件.
== Data Formats
#figure(
  table(
    columns: 4,
    table.hline(),
    table.header([C declaration], [Intel data type], [Assembly-code suffix], [Size(bytes)]),
    table.hline(),
    [`char`], [Byte], [b], [1],
    [`short`], [Word], [w], [2],
    [`int`], [Double word], [l], [4],
    [`long`], [Quad word], [q], [8],
    [`char *`], [Quad word], [q], [8],
    [`float`], [Single precision], [s], [4],
    [`double`], [Double precision], [l], [8],
    table.hline(),
  ),
  caption: [Size of C data types in x86-64],
)
x86历史上实现过`10`字节的浮点数扩展,在C中通过声明`long double`使用.#footnote[#link("https://en.wikipedia.org/wiki/Long_double")[long double - Wikipedia]]但如果不是x86平台,那么`long double`可能回退到`double`,并且`10`字节浮点数的性能也不如`float`或`double`.
= 附录
北大一位学长写了#link("https://github.com/Seterplus/CSAPP")[15年版本的Lab],代码很值得学习.
