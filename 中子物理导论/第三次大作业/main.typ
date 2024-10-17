#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

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
此前在热中子能量范畴内对u-235的吸收截面的分析过程中,实验者发现对于已确定的共振峰截面,只有很少一部分能够真正归因于热吸收截面,具体大约11%(75 out of 685 barns).我们将此归因于多个潜在的处于负能量范围的束缚能态的干扰,产生所谓"背景"截面.尤其是对于0.29和1.14eV的共振峰,它们与束缚能态的自旋态关系决定了其异常截面大小是否确实来自于束缚能态的干扰,不同学者曾从不同的假设出发进行解释研究

== "负能量"共振
1958年,Brookhaven国家实验室(美)的F. J. Shore 和 V. L. Sailor假定束缚能级与0.29和1.14eV共振能级的自旋态相反,即它们之间不存在相干.@SNR_1958

通过利用四种拟合模型对吸收截面曲线进行最小二乘拟合,得到了最符合“背景”截面曲线的函数拟合 $ sigma_(n X)(E)=K sqrt(E)/(E-E_0)^2 $$ cases(K=208.5 "barn" (e V)^(5/2), E_0=-1.45e V) $
对比描述单能共振峰的Breit-Wigner公式$ sigma_(n,X)(E)=4 pi lambda^2((Gamma_n Gamma_X)/Gamma^2)1/(1+4(E-E_R)^2\/Gamma^2) $

因此,他们认为这种"背景"截面近似等价于来自一个位于结合能以下1.45eV处,等效中子宽度$Gamma_n^0=3.04times 10^(-3)e V$的较强的单能共振峰的干涉效应#figure(image("img/BACKGROUND.png", width: 50%), caption: "裂变截面数据曲线")
== Vogt
- Vogt 则认为束缚能级与这两个能级具有形同的自旋态,因此存在相干.认为这种“背景”截面来自于$E_0=-0.95e V,Gamma_n^0=1.49times 10^(-3)e V$处的等效共振峰的干涉效应

这两种相互矛盾的解说绕过了解释u-235的慢中子截面中最重要的未解之谜,如果不能通过实验验证具体的自旋情况,所有针对低能共振的相关分析结论都只是暂时的猜测.
= 自旋态验证
== 简述
1967年,R. I. Schermer和F. J. Shore等人设计了尽可能严谨的实验,通过使用极化中子束打向极化的含$U^235$靶,在不同靶温度下测量不同极化方向下的透射率,计算得到了多种含$U^235$物质的不同自旋态截面比,从而得到如下结论
- 1
- 2
- 3
== 实验原理
极化中子和极化核
== 实验装置及材料准备

== 数据分析

== 缺少基于共振理论对u-235与低能中子截面的分析研究
由于u-235存在多个裂变反应道,以及在低能附近其裂变宽度与能级宽度大致相当,因此在相同自旋态的共振之间存在明显的干扰,单纯使用Breit-Wigner单能公式不足以进行全面地分析共振行为.即使已经有Wigner-Eisenbud正则化方法被使用,这种方法仍不适用于对u-235的分析,因为我们需要细致地区分不同能态的共振,但目前缺少这种基于截面数据对由于自旋产生的共振的分析方法.

== u-235 的热截面
u-235的热截面反常得大,这也是一个很难解释的问题.该现象通常被归因为中子结合能以下存在的若干个复合核状态,所谓“负能量共振”.如果确实只存在一个发生“负能量共振”的能态,它的影响将会非常大,作为u-235的热截面和能量关联的一个重要因素.当然,这是基于只存在一个能发生“负能量共振”的能态的假设前提下,如果存在更多的低于中子结合能的能态,那么整个过程的分析将会变得越发不定,充满主观的任意性.

事实上过去对于该截面的解读都绕不开这种任意性,导出的共振参数甚至主要取决于实验者早期的假设.例如

> Shore和Sailor假定可观测到的最低共振能态：0.28eV和1.14eV仅存在彼此之间的相互干扰,而不存在与负能态的干扰
== Slow Neutron Resonances
u-235中的共振常常排列紧密,且相对较弱,尤其是在低于10eV的范畴,强度函数反常地小,遑论由于多普勒展宽的存在和仪器分辨率的限制,这使得实验数据的解释变得更加困难.除此之外,与非裂变重核不同,共振的裂变分量不能与Breit-Wigner单能公式很好地符合.而且在热中子能畴下,存在相比热截面贡献更大的“背景”截面.目前常常将这种“背景”截面解释为若干个会发生“负能量共振”的束缚能级.

本文的目标是展示通过高分辨率的晶谱仪测量得到的总截面和裂变截面数据.尝试使用由Reich and Moore导出的多极色散公式来分析,该公式对于单个裂变道是有效的.


#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("main.bib", style: "american-physics-society", title: "参考文献")
