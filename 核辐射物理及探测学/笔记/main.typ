#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "zh", region: "cn")
#set heading(numbering: "1.")
#let title = [核辐射物理与探测学笔记]
#set document(title: [#title])
#import "@preview/physica:0.9.2": *
#set page("a4",numbering: "1",margin: (x: 1.2cm, y: 1.2cm))
#set math.equation(numbering: "(1)",supplement: [式.],number-align:bottom+right)

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
三个变量确定一个核素(同质异能素)
== 原子核稳定性的实验规律
== 原子核的结合能
/ 液滴模型: 体积能,表面能,库伦能
$ B=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3) $
/ Weizacker公式: 半经验结合能公式
$ B=a_V A-a_S A^(2\/3)-a_C Z^2A^(-1\/3)\
-a_"sym" (A\/2-Z)^2A^(-1)+B_P $
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
$t_m$主要由衰变常数大的,即半衰期短的决定:
$ t_m=1/(lambda_2-lambda_1)ln(lambda_2/lambda_1) $
/ 多次连续衰变规律: 共$n+1$个核素,最后1个是稳定的
  $ N_n c (t)&=N_10 (c_1e^(-lambda_1t)+dots+c_n e^(-lambda_n t)) \ c_n&=(lambda_1 dots lambda_(n-1))/((lambda_1-lambda_n) dots (lambda_(n-1)-lambda_n)) $
== 放射系
估测地球年龄,可用87Rb经$beta$衰变到87Sr的过程来估计,并用稳定核素$isotope("Sr",a:86)$估计地球形成之初的$isotope("Sr")$含量.

/ 天然放射系: 地球上的放射性核素维系在三个处于长期平衡的放射系中,第一个核素的半衰期都很长
- 钍系($4n$系)从$isotope("Th",a:232)$开始经10次衰变到达$isotope("Pb",a:208)$(双幻数)
#figure(
  image("decaychain4n+0.svg", width: 60%),
  caption: [钍系($4n$系)],
)
- 铀系($4n+2$系)从$isotope(U,a:238)$开始经14次衰变到达$isotope("Pb",a:206)$
#figure(
  image("decaychain4n+2.svg", width: 90%),
  caption: [铀系($4n+2$系)],
)
- 锕-铀系($4n+3$系)从$isotope(U,a:235)$开始经11次衰变到达$isotope("Pb",a:207)$
#figure(
  image("decaychain4n+3.svg", width: 60%),
  caption: [锕-铀系($4n+3$系)],
)
- 镎系($4n+1$系)从$isotope("Np",a:237)$衰变到$isotope("Bi",a:209)$
  - $isotope("Np",a:237)$半衰期远比地球年龄小,至今这一系完全衰变完了
  - 将$isotope(U,a:238)$放到反应堆用中子照射,连续吸收3个中子,经过两次$beta^-$衰变形成$isotope("Pu",a:241)$,再经一次$beta^-$衰变,一次$alpha$衰变形成$isotope("Np",a:237)$
#figure(
  image("decaychain4n+0.svg", width: 60%),
  caption: [镎系($4n+1$系)],
)
== 放射规律的一些应用
/ 人工制备放射源: 例如通过反应堆或加速器制备人工放射性核素
$ P=N_"target"sigma_0Phi $
  - $N_"target"$是样品中用来制备放射源的靶核的总数,认为在辐照中不变
  - $sigma_0$是靶核的热中子截面
  - $Phi$是热中子的注量率
考虑制得的核素自身以$lambda$衰变,则照射时间为$t$时数量及活度为
$ N(t)&=(N_"target"sigma_0Phi)/lambda (1-e^(-lambda t)) \
A(t)&=N_"target"sigma_0Phi (1-e^(-lambda t)) $
定义$S=1-e^(-lambda t)$为饱和因子,那么$S(t approx 6.65T_(1\/2))=0.99$.
因此通常制备时照射时间以六七倍半衰期为好.
- 这5个影响活度的因素,在照射时间足够长时,退化为3个
/ 短寿命核素发生器: 直接制备的短寿命核素活不完运输过程,因此采用母体-子体的方法
- 母体长寿命,子体短寿命.两者建立暂时平衡
- 每隔$t_m$可以收获最多量的子体
= 原子核的衰变
== $alpha$衰变
$ isotope(X,a:A,z:Z) -> isotope(Y,a:A-4,z:Z-2) + isotope("He",z:2,a:4) $

- A,Z越大,$alpha$衰变能越大

/ 衰变能: $ E_0=T_alpha+T_Y=(m_X-(m_Y+m_alpha))c^2 $
由于动量守恒,有:
$ E_0=(m_Y+m_alpha)/m_Y T_alpha approx A/(A-4) T_alpha $
- 实际中测量的是$T_alpha$,而$T_Y$由于Y核前进距离太小等原因难以测量
- 探测器中测得的$alpha$能谱有宽度,这是探测器自身的分辨能力

/ Geiger-Nuttall Rule: $ lg(lambda)&=A-B E_0^(-1/2) $
/ $alpha$衰变的隧穿理论:
$ G=(2 sqrt(2m_alpha E_0))/hbar integral_R^b (b/r-1)^(1/2)dd(r) $
== $beta$衰变
/ 类型:
  - $beta^-$衰变: 原子核衰变时发射负电子
  - $beta^+$衰变: 原子核衰变时发射正电子
  - 轨道电子俘获EC: 原子核从核外的电子壳层俘获一个轨道电子
  