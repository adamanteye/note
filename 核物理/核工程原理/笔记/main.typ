#import "../../../note_zh.typ": *
#show: conf.with(
  title: "核工程原理笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 前言
说实话不太想上核工程原理,因为怀疑未来用不上这些知识,有时间不如学一学电子学的东西.但听闻部分系里的老师坚持认为工物系的学生要会核工程,所以这门课始终留在必修里.

在核工程的三个平行课堂里,李泽光的评价最好(看过好心同学分享的幻灯片,对学生友好),其次余纲林,最后是王侃.
= 核反应
/ 易裂变材料: 无论轰击的中子能量有多大，都会发生裂变的材料。
/ 增值材料: 通过俘获中子，并通过放射性衰变嬗变到易裂变材料的材料
#def("微观截面")[
  中子与单个原子核发生相互作用概率的一种度量

  散射截面是不能直接测量的,通过总截面减去其他反应道截面得到.
]
#def("宏观截面")[
  $ Sigma=N sigma $
  中子与单位体积中的所有原子核发生相互作用(核反应)的概率的一种度量
]
#def("平均自由程")[
  宏观截面的倒数$ lambda=1 / Sigma $
]
== 描述中子的几个宏观量
#def("角中子数密度")[
  位于物理空间$va(r)$处单位几何体积内与速度空间$va(v)$处单位速度体积内期望的自由中子数量,它是某个运动速度附近的中子数密度,也是一个宏观量,具有量纲$"m"^(-6)"s"^3$
  $
    n(va(r),va(v))dd(va(r))dd(va(v))=n(va(r),va(v))dd(va(r))v^2dd(v)dd(va(Omega))=n( va(r),va(v),va(Omega) )dd(va(r))dd(v)dd(Omega)\ =n(va(r),E,va(Omega))dd(va(r))dd(E)dd((va(Omega)))
  $
] <angular_neutron_density>
#def("中子数密度")[
  对@angular_neutron_density 在速度空间积分得到
  $ n(va(r))=integral_va(v)n(va(r),va(v))dd(va(v)) $
  量纲为$unit("m^-3")$.
]
#def("角中子注量率")[
  位于物理空间$va(r)$处单位几何体积内与速度空间$va(v)$处单位速度体积内的中子,在单位时间内穿过垂直于$va(v)$的单位面积的中子数.
  $ psi(va(r), va(v))=v n(va(r),va(v)) $其中$v$是速率.角中子注量率的量纲是$unit("cm^-2 s^-1")$
]
#def("中子注量率")[
  对角中子注量率进行速度空间内所有方向的积分可以得到与中子速率相关的中子注量率
  $ phi(va(r), v)=integral_(4pi)psi(va(r), v, va(Omega))dd(Omega) $
  若再对速率积分,得到与速率无关的三维物理空间上的中子注量率,有
  $
    phi(va(r))&=integral_0^infinity phi(va(r), v)dd(v)\ &=integral_va(v) v n(va(r),va(v)) dd(v)\ &= n(va(r))overline(v)
  $

  $phi(va(r))$表示空间$va(r))$处中子数密度与中子平均速率之乘积,它是标量不是矢量.
  #grid(
    columns: 2,
    column-gutter: 1em,
    [表示单位时间内从所有方向进入以空间某点为中心的单位小球的中子数与球体赤道截面积之比.常用单位是$unit("cm^-2 s^-1")$.],
    cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.8, fill: color.mix(blue, white))
      circle((0, 0), radius: (0.8, 0.5), fill: color.mix(green, white))
      content((0, 0), [截面积])
    }),
  )
  中子注量率的大小直接反映堆芯内核反应功率的大小，在热中子动力堆内，热中子注量率的数量级一般为$10^(13)~10^(15)$ $"cm"^(-2)"s"^(-1)$.
] <neutron_flux>
#def("净中子流密度")[
  净中子流密度是标量,定义为单位时间内穿过方向为$vu(n)$的单位面积的中子数.常用单位是$unit("cm^-2 s^-1")$.
  $
    J( va(r) )&=integral_va(v) vu(n) dprod va(Omega)psi(va(r), va(v))\ &=vu(n) dprod integral_va(v) va(Omega)psi(va(r), va(v))\ &=vu(n) dprod va(J)( va(r) )
  $
  常称为*中子流密度*.
]
= 中子能谱和中子的慢化
确定慢化时间,要从中子能谱开始.
/ 热谱: 在单次碰撞的平均能损与散射和吸收截面比都很大的介质中,中子的能量分布将接近热平衡态.
/ 快谱: 处在具有较小的减速与吸收比的系统中,中子在发生明显减速之前就已经被吸收了,能量分布接近裂变谱,称为快谱或硬谱.

#figure(
  table(
    columns: 3, stroke: none,
    table.hline(),
    table.header([慢化剂], [慢化能力$xi Sigma_S [unit("cm^-1")]$], [慢化比$xi Sigma_S\/Sigma_a$]),
    table.hline(),
    [$isotope(H)_2 isotope(O)$], [1.350], [71],
    [$isotope(D)_2 isotope(O)$], [0.176], [5670],
    [$isotope("Be")$], [0.158], [143],
    [石墨], [0.060], [192], table.hline(),
  ),
  caption: [几种慢化剂的对比],
)
重水具有良好的慢化性能,但价格略贵.轻水慢化能力最大,用轻水作慢化剂的反应堆可以具有较小的堆芯体积,但吸收截面较重水大,因此轻水堆必须用富集铀作为燃料.石墨的慢化性能也不错,但慢化能力较小,因此石墨堆的堆芯体积较大.

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

方程两边求导,得到$ dv(, E) q(E)=Sigma_a (E) phi(E) $

在某些区间, $Sigma_a (E)=0$, 慢化近似为常量

进一步地,

$ q(E)=xi C= (1+alpha / (1-alpha)ln(alpha)) $

== 裂变中子能谱
裂变中子不是单能的,其能量分布范围很宽,平均能量是2MeV.

通常认为裂变中子是各向同性的.
$ chi(E)=0.453e^(-1.036E)sinh(sqrt(2.29E)) ["MeV"] $
= 中子的扩散与输运方程
== 中子的扩散方程
在处理中子的空间分布中,将只考虑单能或单一能量群模型.意味着中子的流强与截面已经对能量求过平均了.中子的扩散方程在确定中子的空间分布方面提供了最直截了当的近似.

#thm("中子数守恒方程")[
  $ pdv(n(va(r),t), t)=s'''(va(r),t)-Sigma_a phi(va(r), t)-div va(J)(va(r),t) $
  其中$Sigma_a phi(va(r), t)$称为吸收率.
]

#thm("空间中子平衡")[
  在稳定态条件下中子数守恒要求:

  泄漏+吸收+散射=发射+裂变

  利用中子流密度与偏微分的定义,每秒泄漏的数目为
  $ div va(J) dd(x, y, z) $
  每秒吸收的中子数为
  $ Sigma_a (x,y,z) phi(x, y, z) dd(x, y, z) $
  每秒发射的中子数为
  $ s'''_f(x,y,z) dd(x, y, z) $
  每秒裂变的中子数为
  $ v Sigma_f (x,y,z) phi(x, y, z)dd(x, y, z) $

  平衡方程为$ div va(J) (va(r))+Sigma_a (va(r))phi(va(r))=s'''(va(r))+v Sigma_f (va(r)) phi(va(r)) $
] <neutron_balance>
#thm("Fick")[
  $ va(J)(va(r))=-D grad n(va(r)) $
  其中$D$表示扩散系数

  对于散射截面占总截面的比率$ c=Sigma_s / Sigma_t $如果$c<0.7$,那么由于吸收过强,Fick近似将失去有效性.
] <fick>
#thm("中子扩散方程")[
  考虑到@fick,@neutron_balance 可以写成
  $ - div D(va(r))grad phi(va(r))+Sigma_a (va(r))phi(va(r))=s'''(va(r))+v Sigma_f (va(r)) phi(va(r)) $
] <neutron_diffusion>
#thm("单能中子扩散方程")[
  如果中子是单能的,即所有中子具有同一微观速率,利用@fick 可以得到
  $ -1 / v pdv(phi(va(r), t), t)=s'''(va(r),t)-Sigma_a phi(va(r), t)+div (D grad phi(va(r), t)) $
]
=== 边界条件
在求解扩散方程时,常用以下几种边界条件
- 在扩散方程的求解域内,中子注量率是正的,有限的实数
- 在两种不同扩散性质的介质交界面上,分界面两侧的中子流密度相等,中子注量率相等
- 介质与真空交界的外表面上,根据物理要求,从真空返回介质的中子流密度为零,用更简单的形式表示,即在自由边界外推距离$d$处,中子注量率等于零#footnote[常见的条件是介质厚度已经考虑了外推距离,或者介质厚度远大于外推距离,那么边界条件可以简单地定为介质与真空边界处中子注量率为零.].

#def("直线外推距离")[
  由于扩散方程的边界条件要求在介质与真空交界的外表面上,从真空返回介质的中子流密度为零,从而
  $ J_x^-|_(x=x_b)=0 => pdv(phi, x)|_(x=x_b)=-(3Sigma_t) / 2 phi_b =-2 / (2lambda_t)phi_b $
  直线外推距离$d$便为$ d=(2lambda_"tr") / 3 $
  上述是假设宏观截面$Sigma$不随空间位置变化而得到的,因而求出的$d$也是近似的.按照中子输运理论,对于平面边界的情况,有$ d=0.7104lambda_"tr" $
]

讨论不可裂变材料,也就是非增殖介质的均匀介质的情况.

#def("扩散长度")[
  $ L=sqrt(D / Sigma_a) $
  具有长度的量纲
]

因此, $Sigma_f=0$且$D$与$Sigma_a$为常量,使得@neutron_diffusion 变为
$ -laplacian phi(va(r))+1 / L^2 phi(va(r))=1 / D s'''(va(r)) $

= 核反应堆临界理论
本章将扩散理论用于讨论由核燃料和慢化剂等组成的有限均匀增殖介质(反应堆系统)内的中子扩散问题,*中心问题是讨论反应堆的临界*.
+ 各种形状的反应堆达到临界状态的条件(临界条件),例如临界体积,临界质量等
+ 临界状态下反应堆内中子通量密度(或功率)的空间分布(临界状态)
对于简化的能群
- 能群内,中子的能量差不多,性质和行为也差不多
- 同一能群内,采用相同的参数(扩散吸收,吸收系数,裂变截面)进行计算
#def("反应堆物理三类/五代方法的划分")[
  / 一代: 中子循环分析方法(四/六因子公式)
  / 二代: 单群扩散方法,适用于快堆
  / 三代: 多群扩散理论,目前大多数核电厂设计工具都基于此
  / 四代: 输运理论,基于确定论方法求解玻尔兹曼中子输运方程
  / 五代: 蒙特卡罗方法,根据真实几何,材料,能量和时间准确建模,分析中子群的整体行为
]
#def("均匀反应堆")[
  均匀反应堆是指这样一种堆,其堆芯的各种材料(燃料,慢化剂,结构材料等等)是均匀地混合在一起的,因此整个堆芯的材料特性是一致的,核截面等数据都是一样的.

  实际中只有一种名叫"水锅炉"的实验堆是均匀堆,其堆芯是硫酸铀酰的水溶液.
]
#def("裸堆")[无反射层的反应堆.]
#def("裸堆扩散方程")[
  $
    pdv(n(va(r),t), t)=& 1 / v pdv(phi(va(r), t), t) \ =&s'''(va(r),t)-Sigma_a phi(va(r), t)-div va(J)( va(r),t ) \ =&v Sigma_f phi-Sigma_a phi+D grad^2 phi
  $
]
对于裸堆扩散方程的求解,分离变量$phi(va(r), t)=phi(va(r))T(t)$,有
$ 1 / (D v T(t)) dv(T(t), t)-(k_infinity-1) / L^2=(grad^2 phi(va(r))) / phi(va(r)) $
#def([$k_infinity$])[$ k_infinity=(v Sigma_f) / Sigma_a $]
#def([$k_n$])[
  用$-B_n^2$表示分离变量中的离散常数.$ k_n=k_infinity / (1+L^2B_n^2) $
  决定中子通量随时间变化的因素是$(k_n-1) / l_n$,即$k_n$与$1$的关系.
]
#def([$l_infinity$])[$ l_infinity=lambda_a / v $]
#def([$l_n$])[$ l_n=l_infinity / (1+L^2B_n^2) $]
时间部分$T(t)$求解为$ T(t)=C e^((k_n-1) / l_n t) $
若空间部分限定条件的通量为一维函数,关于中心对称$phi(plus.minus a)=0$
$ phi(x, t)=sum_(1,3,5)^infinity A_n cos((n pi) / a x)C e^((k_n-1) / l_n t) $
#def([$k_"eff"$])[
  根据$k_1$的表现,可知$k_1$就是$k_"eff"$.
]
#def("瞬发中子")[
  伴随着裂变产生而没有可测延迟的中子($10^(-14)$s)
]
= 反应堆燃耗与中毒
== 裂变产物中毒
$isotope("Xe", a: 135)$是稀有气体元素,具有非常大的热中子吸收截面,此外在裂变产物中有可观的产额.
#def("允许停堆时间")[
  记为$t_p$,剩余反应性大于0,可以通过移动控制棒启动反应堆.
]
#def("强迫停堆时间")[
  记为$t_f$,剩余反应性小于0,反应堆无法启动.
]
#def("碘坑深度")[
  停堆后反应堆剩余反应性下降到最小值的程度,热中子注量率越大,碘坑深度越深.
]
= 反应堆动力学基础
