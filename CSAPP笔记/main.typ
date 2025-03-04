#import "../note_zh.typ": *
#show: conf.with(
  title: "CSAPP 笔记",
  author: "adamanteye",
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

常量乘法的优化: 编译器会将`x * 14`这样的常量乘法优化为`(x >> 4) - (x >> 1)`.后面会提到#smcp[lea]指令,更详细地讨论这个问题.
== Floating Point
IEEE 754标准规定了浮点数与浮点运算,这套体系被称为IEEE浮点数.

二进制浮点数只能精确表示可以写成$x times 2^y$形式的小数.
=== IEEE Floating-Point Representation
IEEE浮点数使用以下表示:
$ V=(-1)^s M 2^E $
- $s$是符号位,对于表示`0`的情况则有特殊处理
- $M$的范围是$[0,1-epsilon)$或$[1,2-epsilon)$,位数记为$n$
- $E$的位数记为$k$
- 规定$"Bias"=2^(k-1)-1$
/ 32位浮点数: `23`位$M$, `8`位$E$
/ 64位浮点数: `52`位$M$, `11`位$E$
如何解读上述表述,分为3种情况:
/ Normalized Values: `exp`不是全`0`,也不是全`1`
  $ E&=e-"Bias"\ &=e_(k-1)dots e_1e_0-(2^(k-1)-1) $
  因此对于32位和64位浮点数,$E$的范围分别是$[-127,+128]$以及$[-1023,+1024]$.但考虑到这里`exp`不能是全`0`或者全`1`,因此最终为$[-126,+127]$以及$[-1022,+1023]$.

  `frac`解释为$M=1+f=1. f_(n-1)dots f_1 f_0$.这是为了无开销地增加一位精度.
/ Denormalized Values: `exp`全`0`
  $ E=1-"Bias",M=f $
  这种情况可以表示$+0.0$与$-0.0$,也利于表示非常接近$0.0$的数.
/ Special Values: `exp`全`1`
  - `frac`全`0`,表示$plus.minus infinity$
  - `frac`不是全`0`,称为`NaN`(Not a number)
从最大的Denormalized Value到最小Normalized Value的过渡是平滑的.此外,如果将浮点数解读为无符号整数,仍然保持原先的大小关系.这是有意设计,使得浮点数的排序可以转化为整数,然后进行排序.
=== Rounding
IEEE浮点数标准定义了4种修约(Rounding)模式:
#figure(
  caption: [Rounding Modes],
  table(
    columns: 2,
    table.hline(),
    table.header([Mode], [Description]),
    table.hline(),
    [Round-to-even], [find a closest match, or round either upward or downward such that the least significant digit of the result is even],
    [Round-toward-zero], [downward if greater than zero, upward otherwise],
    [Round-down], [$x^- <= x$],
    [Round-up], [$x^+ >= x$],
    table.hline(),
  ),
)
Round-to-even是最常用的模式,不会引入统计误差.
= Machine-Level Representation of Programs
如果想查看详细的机器指令,可以参考#link("http://ref.x86asm.net/coder64.html")[coder64 edition | X86 Opcode and Instruction Reference 1.12].
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

最通用的内存寻址模式是$"Imm"(r_b, r_i, s)$,这个表达式的值称为*effective address*.
#smcp[lea]指令可以计算这样的地址,并将地址加载到其他寄存器.
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
  caption: [Simple data movement instructions],
)
表中为#smcp[mov]系列.
例如:
```asm
movl $0x4050,%eax
movq %rax,-12(%rbp)
```
x86-64规定,移动指令的目标和源不能都是内存地址,如果确实有这样的需求,应当先将内存地址上的值加载到寄存器中,再从寄存器中存入内存地址.

注意`movl`如果以寄存器作为目标,会将高4字节置零,这是之前提到的规则.

除此之外还有#smcp[movz]和#smcp[movs]系列,分别为zero-extending以及sign-extending.
== Pushing and Popping Stack Data
x86-64中,栈由高位向低位增长,也就是栈顶的地址反而更小.栈指针为`%rsp`.

#smcp[push]和#smcp[pop]指令的作用如下:
```asm
pushq %rbp
```
相当于
```asm
subq $8,%rsp
movq %rbp,(%rsp)
```
== Arithmetic and Logical Operations
#figure(
  caption: [Integer arithmetic operations],
  table(
    columns: 4, table.hline(),
    table.header([Instr], [Operand], [Effect], [Description]), table.hline(),
    [`leaq`], [ `S, D`], [`D <- &S`], [Load effective address],
    table.hline(),
    smcp[inc], [ `D`], [`D <- D + 1`], [Increment],
    smcp[dec], [ `D`], [`D <- D - 1`], [Decrement],
    smcp[neg ], [`D`], [`D <- -D`], [Negate],
    smcp[not ], [`D`], [`D <- ~D`], [Complement],
    table.hline(),
    smcp[add ], [`S, D`], [`D <- D + S`], [Add],
    smcp[sub ], [`S, D`], [`D <- D - S`], [Substract],
    smcp[imul], [`S, D`], [`D <- D * 1`], [Multiply],
    smcp[xor], [`S, D`], [`D <- D - 1`], [Exclusive-or],
    smcp[or], [`S, D`], [`D <- D | S`], [Or],
    smcp[and], [`S, D`], [`D <- D & S`], [And],
    table.hline(),
    smcp[sal], [`k, D`], [`D <- D << k`], [Left shift],
    smcp[shl], [`k, D`], [`D <- D << k`], [Left shift(same as #smcp[sal])],
    smcp[sar], [`k, D`], [`D <- D >> k`], [Arithmetic right shift],
    smcp[shr], [`k, D`], [`D <- D >> k`], [Logical right shift],
    table.hline(),
  ),
)
== Control
=== Condition Codes
/ `CF`: Carry flag. The most recent operation generated a carry out of the most significant bit. Used to detect overflow yielded zero.
/ `ZF`: Zero flag. The most recent operation yielded zero
/ `SF`: Sign flag. The most recent operation yielded a negative value.
/ `OF`: Overflow flag. The most recent operation caused a two's-complement overflow: either negative or positive.
注意`leaq`不对上面四个标志产生影响,因为操作的是"内存地址".
#figure(
  caption: [Comparsion and test instructions],
  table(
    columns: 3, table.hline(),
    table.header([Instr], [Operand], [Based on]), table.hline(),
    smcp[cmp], [`S1, S2`], [`S2 - S1`],
    smcp[test], [`S1, S2`], [`S2 & S1`],
    table.hline()
  ),
)
#smcp[cmp]与#smcp[test]只会操作四个标志,不修改操作数.

#smcp[test]常用于测试单个寄存器是否满足某条件,例如:
```asm
testq %rax,%rax
```
#figure(
  caption: [The #smcp[set] instructions],
  table(
    columns: 4, table.hline(),
    table.header([Instr], [Synonym], [Effect], [Set condition]), table.hline(),
    [`sete D`], [`setz`], [`D <- ZF`], [Zero],
    [`setne D`], [`setnz`], [`D <- ZF`], [Not zero],
    table.hline(),
    [`sets D`], [], [`D <- SF`], [Negative],
    [`setns D`], [], [`D <- ~SF`], [Nonnegative],
    table.hline(),
  ),
)
= 附录
北大一位学长写了#link("https://github.com/Seterplus/CSAPP")[15年版本的Lab],代码很值得学习.
