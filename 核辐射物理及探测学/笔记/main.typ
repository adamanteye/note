#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#set heading(numbering: "1.")
#let title = [核辐射物理与探测学笔记]
#set document(title: [#title])
#import "@preview/physica:0.9.2": *
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#set math.equation(numbering: "(1)", supplement: [式.], number-align: bottom + right)
#show link: it => underline(text(fill: rgb("#8c0000"), it))

#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#let pst = thmbox("thm", "公设", inset: (x: 0em, top: 0em),base:none)
#let def = thmbox("thm", "定义", inset: (x: 0em, top: 0em),base:none)
#let thm = thmbox("thm", "定理", inset: (x: 0em, top: 0em),base:none)
#let exmp = thmbox("exmp", "例", inset: (x: 0em, top: 0em),base:none)
#let sol = thmplain("sol", "解答", inset: (x: 0em, top: 0em), base: "thm", titlefmt: strong).with(numbering: none)
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: strong,
  base: "thm",
)

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)
= 原子核的基本性质
/ 不确定度关系:
  - 动量-位置不确定关系
  - 能量-时间不确定关系
  - 角动量-角位置不确定关系
/ 同量异位素: 质量数相同而电荷数不同
/ 镜像核: 质子数中子数互换,相等的没有镜像核

/ 一些常数与近似:
- 热运动 25.3MeV
- $e^2/(4pi epsilon.alt_0)=1.44"MeV fm"$
- $h c=1240 "MeV fm"$
== 原子核的组成,质量与半径
三个变量确定一个核素(同质异能素)== 原子核稳定性的实验规律== 原子核的结合能
/ 液滴模型: 体积能,表面能,库伦能
$ B=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3) $
/ Weizacker公式: 半经验结合能公式
$ B(Z,A)=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3)\
-a_"sym" (A\/2-Z)^2A^(-1)+B_P \ B_p=cases(+a_P A^(-1\/2) &"even-even", 0 &"odd", -a_P A^(-1\/2) &"odd-odd") $
#figure(table(
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
), caption: [Weizacker公式参数(MeV)])
== 核力及核势垒
== 磁矩和电极矩
== 原子核的统计性质
/ 费米子: 自旋为半整数
  - 质子,中子,电子,中微子,$mu$子
  - 交换反对称
  - 费米-狄拉克统计
  - 不可以占据相同的量子态, 泡利不相容原理
/ 玻色子: 自旋为整数
  - 光子,$pi$介子
  - 交换对称
  - 玻色-爱因斯坦统计
  - 可以占据相同的量子态, 玻色-爱因斯坦凝聚
#figure(image("whatparticle3.png", width: 95%), caption: [标准模型的基本粒子])
原子核的统计性质:
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
$ tau&=integral t dot (-dd(N(t)))=(integral_0^infinity t lambda N(t)dd(t))/N(0)\
   &=integral_0^infinity t lambda e^(-lambda t)dd(t)=1/lambda=1.44T_(1\/2) $
/ 能级宽度: $Gamma tau=hbar$
  - $Gamma=hbar lambda$
/ 活度: $A(t)=lambda N(t)$
  - 单位时间发生衰变的原子核数目,反应放射源的强弱,注意不是发射的粒子数
  - $1 "Ci"=3.7times 10^10 "Bq"=3.7times 10^10 s^(-1)$
/ 衰变率: $J(t)=lambda N(t)$
  - 与活度定义相同,主要用来描述衰变过程
/ 比活度: $a=A/m$
  - 单位质量放射源的放射性活度
== 递次衰变规律
/ 二次衰变: 涉及核素$isotope(A),isotope(B)$以及稳定核素$isotope(C)$
  $t_m$主要由衰变常数大的,即半衰期短的决定:
  $ t_m=1/(lambda_2-lambda_1)ln(lambda_2/lambda_1) $
  总活度为:
  $ A(t)=N_10 lambda_1 (e^(-lambda_1 t) +&\ lambda_2/(lambda_2-lambda_1) &(e^(-lambda_1 t)-e^(-lambda_2 t))) $
/ 多次连续衰变规律: 对于从数量为$N_10$的核素开始的多次连续衰变,衰变链中第$n$个核素的数量为
  $ N_1(t)&=N_10 e^(-lambda_1 t) \ N_(n!=1) (t)&=N_10 product_(j=1)^n c_(n,j) e^(-lambda_j t) \ c_(n!=1,i)&=(product_(j=1)^(n-1)lambda_j)/(product_(j=1,j!=i)^n lambda_j-lambda_i) $
/ 长期平衡:

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
$ N(t)&=P/lambda (1-e^(-lambda t)) \
A(t)&=P (1-e^(-lambda t)) $
定义$S=1-e^(-lambda t)$为饱和因子,那么$S(t approx 6.65T_(1\/2))=0.99$.
因此通常制备时照射时间以六七倍半衰期为好.
- 这5个影响活度的因素,在照射时间足够长时,退化为3个
/ 短寿命核素发生器: 直接制备的短寿命核素活不完运输过程,因此采用母体-子体的方法
- 母体长寿命,子体短寿命.两者建立暂时平衡
- 每隔$t_m$可以收获最多量的子体
= 原子核的衰变
== $alpha$衰变
$ isotope(X, a: A, z: Z) -> isotope(Y, a: A-4, z: Z-2) + isotope("He", z: 2, a: 4) $

- A,Z越大,$alpha$衰变能越大

/ 衰变能: $ E_0=T_alpha+T_Y=(m_X-(m_Y+m_alpha))c^2 $
由于动量守恒,有:
$ E_0=(m_Y+m_alpha)/m_Y T_alpha approx A/(A-4) T_alpha $
- 实际中测量的是$T_alpha$,而$T_Y$由于Y核前进距离太小等原因难以测量
- 探测器中测得的$alpha$能谱有宽度,这是探测器自身的分辨能力

/ Geiger-Nuttall Rule: $ lg(lambda)&=A-B E_0^(-1/2) $
/ $alpha$衰变的隧穿理论:
$ G=(2 sqrt(2m_alpha E_0))/hbar integral_R^b (b/r-1)^(1/2)dd(r) $

$ dd(n(t))/n(t)/dd(t)=(k_"eff"-1)/tau $

== $beta$衰变
/ 半衰期范围: $10^(-3)$ s 到 $10^24$ a
/ 类型:
- $beta^-$衰变: 原子核衰变时发射负电子
- $beta^+$衰变: 原子核衰变时发射正电子
- 轨道电子俘获EC: 原子核从核外的电子壳层俘获一个轨道电子
== $gamma$跃迁
/ $gamma$衰变能:$E_gamma$是$gamma$光子的能量,$T_R$是子核反冲能$ E_0=E_i-E_f=E_gamma+T_R $
=== 穆斯堡尔效应
=== 多级性
#thm("gamma跃迁宇称守恒")[$gamma$跃迁是电磁相互作用,因此宇称守恒,设$pi_gamma$是光子宇称,有$ pi_gamma=pi_i/pi_f $]
#thm("gamma跃迁角动量守恒")[设跃迁前后原子核角动量分别为$va(I_i)$与$va(I_f)$,有$va(L)=va(I_i)-va(I_f)$$ L=|I_i-I_f|,|I_i-I_f|+1,dots,|I_i+I_f| $] <gamma-am-conserve>
#thm("电多级辐射光子宇称")[$pi_gamma=(-1)^L$]
#thm("磁多级辐射光子宇称")[$pi_gamma=(-1)^(L+1)$]
=== 概率公式
#thm("Weisskopf单质子模型")[Weisskopf假定$gamma$跃迁是核内1个质子状态变化导致的$ lambda_E (L)=1/(4pi epsilon_0) (2(L+1))/(L((2L+1)!!)^2)\ (3/(L+3))^2 e^2/(hbar c) (k R)^(2L) omega $
$ lambda_M (L)=1/(4pi epsilon_0) (20(L+1))/(L((2L+1)!!)^2)\ (3/(L+3))^2 e^2/(hbar c) (hbar/(m_P c R))^2 (k R)^(2L) omega $]
/ 讨论:
  - $lambda_M (L)$一般与$lambda_E (L+1)$有相同的量级
=== 选择定则
#figure(image("gammadecysele.png", width: 95%),caption:[$Delta I=1$的例子])
#figure(image("gammadecysele-1.png", width: 95%))
#figure(image("gammadecysele-2.png", width: 95%))
=== 同质异能跃迁
/ 讨论:
- 高激发态一般不会是同质异能态
- 偶偶核的同质异能态很少
- 奇A核的同质异能态最多
- 同质异能态的内转换系数最大
=== 内转换电子
/ 讨论:
- 发射内转换电子和发射光子是互相竞争的
= 原子核反应
具有一定能量的粒子轰击靶核,使其组成或能量状态发生变化,成为不稳定核素,并放出粒子.
/ 讨论:
- 涉及的能量可以很高
  - 中高能反应能量可以达到几百MeV
- 可以产生不稳定核素
== 原子核反应概况
=== 核反应的运动学
