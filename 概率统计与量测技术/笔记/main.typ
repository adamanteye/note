#set text(
  font: ("Libertinus Serif", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = "概率统计与量测技术笔记"
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

// #set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])

#let pst = thmbox(
  "thm",
  "公设",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph
)
#let def = thmbox(
  "thm",
  "定义",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph
)
#let thm = thmbox(
  "thm",
  "定理",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph
)
#let coll = thmbox(
  "coll",
  "推论",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: "thm",
)
#let exmp = thmbox("exmp", "例", titlefmt: emph)
#let sol = thmplain("sol", "解答", titlefmt: emph, base: "exmp").with(numbering: none)
#let proof = thmproof(
  "proof",
  "证明",
  titlefmt: emph,
  base: "thm"
)

#align(center, text(17pt)[
  *#title*
])

#align(center, text(15pt)[
  #thisauthor
])

#set par(leading: 1em)
#set block(spacing: 1.5em)

#show: rest => columns(2, rest)
= 集合以及事件
#def([$sigma$-field])[
  $sigma$-field, or $sigma$-algebra, is a collection of subsets of a set $S$ that is closed under countable unions, countable intersections, and complements.
]
#thm()[
  Let $cal(O)$ be one of the 8 set operations, let ${cal(C)_t,t in T}$ be an indexed family of subsets such that for each $t$, $cal(C)_t$ is closed under $cal(O)$. Then
  $ cal(C)=sect_(t in T) "is closed under" cal(O) $
]
#coll()[
  The intersection of a $sigma$ fields is a $sigma$ field.
]
#def([minimal $sigma$-field])[
  Let $cal(C)$ be a collection of subsets of $Omega$. The $sigma$-field generated by $cal(C)$, denoted by $sigma(cal(C))$, is a $sigma$-field satisfying the following conditions:
  - $cal(C) subset sigma(cal(C))$
  - If $cal(B)'$ is some other $sigma$-field containing $cal(C)$, then $sigma(cal(C)) subset cal(B)'$
]
#thm()[
  Given a class $cal(C)$ of subsets of $Omega$, there exists a unique smallest $sigma$-field containing $cal(C)$.
]
#def("Borel Sets")[
  Suppose $Omega=RR$ and let $ cal(C)={(a,b]-infinity<=a<=b<=+infinity} $ Then $cal(B)(RR):=sigma(cal(C)) $ the Borel subsets of $RR$.

  There are many equivalent ways to define the Borel sets.
]
= 随机事件与概率
#def("事件域")[
  设$S$为样本空间,$cal(F)$为$S$的某些子集组成的集合类.如果$cal(F)$满足下列条件,称$cal(F)$为$S$的一个事件域.
  - $S in cal(F)$
  - $A in cal(F) -> overline(A) in cal(F)$
  - $A_n in cal(F),n=1,2,dots -> union.big_(n=1)^K A_n in cal(F)$
]
#def("概率")[
  1933 年柯尔莫哥洛夫(Kolmogorov)基于集合论给出.

  设$S$为样本空间,$cal(F)$是由$S$的某些子集组成的一个事件域.如果对任意事件$A in cal(F)$,定义在$cal(F)$上的一个实值函数$P(A)$满足
  / 非负性公理: $A in cal(F) -> P(A)>=0$
  / 正则性公理(规范性公理): $P(S)=1$
  / 可列可加性公理: 若$A_1,A_2,dots,A_n,dots$互斥,则$P(union.big_(i=1)^infinity A_i)=sum_(i=1)^(infinity)P(A_i)$
  那么称$P$为概率.$(S,cal(F),P)$为概率空间.
]
== 几何概型
古典概型的局限是样本空间离散,基本事件数有限.

当随机试验的样本空间是某连续区域$S$,并且任意一点落在度量(长度,面积,体积)相同的子区域是等可能的,则事件$A$的概率可定义为
$ P(A)=m(A)/m(S) $
几何概型基于现代的 "测度" 的概念,
== 贝叶斯概率
贝叶斯概率的样本空间中的样本点为一系列 "假设(hypotheses)",
= 连续型随机变量
#def("连续型随机变量")[
  设$X$是随机变量,若存在一个非负可积函数$f(x)$,使得$ F(x)=integral_(-infinity)^x f(t) dd(t),-infinity<x<+infinity $
  则称$X$是连续性随机变量,函数$F(x)$是它的分布函数,函数$f(x)$是它的概率密度函数,简称概率密度或密度函数.
]
分布函数的有用之处在于,把连续型随机变量与离散型随机变量统一了起来.
#def("指数分布")[
  设$X$是一个连续型随机变量,若它的概率密度函数为
  $ f(x)=cases(lambda e^(-lambda x) &"if" x>0,0 &"if" x<=0) $
  则称$X$服从参数为$lambda$的指数分布,记为$X~"Exp"(lambda)$.
]
常作为各种 "寿命" 分布的近似
- 不稳定粒子的寿命
- 无线电元件的寿命
#thm("指数分布无记忆")[
  若$X~"Exp"(lambda)$,则$P(X>s+t|X>s)=P(X>t)$. 指数分布是 "永远年轻" 的分布.
]
#proof[
  $ P(X>s+t|X>s)=&P(X>s+t)/P(X>s)\ =&(1-P(X<=s+t))/(1-P(X<=s))\ =&(1-F(s+t))/(1-F(s))\ =&e^(-lambda(s+t))/e^(-lambda s)\ =&e^(-lambda t)=P(X>t) $
]
指数分布作为 "寿命" 分布的近似,并不是例如人的寿命的实际分布.

几何分布作为也是无记忆的,可以认为是离散型随机变量中的无记忆分布.

离散型随机变量是右连续的.

= 二维随机变量

注意$X$,$Y$来自同一个样本空间,意味着$X$,$Y$可以不独立.

#def("Khinchin")[辛钦大数定律]
#def("Bernoulli")[伯努利大数定律]

= 极限定理
极限定理是概率论的核心内容之一.
/ 中心极限定理: 什么条件下$sum_(i=1)^n X_i$的分布收敛于正态分布
  - 独立不同分布
    - 李雅普诺夫
  - 独立同分布
    - 林德伯格-列维
    - 棣莫弗-拉普拉斯
#thm("Lindberg Levi")[
假设随机变量序列$X_1,X_2,dots$独立同分布,且数学期望和方差存在$ E(X_k)=mu, "Var"(X_k)=sigma^2>0 $
则随机变量之和$X=:sum_(k=1)^n X_k$的标准化变量
$ Y_n=(X-n mu)/(sqrt(n)sigma) $
的分布函数$F_n (x)$对于任意实数$x$满足
$ lim_(n->infinity) F_n(x)=integral_(-infinity)^x 1/sqrt(2pi) e^(-t^2/2) dd(t)=Phi(x) $
$n$足够大时, $X$近似服从$N(n mu,n sigma^2)$
]
#thm("De Moivre Laplace")[
这是Lindberg-Levi中心极限定理的二项分布特例.

设$Y_n~b(n,p), 0<p<1, n=1,2,dots$,则对任一实数$x$,有
$ lim_(n->infinity) P((Y_n-n p)/sqrt(n p(1-p))<=x)=1/sqrt(2pi)integral_(-infinity)^x e^(-t^2/2) dd(t)=Phi(x) $
]
