#import "../note_zh.typ": *
#show: conf.with(
  title: "CSAPP 笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)

= Representing and Manipulating Information
== Integer
补码表示中,只有`0`的负数表示是它自身.可以利用这一点,依靠符号位判断是`0`或者不是`0`.

```C
int logicalNeg(int x) {
    int a = x | (~x + 1);
    return (a >> 31) + 1;
}
```
