#set text(
  font: ("Libertinus Serif", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = "核工程原理笔记"
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

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

= 核反应
/ 易裂变材料: 无论轰击的中子能量有多大，都会发生裂变的材料。
/ 增值材料: 通过俘获中子，并通过放射性衰变嬗变到易裂变材料的材料
#def("微观截面")[
中子与单个原子核发生相互作用概率的一种度量
]
#def("宏观截面")[
$ Sigma=N sigma $
中子与单位体积中的所有原子核发生相互作用(核反应)的概率的一种度量
]
== 描述中子的几个宏观量
#def("角中子数密度")[
位于物理空间$va(r)$处单位几何体积内与速度空间$va(v)$处单位速度体积内期望的自由中子数量,它是某个运动速度附近的中子数密度,也是一个宏观量,具有量纲$"m"^(-6)"s"^3$
$ n(va(r),va(v))dd(va(r))dd(va(v))=n(va(r),va(v))dd(va(r))v^2dd(v)dd(va(Omega))=n(va(r),va(v),va(Omega))dd(va(r))dd(v)dd(Omega)\ =n(va(r),E,va(Omega))dd(va(r))dd(E)dd((va(Omega))) $
] <angular_neutron_density>
#def("中子数密度")[
对@angular_neutron_density 在速度空间积分得到
$ n(va(r))=integral_va(v)n(va(r),va(v))dd(va(v)) $
量纲为$"m"^(-3)$.
]
#def("角中子注量率")[
位于物理空间$va(r)$处单位几何体积内与速度空间$va(v)$处单位速度体积内的中子,在单位时间内穿过垂直于$va(v)$的单位面积的中子数.
$ psi(va(r),va(v))=v n(va(r),va(v)) $其中$v$是速率.角中子注量率的量纲是$"m"^(-2)"s"^(-1)$
]
#def("中子注量率")[
对角中子注量率进行速度空间内所有方向的积分可以得到与中子速率相关的中子注量率
$ phi(va(r),v)=integral_(4pi)psi(va(r),v,va(Omega))dd(Omega) $
若再对速率积分,得到与速率无关的三维物理空间上的中子注量率,有
$ phi(va(r))&=integral_0^infinity phi(va(r),v)dd(v)\ &=integral_va(v) v n(va(r),va(v)) dd(v)\ &= n(va(r))overline(v) $
$phi(va(r))$表示空间$va(r))$处中子数密度与中子平均速率之乘积,它是标量不是矢量,表示单位时间内从所有方向进入以空间某点为中心的单位小球的中子数与球体赤道截面积之比.常用单位是$"cm"^(-2)"s"^(-1)$.

中子注量率的大小直接反映堆芯内核反应功率的大小，在热中子动力堆内，热中子注量率的数量级一般为$10^(13)~10^(15)$ $"cm"^(-2)"s"^(-1)$.
] <neutron_flux>
#def("净中子流密度")[
净中子流密度是标量,定义为单位时间内穿过方向为$vu(n)$的单位面积的中子数.常用单位是$"cm"^(-2)"s"^(-1)$.
$ J(va(r))&=integral_va(v) vu(n) dprod va(Omega)psi(va(r),va(v))\ &=vu(n) dprod integral_va(v) va(Omega)psi(va(r),va(v))\ &=vu(n) dprod va(J)(va(r)) $
]
= 中子能谱
确定慢化时间,要从中子能谱开始.
/ 热谱:
/ 快谱:
中子能谱以中子数密度表示
$n'''(E)dd(E)$是在$E$与$E+dd(E)$之间的中子数,满足归一化条件
$ n'''=integral_0^infinity n'''(E)dd(E) $
#def("中子通量")[
  $ phi(E)=nu(E)n'''(E) $
]
类似地,宏观截面相应的物理诠释是 $Sigma_X (E)$是能量为$E$的一个中子闯过单位长度时,发生$X$型反应的最可几数目

反应类型$X$的所有中子碰撞最可几数目$ integral_0^infinity Sigma_X (E) phi(E)dd(E) $
能量为$E$的中子在单位时间和单位体积内所有核组分的反应最可几数目
#thm("中子通量的平衡方程")[
  $ Sigma_a (E)phi(E)=integral_0^infinity p(E'->E) Sigma_S(E')phi(E')dd(E')+chi (E) s'''_f $
] <balance_eq>

平衡方程的解可以给出中子的慢化谱.但是在大多数情况下,该方程无法求出精确解

为了从平衡方程中近似解出中子流强随能量的变化规律(中子的慢化谱),需要分区讨论.

慢化谱是其中的$f(E)$ $ t_"慢化"=integral_0^infinity t f(E) dd(E) $

平衡方程@balance_eq 的右边两项均有贡献,对于快中子,第一项可以忽略,因此快中子的慢化谱是容易确定的.

但对于中能中子,第一项不可忽略,中子在中能区具有相当多的共振峰.
== 中能中子
定义慢化(流)密度是从能量$E$慢化的中子数目/cm^3/s

$ q(E)=-integral_E^infinity Sigma_a (E') phi(E')dd(E')+s'''_f integral_E^infinity chi (E')dd(E') $

对于中能中子,$s'''_f integral_E^infinity chi (E')dd(E')$为$s'''_f$

方程两边求导,得到$ dv(,E) q(E)=Sigma_a (E) phi(E) $

在某些区间, $Sigma_a (E)=0$, 慢化近似为常量

进一步地,

$ q(E)=xi C= (1+alpha/(1-alpha)ln(alpha)) $

== 裂变中子能谱
裂变中子不是单能的,其能量分布范围很宽,平均能量是2MeV.

通常认为裂变中子是各向同性的.
$ chi(E)=0.453e^(-1.036E)sinh(sqrt(2.29E)) ["MeV"] $
= 中子的扩散与输运方程
== 中子的扩散方程
在处理中子的空间分布中,将只考虑单能或单一能量群模型.意味着中子的流强与截面已经对能量求过平均了.中子的扩散方程在确定中子的空间分布方面提供了最直截了当的近似.

#thm("中子数守恒方程")[
$ pdv(n(va(r),t),t)=s'''(va(r),t)-Sigma_a phi(va(r),t)-div va(J)(va(r),t) $
其中$Sigma_a phi(va(r),t)$称为吸收率.
]

#thm("空间中子平衡")[
在稳定态条件下中子数守恒要求:

泄漏+吸收+散射=发射+裂变

利用中子流密度与偏微分的定义,每秒泄漏的数目为
$ div va(J) dd(x,y,z) $
每秒吸收的中子数为
$ Sigma_a (x,y,z) phi(x,y,z) dd(x,y,z) $
每秒发射的中子数为
$ s'''_f(x,y,z) dd(x,y,z) $
每秒裂变的中子数为
$ v Sigma_f (x,y,z) phi(x,y,z)dd(x,y,z) $

平衡方程为$ div va(J) (va(r))+Sigma_a (va(r))phi(va(r))=s'''(va(r))+v Sigma_f (va(r)) phi(va(r)) $
] <neutron_balance>
#thm("Fick")[
$ va(J)(va(r))=-D grad n(va(r)) $
其中$D$表示扩散系数
] <fick>
#thm("中子扩散方程")[
考虑到@fick,@neutron_balance 可以写成
$ - div D(va(r))grad phi(va(r))+Sigma_a (va(r))phi(va(r))=s'''(va(r))+v Sigma_f (va(r)) phi(va(r)) $
] <neutron_diffusion>
#thm("单能中子扩散方程")[
如果中子是单能的,即所有中子具有同一微观速率,利用@fick 可以得到
$ -1/v pdv(phi(va(r),t),t)=s'''(va(r),t)-Sigma_a phi(va(r),t)+div (D grad phi(va(r),t)) $
]
=== 均匀介质中的扩散


=== 非增殖介质中的扩散
先讨论无可裂变材料,也就是非增殖介质的均匀介质的情况.

#def("扩散长度")[
$ L=sqrt(D/Sigma_a) $
具有长度的量纲
]

因此, $Sigma_f=0$且$D$与$Sigma_a$为常量,使得@neutron_diffusion 变为
$ -laplacian phi(va(r))+1/L^2 phi(va(r))=1/D s'''(va(r)) $
