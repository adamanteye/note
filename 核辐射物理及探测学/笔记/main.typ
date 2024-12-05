#import "../../note_zh.typ": *
#show: conf.with(
  title: "核辐射物理与探测学笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)
#figure(
  table(
    stroke: none,
    columns: 3,
    table.hline(),
    table.header([量], [值], [注释]),
    table.hline(),
    [$k_B T$],
    [25.3meV],
    [也是热中子的动能],
    [$e^2 / (4pi epsilon.alt_0)$],
    [1.44 MeV fm],
    [],
    [$h c$],
    [1240 MeV fm],
    [],
    [$m_e c^2$],
    [0.511 MeV],
    [],
    [Ry],
    [13.6 eV],
    [Rydberg constant],
    [u$c^2$],
    [931.494 MeV],
    [],
    table.hline(),
  ),
  caption: [常数表],
)
= 原子核的基本性质
/ 不确定度关系:
  - 动量-位置不确定关系
  - 能量-时间不确定关系
  - 角动量-角位置不确定关系
/ 同量异位素: 质量数相同而电荷数不同
/ 镜像核: 质子数中子数互换,相等的没有镜像核
/ 质量:
  - 质量过剩:原子
  - 质量亏损:原子核
== 原子核的结合能
#thm[$ E^2-(p c)^2=(m_0 c^2)^2 $]
/ 液滴模型: 体积能,表面能,库伦能
$ B=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3) $
/ Weizacker公式: 半经验结合能公式
$
  B(Z,A)=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3)\
  -a_"sym" (A\/2-Z)^2A^(-1)+B_P \ B_p=cases(+a_P A^(-1\/2) &"even-even", 0 &"odd", -a_P A^(-1\/2) &"odd-odd")
$
#figure(
  table(
    stroke: none,
    columns: 5,
    table.hline(),
    table.header([$a_V$], [$a_S$], [$a_C$], [$a_"sym"$], [$a_P$]),
    [15.835],
    [18.33],
    [0.714],
    [92.90],
    [11.2],
    table.hline(),
  ),
  caption: [Weizacker公式参数(MeV)],
)
== 核力及核势垒
=== 核力的性质
- 短程强作用力
- 和电荷无关,这使得中子,质子的能级结构基本相同
- 具有饱和性,只与临近的几个核子相互作用
- 极短程内存在排斥芯,核子不能无限靠近
- 两核子间的核力与自旋相对取向有关
- 核力有自旋轨道耦合项
== 磁矩和电极矩
== 原子核的统计性质
=== 费米子
自旋量子数为半整数的称为费米子
- 质子,中子,电子,中微子,$mu$子
- 交换反对称
- 费米-狄拉克统计
- 不可以占据相同的量子态, 泡利不相容原理
=== 玻色子
自旋量子数为整数的称为玻色子
- 光子,$pi$介子
- 交换对称
- 玻色-爱因斯坦统计
- 可以占据相同的量子态, 玻色-爱因斯坦凝聚
#figure(image("whatparticle3.png", width: 95%), caption: [标准模型的基本粒子])
对原子核而言
- 偶A核: 玻色子
- 奇A核: 费米子
- 历史上用来否定原子核的质子-电子论
== 原子核的自旋与宇称
== 原子核的能态和核的壳层模型
/ 核的能态结构: 原子核是由核子构成的体系, 具有能态结构
  - H原子没有能态结构
/ 壳层模型: $j=l plus.minus s$ 考虑核子的自旋-轨道耦合作用
= 原子核的放射性
== 放射性衰变的规律
/ 衰变常数: $ N(t)=N(0)e^(-lambda t) $
/ 半衰期: $ e^(-lambda T_(1\/2))&=0.5\ lambda T_(1\/2)&=ln(2) $
/ 平均寿命: 放射性原子核的平均生存时间或存活概率为0的时间
$
  tau&=integral t dot (-dd(N(t)))=(integral_0^infinity t lambda N(t)dd(t)) / N(0)\
  &=integral_0^infinity t lambda e^(-lambda t)dd(t)=1 / lambda=1.44T_(1\/2)
$
/ 能级宽度: $Gamma tau=hbar$
  - $Gamma=hbar lambda$
/ 活度: $A(t)=lambda N(t)$
  - 单位时间发生衰变的原子核数目,反应放射源的强弱,注意不是发射的粒子数
  - $1 "Ci"=3.7times 10^10 "Bq"=3.7times 10^10 s^(-1)$
/ 衰变率: $J(t)=lambda N(t)$
  - 与活度定义相同,主要用来描述衰变过程
/ 比活度: $a=A / m$
  - 单位质量放射源的放射性活度
=== 测量半衰期
- 对中等寿命,可直接观察到活度的指数衰减,得到半衰期
- 对较长寿命,无法看到活度变化,但可以分别测量活度和放射性核素的个数(化学手段),利用$A=lambda N$即可得到半衰期
== 递次衰变规律
=== 二次衰变
涉及核素$isotope(A),isotope(B)$以及稳定核素$isotope(C)$

$t_m$主要由衰变常数大的,即半衰期短的决定:
$ t_m=1 / (lambda_2-lambda_1)ln(lambda_2/lambda_1) $
总活度为:
$ A(t)=N_10 lambda_1 (e^(-lambda_1 t) +&\ lambda_2 / (lambda_2-lambda_1) &(e^(-lambda_1 t)-e^(-lambda_2 t))) $
=== 多次连续衰变规律
对于从数量为$N_10$的核素开始的多次连续衰变,衰变链中第$n$个核素的数量为
$
  N_1(t)&=N_10 e^(-lambda_1 t) \ N_(n!=1) (t)&=N_10 product_(j=1)^n c_(n,j) e^(-lambda_j t) \ c_(n!=1,i)&=(product_(j=1)^(n-1)lambda_j) / (product_(j=1,j!=i)^n lambda_j-lambda_i)
$
=== 长期平衡

== 放射系
估测地球年龄,可用$isotope("Rb", a: 87)$经$beta$衰变到$isotope("Sr", a: 87)$的过程来估计,并用稳定核素$isotope("Sr", a: 86)$估计地球形成之初的$isotope("Sr")$含量.
/ 天然放射系: 地球上存在3个长期平衡#link("https://en.wikipedia.org/wiki/Decay_chain#Thorium_series")[放射系],此外有1系已经衰变完了
- 钍系($4n$系)
#figure(image("decaychain4n+0.svg", width: 60%), caption: [钍系($4n$系)])
- 铀系($4n+2$系)从$isotope(U, a: 238)$开始经14次衰变到达$isotope("Pb", a: 206)$
#figure(image("decaychain4n+2.svg", width: 90%), caption: [铀系($4n+2$系)])
- 锕-铀系($4n+3$系)从$isotope(U, a: 235)$开始经11次衰变到达$isotope("Pb", a: 207)$
#figure(image("decaychain4n+3.svg", width: 60%), caption: [锕-铀系($4n+3$系)])
- 镎系($4n+1$系)从$isotope("Np", a: 237)$衰变到$isotope("Bi", a: 209)$
  - $isotope("Np", a: 237)$半衰期远比地球年龄小,至今这一系完全衰变完了
  - 将$isotope(U, a: 238)$放到反应堆用中子照射,连续吸收3个中子,经过两次$beta^-$衰变形成$isotope("Pu", a: 241)$,再经一次$beta^-$衰变,一次$alpha$衰变形成$isotope("Np", a: 237)$
#figure(image("decaychain4n+0.svg", width: 60%), caption: [镎系($4n+1$系)])
== 放射规律的一些应用
/ 人工制备放射源: 例如通过反应堆或加速器制备人工放射性核素,产生率为
$ P=N_"target"sigma_0Phi $
- $N_"target"$是样品中用来制备放射源的靶核的总数,认为在辐照中不变
- $sigma_0$是靶核的热中子截面
- $Phi$是热中子的注量率
考虑制得的核素自身以$lambda$衰变,则照射时间为$t$时数量及活度为
$
  N(t)&=P / lambda (1-e^(-lambda t)) \
  A(t)&=P (1-e^(-lambda t))
$
定义$S=1-e^(-lambda t)$为饱和因子,那么$S(t approx 6.65T_(1\/2))=0.99$.
因此通常制备时照射时间以六七倍半衰期为好.
- 这5个影响活度的因素,在照射时间足够长时,退化为3个
/ 短寿命核素发生器: 直接制备的短寿命核素活不完运输过程,因此采用母体-子体的方法
- 母体长寿命,子体短寿命.两者建立暂时平衡
- 每隔$t_m$可以收获最多量的子体
= 原子核的衰变
== $alpha$衰变
$ isotope(X, a: A, z: Z) -> isotope(Y, a: A-4, z: Z-2) + isotope("He", z: 2, a: 4) $
/ 衰变能: $ E_0=T_alpha+T_Y=(m_X-(m_Y+m_alpha))c^2 $
由于动量守恒,有:
$ E_0=(m_Y+m_alpha) / m_Y T_alpha approx A / (A-4) T_alpha $
- 实际中测量的是$T_alpha$,而$T_Y$由于Y核前进距离太小等原因难以测量
- 探测器中测得的$alpha$能谱有宽度,这是由于探测本身的分辨能力
/ 讨论:
- A,Z越大,$alpha$衰变能越大
=== 势垒穿透模型
/ Geiger-Nuttall Rule: $ lg(lambda)&=A-B E_0^(-1 / 2) $
/ $alpha$粒子相对母核的势函数: $
    V(r)=cases(-V_0 &"where" r<R, e^2/(4pi epsilon_0) (Z_alpha Z_Y )/r &"where" r>R)
  $ 当$alpha$粒子要带走角动量时,势能要被修正为 $ V(r)+(l(l+1)hbar^2)/(2 M_alpha r^2) "where" r>R $
/ 势垒高度: $ V_c=V(R) \ "where" R=R_Y+R_alpha=r_0(A_Y^(1 / 3)+A_alpha^(1 / 3)) $
- 其他重核衰变,如$isotope(C, a: 12)$衰变难以发生,原因在于势垒高度与$Z_isotope(C, a: 12)$成正比,这几乎是$alpha$衰变的势垒高度的3倍
/ 势垒宽度: $ b=(Z_alpha Z_Y e^2) / (4pi epsilon_0 E_0) $
#def("Gamow factor")[$ G=(2 sqrt(2mu E_0)) / hbar integral_R^b (b / r-1)^(1 / 2)dd(r) $]
=== 守恒
== $beta$衰变
/ 半衰期范围: $10^(-3)$ s 到 $10^24$ a
/ 类型:
- $beta^-$衰变: 原子核衰变时发射负电子
- $beta^+$衰变: 原子核衰变时发射正电子
- 轨道电子俘获EC: 原子核从核外的电子壳层俘获一个轨道电子
/ 讨论:
- 经$beta$衰变生成的子核一般处于激发态,激发态发射$gamma$光子或内转换电子跃迁至基态,纯$beta$衰变放射性核素不多
- $beta$衰变宇称不守恒
=== $beta^-$衰变
$ isotope(X, a: A, z: Z)->isotope(Y, a: A, z: Z+1)+e^-+accent(nu_e, tilde) $
/ 衰变能: $ E_0 (beta^-)=Delta(Z, A)-Delta(Z+1, A) $
=== $beta^+$衰变
$ isotope(X, a: A, z: Z)->isotope(Y, a: A, z: Z-1)+e^++nu_e $
/ 衰变能: $ E_0 (beta^+)=Delta(Z, A)&-Delta(Z-1, A)\ &-2m_e c^2 $
=== 禁戒条件
=== 轨道电子俘获(EC)
$ isotope(X, a: A, z: Z)+e_i^- ->isotope(Y, a: A, z: Z-1)+nu_e $
/ 衰变能: $ E_0(epsilon)=Delta(Z, A)-Delta(Z-1, A)-B_i $
#thm("电子结合能公式")[$
    B_K (Z)&approx "Ry" (Z-1)^2\ B_L (Z)&approx 1 / 4 "Ry" (Z-5)^2\ B_M (Z)&approx 1 / 9 "Ry" (Z-13)^2
  $]
== $gamma$跃迁
/ 衰变能: $E_gamma$是$gamma$光子的能量,$T_R$是子核反冲能$ E_0=E_i-E_f=E_gamma+T_R $
=== 穆斯堡尔效应
=== 多级性
#thm([$gamma$跃迁宇称守恒])[$gamma$跃迁是电磁相互作用,因此宇称守恒,设$pi_gamma$是光子宇称,有$ pi_gamma=pi_i/pi_f $]
#thm([$gamma$跃迁角动量守恒])[设跃迁前后原子核角动量分别为$va(I_i)$与$va(I_f)$,有$va(L)=va(I_i)-va(I_f)$$ L=|I_i-I_f|,|I_i-I_f|+1,dots,|I_i+I_f| $] <gamma-am-conserve>
#thm("电多级辐射光子宇称")[$pi_gamma=(-1)^L$]
#thm("磁多级辐射光子宇称")[$pi_gamma=(-1)^(L+1)$]
/ 讨论:
- 光子带走的角动量不能为0
=== 概率公式
#thm("Weisskopf单质子模型")[Weisskopf假定$gamma$跃迁是核内1个质子状态变化导致的$ lambda_E (L)=1/(4pi epsilon_0) (2(L+1))/(L((2L+1)!!)^2)\ (3/(L+3))^2 e^2/(hbar c) (k R)^(2L) omega $
  $
    lambda_M (L)=1 / (4pi epsilon_0) (20(L+1)) / (L((2L+1)!!)^2)\ (3 / (L+3))^2 e^2 / (hbar c) (hbar / (m_P c R))^2 (k R)^(2L) omega
  $]
/ 讨论:
- $lambda_M (L)$一般与$lambda_E (L+1)$有相同的量级
=== 选择定则
#figure(image("gammadecysele.png", width: 95%), caption: [$Delta I=1$的例子])
#figure(image("gammadecysele-1.png", width: 95%))
#figure(image("gammadecysele-2.png", width: 95%))
=== 同质异能跃迁
/ 同质异能态: 通常将寿命较长($>0.1$s)的核激发态成为同质异能态
/ 同质异能素: 质子数,中子数相同但处在长寿命激发态上的核素称为同质异能素,表示为$isotope("X", a: A m)$
/ 同质异能跃迁: 同质异能态的$gamma$跃迁称为同质异能跃迁
/ 讨论:
- 高激发态一般不会是同质异能态
- 偶偶核的同质异能态很少
- 奇A核的同质异能态最多
- 同质异能态的内转换系数最大
=== 内转换电子
/ 内转换: 原子核将退激能量交给核外电子,使电子从原子中电离的现象.能量以发射特征X射线或俄歇电子的形式放出.
/ 内转换电子的动能: $ T_e=E_i-E_f-B_i=E_gamma-B_i $
这里$B_i$是第$i$层电子的结合能
#figure(image("internalconversion.png", width: 95%))
/ 内转换系数: $ alpha:=lambda_e / lambda_gamma=n_e / n_gamma $
注意$lambda_gamma (1+alpha)$才是两个能级间跃迁过程对应的衰变常数
#figure(image("internalconversion-1.png", width: 95%))
/ 讨论:
- 退激时,发射内转换电子和发射光子是互相竞争的
== 衰变纲图

= 原子核反应
具有一定能量的粒子轰击靶核,使其组成或能量状态发生变化,成为不稳定核素,并放出粒子.
/ 讨论:
- 涉及的能量可以很高
  - 中高能反应能量可以达到几百MeV
- 可以产生不稳定核素
== 原子核反应概况
== 核反应和Q方程
$ isotope(a)+isotope(A) -> isotope(b) + isotope(B) $
#thm("核反应中的能量守恒")[$ (m_a+m_A)^2+(T_a+T_A)=(m_b+m_B)^2+(T_b+T_B) $]
#def("反应能Q")[$
    Q&=(T_b+T_B)-(T_a+T_A)\ &=(m_a+m_A)c^2-(m_b+m_B)^c^2\ &approx (Delta_a+Delta_A)-(Delta_b+Delta_B)\ &= (B_b+B_B)-(B_a+B_A)
  $]
- $Q>0$: 放能反应
- $Q<0$: 吸能反应
- 如果余核处在激发态$E^*$,那么有$m_B^*=m_B+E^* /c^2$,$Q'=Q-E^*$
#thm("Q方程")[假设靶核$isotope(A)$静止,Q方程将出射粒子的动能$T_b$与入射粒子动能$T_a$,出射粒子的方向$theta$,反应能$Q$把这四个量联系起来$ Q=(1+m_b/m_B)T_b-(1-m_a/m_B)T_a \ - (2sqrt(m_a m_b T_a T_b))/m_b cos theta $$
    sqrt(T_b)=plus.minus (((A_B-A_a) / (A_B+A_b)+(A_a A_b) / (A_B+A_b)^2 cos^2theta)T_a\ +A_B / (A_B+A_b)Q)&^(1\/2)+sqrt(A_a A_b T_a) / (A_B+A_b) cos theta
  $]
#figure(
  grid(
    columns: 2,
    row-gutter: 2mm,
    image("14cpn14n-1.png"), image("14cpn14n-2.png"),
    [能量阈值], [$T_b$几乎不随$theta_L$变化],
  ),
  caption: [$isotope(C, a: 14)(isotope(p),isotope(n))isotope(N, a: 14)$反应],
)
== 实验室坐标系与质心坐标系
== 核反应截面和产额
#def("截面")[反映一个入射粒子与单位面积上的一个靶核发生反应的概率$ sigma=N'/(I N_s) $]
#def("总截面")[不同反应道有各自截面,分截面之和称为总截面$ sigma=sum_i sigma_i $]
#def("微分截面")[]
#def("产额")[入射粒子在靶中引起的核反应数$N'$与入射粒子数$I_0$之比$ Y=N'/I_0 $]
#thm("中子入射的产额")[$ Y=1-e^(-sigma N D) $
  - 对于薄靶,有$Y approx sigma N D$
  - 对于厚靶,有$Y -> 1$]
== 核反应中的分波分析
== 核反应机制及核反应模型
=== 复合核机制
- 复合核如何衰变与它如何形成无关
- 反应在$10^(-15)$s量级
- 入射粒子能量不太高: 10-20MeV
- 靶核质量较大
= 辐射与物质的相互作用
== 重带电粒子
== 快电子
= 辐射与物质探测中的统计学

用样本方差代替统计涨落的估计值意味着放弃了对分布处于泊松分布的先验知识,结果算出来的误差一定偏大.
