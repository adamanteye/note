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
