#import "../../../note-zh.typ": *
#show: conf.with(
  title: "人工神经网络",
  author: "adamanteye",
)
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
  $ E_k = 1 / 2 (t_k-y_k)^2 \ E=sum_k E_k $
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
  Gradient output of neuron $j$ in layer $l$ is $ delta_j^l=pdv(E, u_j^l) $
]
#def("Gradient Input")[
  Gradient input of neuron $j$ in layer $l$ is $ pdv(E, w_(k j)^l)=pdv(E, u_j^l)pdv(u_j^l, w_(k j)^l)=delta_j^l y_k^(l-1) $
]
