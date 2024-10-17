#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#let pm=$plus.minus$
#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [$isotope("U", a:235)$与低能中子截面的自旋关联],
    subtitle: [中子物理导论第三次大作业],
    authors: ("司书屹", "杨哲涵"),
    date: datetime(year: 2024, month: 10, day: 15),
    institution: [工程物理系],
    logo: none,
  ),
  config-colors(
    primary: rgb(106,8,116),
    secondary: rgb("#6908749c"),
    tertiary: rgb("#7DB9DE"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#434343"),
  ),
  config-methods(
    cover: utils.semi-transparent-cover
  ),
  footer-a: self => self.info.subtitle,
)
#set text(size: 20pt)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#title-slide()
== 目录 <touying:hidden>
#align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))
= 引言
从大约上世纪40年代开始，人们在尝试用共振理论解释核截面时遇到了各种问题。尤其是对于$isotope("U", a: 233),isotope("Pu", a: 239)$等裂变核素，它们的核截面在低能区(热中子区)显得尤为反常，具体表现在
+ 无论是总截面$sigma_(n T)$，抑或单是裂变截面$sigma_(n f)$，其数值都异常的大

+ 共振峰的形状，尤其是$isotope("U",a: 235)$能量最小的两个共振峰，相对宽度中心并不对称，不符合Brite-Wigner公式的预期

+ 即使是位于共振峰之间的能量区域，其截面数值也远远超过了理论预期

#figure(image("img/cross_section.png", width: 80%), caption: "U-235低能区截面图")
#pagebreak()

为了解释低能区的此类反常现象，学者们提出了各种假说，尝试了多种模型拟合，例如

- 存在“负能量”共振峰导致的“背景”截面@SNR_1958

- 尝试跳出单能Breit-Wigner公式的束缚，用多级色散理论等解释。@SR_1952 @HAM_1957 

由于裂变核在低能区域的裂变宽度与共振峰间隔相当，不同共振峰之间的相干效应往往被优先考虑，而自旋态又恰是影响此类干扰强度的不可忽视的一部分。因此，不同学者的解释往往绕不开对不同共振能级自旋态关系的猜测，百家争鸣，但总无定论。直到60年代，才终于有学者给出较为严谨的实验证明。通过极化中子与极化核的透射实验，给出了几组低能区共振峰的自旋态关系。@SD_1968
= 早期的理论假说
== "负能量"共振
1958年,Brookhaven国家实验室(美)的F. J. Shore 和 V. L. Sailor认为热中子区反常大的截面来自于某种“背景”截面，并假设该截面可以视为负能量区(能量小于0)存在一个或多个束缚能级导致的共振峰，尝试基于数学方法寻找该存在于假想中的共振峰@SNR_1958

通过利用四种拟合模型进行最小二乘拟合,得到了最符合“背景”截面曲线的函数拟合 $ sigma_(n X)(E)=K sqrt(E)/(E-E_0)^2 $$ cases(K=208.5 "barn" (e V)^(5/2), E_0=-1.45e V) $
对比描述单能共振峰的Breit-Wigner公式$ sigma_(n,X)(E)=4 pi lambda^2((Gamma_n Gamma_X)/Gamma^2)1/(1+4(E-E_R)^2\/Gamma^2) $

因此,他们认为这种"背景"截面近似等价于来自一个位于结合能以下1.45eV处,等效中子宽度$Gamma_n^0=3.04times 10^(-3)e V$的较强的单能共振峰的干涉效应#figure(image("img/BACKGROUND.png", width: 50%), caption: "裂变截面数据曲线")
== Vogt
- Vogt 则认为束缚能级与这两个能级具有形同的自旋态,因此存在相干.认为这种“背景”截面来自于$E_0=-0.95e V,Gamma_n^0=1.49times 10^(-3)e V$处的等效共振峰的干涉效应

这两种相互矛盾的解说绕过了解释u-235的慢中子截面中最重要的未解之谜,如果不能通过实验验证具体的自旋情况,所有针对低能共振的相关分析结论都只是暂时的猜测.
= 自旋态验证
== 简述
1967年,R. I. Schermer和F. J. Shore等人设计了尽可能严谨的实验,通过使用极化中子束打击极化的含$isotope("U",a:235)$靶,在不同靶温度下测量透射效率,计算得到了各种热中子能量下，不同含$isotope("U",a:235)$物质的自旋态截面比,从而确定了低能区各个共振峰截面的自旋态关系，并尝试计算其具体组成比例
== 实验原理
=== 截面与极化度
极化中子和极化核之间的作用截面满足如下公式
$ sigma=I/(2I+1)(1-f_N f_n)sigma_-+(I+1)/(2I+1)(1+I/(I+1)f_N f_n)sigma_+ $其中$f_n,f_N$分别表示中子和核的极化度，$sigma_pm$表示两种自旋方向$J=I pm 1/2$的截面

为简便处理，将基底变换为极化相关和无关量$ sigma=sigma_0+f_N f_n sigma_p $其中$ cases(sigma_0=(I+1)/(2I+1)sigma_++I/(2I+1)sigma_-=sigma_(I+1\/2)+sigma_(I-1\/2),sigma_p=I/(2I+1)(sigma_+-sigma_-)=I/(I+1)sigma_(I+1\/2)-sigma_(I-1\/2)) $
#pagebreak()
=== 透射率与截面比
#let colored(x,c)=text(fill:c,$#x$)
本实验通过测量中子束穿过靶的透射率来细化分析截面比和极化度。记$cal(T)_P,cal(T)_A$分别是中子束极化方向与外加磁场同向和反向时的透射率，我们关心的是透射效率$ cal(E)=(cal(T)_P-cal(T)_A)/(cal(T)_P+cal(T)_A) $其与极化相关截面$sigma_p$满足如下近似关系$ cal(E)approx -colored(1/2 (1+phi)f_n,#rgb("#1410d4")) colored((sigma_p/sigma_0) f_N,#rgb("#ff0000")) colored(N sigma_0 t,#rgb("#00b7ff")) $
- $colored(1/2 (1+phi)f_n,#rgb("#1410d4"))$:$phi$是极化反转效率，$f_n$是中子极化度。可预先测量或设定

- $colored((sigma_p/sigma_0) f_N,#rgb("#ff0000"))$:核极化度$f_N$的数值和符号依据超精细作用的符号和强度，可通过测定核的自旋哈密顿量进一步计算@SA_1962

- $colored(N sigma_0 t,#rgb("#00b7ff"))$: $N$是靶核数密度，$t$是靶厚度。可通过非极化样品实验测定
== 实验装置及样品制备
=== 实验装置
#grid(columns: 2,[
  如右图所示，实验所用含$isotope("U",a:235)$的样品均被制备成长方体板，喷锡后焊接在到导热性能良好的铜套上，铜套的另一端与铜线相焊，铜线的最末端则是冷却盐
  \
  \
  \
  \

  实验者使用了了配备有低温恒温器的极化中子晶谱仪来利用“static method”制备极化中子束。该方法包括了两步绝热退磁处理
],figure(image("img/apparatus.png", width: 50%), caption: "实验装置示意图"))
#pagebreak()
=== 样品制备
由于$isotope("U",a:235)$自身难以在外场下产生较强极化，以及$isotope("U",a:234)$杂质的$alpha$衰变的产热不可忽略。实验者挑选了三种不同的含$isotope("U",a:235)$材料，其中只有含铀三氯化物$isotope("U",a:235)_x L a_(1-x) C l_3$能在外场下产生足够的极化度以进行较为精确的数据分析，并制备了浓度不同的五个样品，如下
- 纯铀金属，$isotope("U",a:234)$杂质含量为0.1%
(仅0.1%的$isotope("U",a:234)$杂质即可通过$alpha$衰变产生两倍于$isotope("U",a:235)$的热量)

- $U F e_2$金属间化合物，$isotope("U",a:234)$杂质含量为1.1%。杂质产热最强，且并非良热导体

- $isotope("U",a:235)_0.2L a_0.8 C l_3$，增大铀浓度可以提高透射效率，但更高的铀浓度($x>0.2$)可能会导致材料的磁性质在所测温度范围内发生变化

- $isotope("U",a:235)_0.02 L a_0.98 C l_3$，降低铀浓度有利于更好地控制温度，且让样品在更低温下保持顺磁性

- $isotope("U")_0.2 L a_0.8 C l_3$，正常同位素丰度的铀氯化物，$isotope("U", a: 235)$含量0.7%
== 数据分析与结论
=== 数据采集
#grid(columns:2,figure(image("img/data.png", width: 85%), caption: "测量范围"),figure(image("img/data1.png", width: 90%), caption: "截面数据示例"))
图3中记录了所进行的各组实验的实验条件，不同样品在不同中子能量和温度范围内进行了多组实验；图4截取了其中中子能量为$0.075 e V$时各组经处理后的透射效率$cal(E)$
#pagebreak()
=== 数据处理
可以从数据特征中观察到一些意料之中的现象，以佐证实验的有效性，例如
#grid(columns: 2,[
  - 由于在绝热退磁后冷藏盐的温度会缓慢上升，而透射效率可以分为温度无关的电子效应项和温度相关的核效应项，即$ cal(E)=alpha+beta/T $因此可以拟合计算$alpha$的数值。对于非磁性样品例如纯铀金属，$alpha$应等于0；而对于磁性样品，$alpha$应随着入射中子能量上升而迅速下降。这两点均得到了数据支持
- 由于$isotope("U", a: 234)$杂质$alpha$衰变放热以及存在导热上限，样品所能保持的温度存在一个下限，且不同样品的下限不同。如右图所示
],figure(image("img/tem_dep.png", width: 80%), caption: "透射效率与温度倒数关系曲线"))
#pagebreak()
=== 结论
在对各组样品的背景干扰做了修正，考虑了样品厚度的归一处理，以及将谱仪分辨率纳入误差分析后。根据前文所述实验原理，取$isotope("U",a: 235)_0.2 L a_0.8 C l_3$数据，不同入射中子能量下的截面比与核极化度的乘积$sigma_p/sigma_0 f_N$如下图所示(2.04eV由于误差过大，仅能确定符号)
#grid(columns: 2,[
  认为$f_N$的符号不随中子能量变化而变化，则可得到如下结论
  - 0.275和1.14eV的共振处于相反的自旋态

  - 能量最低的热中子对应的热截面处于与1.14eV相同的自旋态

  - 2.08eV的共振大概率和0.275eV的共振处于相同自旋态

],figure(image("img/data2.png"), caption: "不同中子能量下的截面比与极化度乘积"))
#pagebreak()
=== 讨论
我们已知$isotope("U", a: 235)$的基态角动量为$-7/2$，如果假设其核磁矩取负值，进而其核极化度$f_N$也取负值，那么进一步可以计算出不同共振峰处对应的具体角动量。例如在上述情形下有$ cases(J=I+1/2=4 \, & E_0=1.14e V,J=I-1/2=3\,&E_0=0.275e V) $
此外，即使基本只能保证$f_N$数据的数量级准确，但仍可以尝试对截面比的数值进行评估，例如取0.075eV的数据计算$ isotope("U", a: 235)_"metal":sigma_(I+1\/2)/sigma_0 =0.74 $
这意味着在入射中子能量为0.075eV时，纯铀金属中，大约四分之三的截面来自$I+1/2$的自旋态贡献
// == 缺少基于共振理论对u-235与低能中子截面的分析研究
// 由于u-235存在多个裂变反应道,以及在低能附近其裂变宽度与能级宽度大致相当,因此在相同自旋态的共振之间存在明显的干扰,单纯使用Breit-Wigner单能公式不足以进行全面地分析共振行为.即使已经有Wigner-Eisenbud正则化方法被使用,这种方法仍不适用于对u-235的分析,因为我们需要细致地区分不同能态的共振,但目前缺少这种基于截面数据对由于自旋产生的共振的分析方法.

// == u-235 的热截面
// u-235的热截面反常得大,这也是一个很难解释的问题.该现象通常被归因为中子结合能以下存在的若干个复合核状态,所谓“负能量共振”.如果确实只存在一个发生“负能量共振”的能态,它的影响将会非常大,作为u-235的热截面和能量关联的一个重要因素.当然,这是基于只存在一个能发生“负能量共振”的能态的假设前提下,如果存在更多的低于中子结合能的能态,那么整个过程的分析将会变得越发不定,充满主观的任意性.

// 事实上过去对于该截面的解读都绕不开这种任意性,导出的共振参数甚至主要取决于实验者早期的假设.例如

// > Shore和Sailor假定可观测到的最低共振能态：0.28eV和1.14eV仅存在彼此之间的相互干扰,而不存在与负能态的干扰
// == Slow Neutron Resonances
// u-235中的共振常常排列紧密,且相对较弱,尤其是在低于10eV的范畴,强度函数反常地小,遑论由于多普勒展宽的存在和仪器分辨率的限制,这使得实验数据的解释变得更加困难.除此之外,与非裂变重核不同,共振的裂变分量不能与Breit-Wigner单能公式很好地符合.而且在热中子能畴下,存在相比热截面贡献更大的“背景”截面.目前常常将这种“背景”截面解释为若干个会发生“负能量共振”的束缚能级.

// 本文的目标是展示通过高分辨率的晶谱仪测量得到的总截面和裂变截面数据.尝试使用由Reich and Moore导出的多极色散公式来分析,该公式对于单个裂变道是有效的.


#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("main.bib", style: "american-physics-society", title: "参考文献")
