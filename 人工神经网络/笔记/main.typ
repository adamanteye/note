#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = "人工神经网络笔记"
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

#set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])

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

#show: rest => columns(2, rest)

= 感知机
== 符号
/ $u_j$: weighted sum of the input to neuron $j$
/ $y_j$: output of neuron $j$
/ $w_(k j)$: weight between neuron $k$ (layer $l$) to neuron $j$ (layer $l+1$)
/ $t_k$ or $l_k$: golden label
/ $E(n)$: error or loss on one sample $n$
== 激活函数
#link("https://paperswithcode.com/methods/category/activation-functions")[activation functions]
== 梯度下降
$eta$称为学习率(learning rate)
$ x'=x-eta f' (x) $
== 错误传播
#def("Mean Square Error")[
  $ E_k = 1/2 (t_k-y_k)^2 \ E=sum_k E_k $
]
#def("Cross Entropy")[
  $ E_k = -t_k log(y_k) \ E=sum_k E_k $
]
== 反向传播
Steps of BP is:
+ compute the local gradients
+ compute the upstream gradients (Gradient Output) from next operator unit
+ apply chain rule to compute downstream gradients (Gradient Input) of local inputs
+ repeat the same procedure on the back operator units
#def("Gradient Output")[
  Gradient output of neuron $j$ in layer $l$ is $ delta_j^l=pdv(E,u_j^l) $
]
#def("Gradient Input")[
  Gradient input of neuron $j$ in layer $l$ is $ pdv(E,w_(k j)^l)=pdv(E,u_j^l)pdv(u_j^l,w_(k j)^l)=delta_j^l y_k^(l-1) $
]