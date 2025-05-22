#import "../../../slide_zh.typ": *
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [中子质量精确测量调研报告],
    subtitle: [中子物理导论第一次大作业],
    authors: ("杨哲涵", "司书屹"),
    date: datetime.today(),
    institution: [工程物理系],
    logo: none,
  ),
  config-colors(
    primary: rgb(106, 8, 116),
    secondary: rgb("#6908749c"),
    tertiary: rgb("#7DB9DE"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#434343"),
  ),
  footer-a: self => self.info.subtitle,
)
#set text(size: 22pt)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#title-slide()

== 目录 <touying:hidden>

#align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))

= 中子质量测量概述
== 中子的发现
- 1930年,德国物理学家Walther Bothe和Herbert Becker首次发现了中子辐射.这种中性辐射被Chadwick于1932年正确解释为中子
- 由于中子参与了反应能的大多数计算,精确测量中子能量是非常重要的
- 一些早期的中子质量测量@stephens_neutron-hydrogen_1947 结果有$qty("1.008941+-0.00002", "u")$
- 1999年,新的中子质量测量@kessler_deuteron_1999 结果为$qty("1.00866491637+-0.00000000082", "u")$,这一测量基于$isotope(D, a: 2, z: 1)$的结合能.$ isotope(n)+isotope(p)->isotope(d)+gamma $
- 根据#link("https://physics.nist.gov/cuu/pdf/wall_2022.pdf")[CODATA RECOMMENDED VALUES OF THE FUNDAMENTAL PHYSICAL CONSTANTS: 2022],当前中子质量的推荐值为$qty("1.008664 91606+-0.00000000040", "u")$,测量精度与1999年的测量结果相当
= 基于结合能对中子质量的测量
== 概述
- 1986年G. L. Greene, E. G. Kessler, Jr.以及R. D. Deslattes的论文@kessler_deuteron_1999 的测量得到$isotope(D, a: 2, z: 1)$的结合能为$B(isotope(d))=qty("2.3881768+-0.0000024e-3", "u")$,论文作者利用这一数据得到了中子质量的测量结果为$qty("1.008664919+-0.00000000014", "u")$
- 在1986年到1999年间,原子质量测量与GAMS-4装置的进步提高了测量精度
  + 1993,研究人员开发了一种基于经典分离振荡场技术的改进方法@PhysRevLett.71.1998, 大幅提高了氢,氘和中子的质量测量精度,精确度相比前值提高了约40倍
  + 1994年发表的研究@PhysRevLett.73.1481, 通过对20对交替捕获离子的回旋频率进行比较,成功测量了10种原子的质量,准确度达到$num("10e-10")$，为中子质量的测量提供了重要参考
  + GAMS-4的0.1MeV到6MeV的$gamma$射线测量精度不断地得到改善
    - 为晶体光谱仪配备精确定位的隔振平台
    - 改进角度干涉仪(angle interferometers)
    - 更多几乎完美的硅和锗晶体
- 1999年, E.G. Kessler, Jr., M.S. Dewey, R.D. Deslattes, A. Henins, H.G. Borner, M. Jentschel, C. Doll以及H. Lehmann又利用更准确的原子质量数据重新计算了中子质量,结果为$qty("1.00866491637+-0.00000000082", "u")$
== 实验方法
1986年实验与1999年的实验设置是基本一样的,实验均在GAMS-4(位于法国Grenoble的高精度伽马射线计量实验室，连接到一个反应堆端口)完成.

基本方法是通过Bragg衍射测量$gamma$射线的能量,然后利用结合能计算中子质量.

/ $gamma$射线源: Kapton塑料(N2H10O5C22),放置于Institut Max von Laue-Paul Langevin的一个高通量反应堆堆芯附近
  - 反应堆到Kapton塑料上的热中子能量分布近似为Maxwell分布,峰值为$qty("56", "MeV")$
  - 中子通量$qty("5e14", "cm^-2 s^-1")$
/ 晶体: $qty("2.5", "mm")$厚的硅片,晶格间距以米为单位测量,误差为$num("5e-8")$
/ 干涉仪: 经常校准,测量衍射角度的精度可以达到$num("1e-7")$
== GAMS-4装置
#figure(image("4.png", height: 90%), caption: [GAMS-4双晶谱仪 @kessler_gams4_2001])
== Bragg衍射
#grid(
  columns: (1.5fr, 1fr),
  [
    布拉格衍射(又称X射线衍射的布拉格形式),最早由Sir William Lawrence Bragg及Sir William Henry Bragg于1913年提出.

    $ n lambda=2d sin theta $

    模型中晶体为一组各自分离的平行平面,相邻平面间的距离皆为一常数$d$

    如果各平面反射出来的X射线成相长干涉的话,那么入射的X射线经晶体反射后会产生尖峰

  ],
  figure(image("2.svg", height: 70%), caption: "Bragg衍射示意图"),
)

== 双晶谱仪测量$gamma$射线能量
#grid(
  columns: (1.5fr, 1fr),
  [
    双晶谱仪是一种用于测量$gamma$射线衍射角的仪器, @two-flat-crystal 展示了双晶谱仪的结构和工作状态,它由3个准直器和2个晶体构成.第1个晶体与第2个晶体都可以独立调整衍射级别.

    其优点在于,第1个晶体确保了只有高度准直的,几乎单色的辐射可以落在第二个晶体上

    实验中,用$(m,n)$表示第1,2两个晶体的衍射级别,共进行了3种不同级别的测量,分别为$(1,2)$,$(1,-2)$,$(1,3)$,$(1,-3)$,$(2,2)$,$(2,-1)$.
  ],
  [#figure(image("1.png", height: 90%), caption: [双晶方法$(1,-1)$及$(1,1)$]) <two-flat-crystal>],
)
== 测量结果
#figure(image("3.png"), caption: [论文 @kessler_deuteron_1999 给出的测量结果])
经过上述测量后,得到了$isotope(n)+isotope(p)->isotope(d)+gamma$的2.2MeV $gamma$射线的对应Bragg角度
== 从结合能得到中子质量
对于中子质量,以相对原子质量单位表达的式子为$ A_r (isotope(d))=A_r (isotope(H, a: 2))-A_r (isotope(H, a: 1)) + B(isotope(d)) / unit("u") $
1999年E.G. Kessler等人的论文 @kessler_deuteron_1999 使用的数据为
- $B(d)=qty("2224566.14+-0.41", "eV")$
- $A_r (isotope(H, a: 2))-A_r (isotope(H, a: 1))=qty("1.00627674630+-0.00000000071", "u")$

#show: appendix
#set text(lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society", title: "参考文献")
