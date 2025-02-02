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

后缀`l`既表示`int`又表示`double`,不过因为浮点运算所用的指令,寄存器都和整数运算不同,所以不会混淆.
== Accessing Information
x86-64架构有16个64位的通用寄存器,它们既存储整数,也存储指针.

最初的8086处理器只有8个16位寄存器(从`%ax`到`%bp`).IA32扩展到32位,原先的8个16位寄存器变为8个32位寄存器(从`%eax`到`%ebp`).到了x86-64,所有寄存器扩展为64位,且增加了8个新的寄存器(从`%r8`到`%r15`).
#figure(
  table(
    columns: 5,
    table.hline(),
    table.header([`63`], [`31`], [`15`], [`7`], [Purpose]),
    table.hline(),
    [`%rax`], [`%eax`], [`%ax`], [`%al`], [Return value],
    [`%rbx`], [`%ebx`], [`%bx`], [`%bl`], [Callee saved],
    [`%rcx`], [`%ecx`], [`%cx`], [`%cl`], [4th argument],
    [`%rdx`], [`%edx`], [`%dx`], [`%dl`], [3rd argument],
    [`%rsi`], [`%esi`], [`%si`], [`%sil`], [2nd argument],
    [`%rdi`], [`%edi`], [`%di`], [`%dil`], [1st argument],
    [`%rbp`], [`%ebp`], [`%bp`], [`%bpl`], [Callee saved],
    [`%rsp`], [`%esp`], [`%sp`], [`%spl`], [Stack pointer],
    [`%r8`], [`%r8d`], [`%r8w`], [`%r8b`], [5th argument],
    [`%r9`], [`%r9d`], [`%r9w`], [`%r9b`], [6th argument],
    [`%r10`], [`%r10d`], [`%r10w`], [`%r10b`], [Caller saved],
    [`%r11`], [`%r11d`], [`%r11w`], [`%r11b`], [Caller saved],
    [`%r12`], [`%r12d`], [`%r12w`], [`%r12b`], [Callee saved],
    [`%r13`], [`%r13d`], [`%r13w`], [`%r13b`], [Callee saved],
    [`%r14`], [`%r14d`], [`%r14w`], [`%r14b`], [Callee saved],
    [`%r15`], [`%r15d`], [`%r15w`], [`%r15b`], [Callee saved],
    table.hline(),
  ),
  caption: [Integer registers],
)
寄存器可以按照1,2,4,8字节的方式被使用,对应不同的指令后缀.其中对于目标寄存器的更新,有这样的规则:
- 使用1,2字节的指令,目标寄存器的高位字节保持不动.
- 使用4字节的指令,目标寄存器的高位字节会被清零.

`%rsp`寄存器指向栈顶,其他15个寄存器的使用更为灵活.
=== Operand Specifiers
#figure(
  table(
    columns: 4,
    table.hline(),
    table.header([Type], [Form], [Operand value], [Name]),
    table.hline(),
    [Immediate], [$\$"Imm"$], [$"Imm"$], [Immediate],
    [Register], [$r_a$], [$R[r_a]$], [Register],
    [Memory], [$"Imm"$], [$M["Imm"]$], [Absolute],
    [Memory], [$(r_a)$], [$M[R[r_a]]$], [Indirect],
    [Memory], [$"Imm"(r_b)$], [$M["Imm"+R[r_b]]$], [Base + displacement],
    [Memory], [$(r_b, r_i)$], [$M[R[r_b]+R[r_i]]$], [Indexed],
    [Memory], [$"Imm"(r_b, r_i)$], [$M["Imm"+R[r_b]+R[r_i]]$], [Indexed],
    [Memory], [$(r_b, r_i, s)$], [$M[R[r_b]+R[r_i]dprod s]$], [Scaled indexed],
    [Memory], [$"Imm"(r_b, r_i, s)$], [$M["Imm"+R[r_b]+R[r_i]dprod s]$], [Scaled indexed],
    table.hline(),
  ),
  caption: [Operand forms],
) <operand-forms>
@operand-forms 中的$s$只能是`1`, `2`, `4`, `8`中的一个.
== Data Movement Instructions
#figure(
  table(
    columns: 2, table.hline(), table.header([Instruction], [Discription]),
    table.hline(),
    [`movb S, D`], [Move byte],
    [`movw S, D`], [Move word],
    [`movl S, D`], [Move double word],
    [`movq S, D`], [Move quad word],
    [`movabsq S, D`], [Move quad word],
    table.hline(),
  ),
  caption: [Simple data movement Instructions],
)
x86-64规定,移动指令的目标和源不能都是内存地址,如果确实有这样的需求,应当先将内存地址上的值加载到寄存器中,再从寄存器中存入内存地址.

= 附录
北大一位学长写了#link("https://github.com/Seterplus/CSAPP")[15年版本的Lab],代码很值得学习.
