#import "../../note_zh.typ": *
#show: conf.with(
  title: "群论笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 群的基本概念
== 群
#def("群")[
  设$G$是一些元素的集合,记为$G={dots,g,dots}$,如果$G$中定义的二元运算$a*b$满足下面条件:
  + 封闭性: $forall a,b in G,a*b in G$
  + 结合律: $forall a,b,c in G,(a*b)*c=a*(b*c)$
  + 唯一单位元: 存在唯一的$e$,使得$forall f in G,e*f=f*e=f$
  + 逆元存在: $forall f in G,exists f^(-1) in G,f^(-1)*f=f*f^(-1)=e$
  那么称$G$是一个群.
]
#exmp("空间反演群")[
  定义$E$作用在三维欧氏空间的向量$va(r)$上得到$va(r)$.
  $I$作用在$va(r)$上得到$-va(r)$.

  那么${E,I}$形成一个群,称为空间反演群.
]
#exmp([$n$阶置换群])[]
#exmp([$D_3$群])[]
#exmp("整数群")[定义加法为整数集合中的二元运算,那么全体整数构成一个群.]
#def("群的阶")[
  记$abs(G)$为群内元素的个数,称为群的阶.

  群的阶有限时,称为*有限群*.反之称为*无限群*.
]
#def("Abel群")[当群的二元运算可以交换时,称为Abel群.]
#thm("重排定理")[
  对$forall u in G$,当$g_alpha$取遍$G$中所有元素时,有$u*g_alpha$不重复地给出$G$中所有元素.
]
#proof[
  首先证明可给出所有元素:

  对$forall g_beta in G$,可以取$g_alpha=u^(-1)g_beta in G$.

  其次反证法证明不重复:

  设有$g_alpha!=g_alpha'$,使得$u*g_alpha=u*g_alpha'$,则有$u^(-1)*u*g_alpha=u^(-1)*u*g_alpha'$,得出$g_alpha=g_alpha'$,矛盾.
]
