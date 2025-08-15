#import "../../../slide-zh.typ": *
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [轻水切伦科夫探测器的中子探测调研报告],
    subtitle: [中子物理导论第二次大作业],
    authors: ("杨哲涵", "司书屹"),
    date: datetime(day: 29, year: 2024, month: 9),
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
  config-methods(cover: utils.semi-transparent-cover),
  footer-a: self => self.info.subtitle,
)
#set text(size: 20pt)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#title-slide()

== 目录 <touying:hidden>
#align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))
= 中微子质量的认识
== 发现
1914年,Chadwick发现$beta$衰变能谱是连续的,这一发现在1927年又被Ellis和Wooster证实.当时人们怀疑在这个过程中,是否存在能量不守恒.

随后,Pauli在1930年的一封信中提到,设想存在一种中性弱相互作用费米子,就可以解决这个问题.Pauli当时把这种粒子称为 "neutron".

不过Chadwick在1932年发现了我们今天所了解的 "neutron",随后Fermi把Pauli提到的"neutron"重命名为 "neutrino".在1933年,Fermi和Perrin独立得出结论,中微子不应当有质量. @giunti_fundamentals_2007
== 中微子振荡现象
#grid(
  columns: 2,
  [
    1967-1969年间,Pontecorvo等人提出$nu_e$和$nu_mu$是两种中微子质量本征态的混合态.

    1975-1976年间,Eliezer和Swift等人将中微子振荡理论发展成熟.

    中微子振荡作为一种量子现象,其参数可以类比不同本征基矢间的表象变换矩阵.

    记中微子3种味的本征态为$ket(nu_alpha),alpha=e,mu,tau$,3种质量的本征态为$ket(nu_i),i=1,2,3$.
  ],
  figure(image("4.svg", height: 60%), caption: "中微子的三种味"),
)
描述中微子振荡的矩阵被称为PMNS矩阵(Pontecorvo-Maki-Nakagawa-Sakata Matrix),常记为$U$.
$ ket(nu_alpha)=sum_i U_(alpha i) ket(nu_i) $
$
  U=mat(1, 0, 0; 0, cos theta_(23), sin theta_(23); 0, -sin theta_(23), cos theta_(23))mat(cos theta_(13), 0, sin theta_(13)e^(-i delta); 0, 1, 0; -sin theta_(13), 0, cos theta_(13))mat(cos theta_(12), sin theta_(12), 0; -sin theta_(12), cos theta_(12), 0; 0, 0, 1)mat(e^(i alpha_1\/2), 0, 0; 0, e^(i alpha_2\/2), 0; 0, 0, 1)
$
对于某个本征态为$ket(nu_j)$的中微子,其行进$t$时间后可以如此描述
$ ket(nu_j (t))=e^(-i(E_j t-va(p)dprod va(x))) ket(nu_j (0)) $
上式取自然单位制($c=hbar=1$)
$ E_j=sqrt(p_j^2+m_j^2)approx.eq E+m_j^2 / (2E) $
将$t$换成传播距离$L$后有
$ ket(nu_j (L))=e^(-i (m_j^2 L) / (2E)) ket(nu_j (0)) $

#grid(
  columns: (2fr, 1fr),
  [
    上面均采用质量本征态描述,那么在味本征态描述下
    $
      P_(alpha -> beta)&=abs(braket(nu_beta, nu_alpha (L)))^2\ &=abs(sum_j U_(alpha j)^* U_(beta j)e^(-i (m_j^2 L) / (2E)))^2\ &=delta_(alpha beta)-4sum_(j>k)Re{U^*_(alpha j)U_(beta j)U_(alpha k)U^*_(beta k)}sin^2((Delta m_(j k)^2 L) / (4E))\ &+2sum_(j>k)Im{U^*_(alpha j)U_(beta j)U_(alpha k)U^*_(beta k)}sin((Delta m_(j k)^2 L) / (2E))
    $
    这便给出了味变化的概率.

    我国的大亚湾核反应堆中微子实验测量@an_observation_2012 得到$sin^2(2theta_(13))=0.092plus.minus 0.016"(stat.)" plus.minus 0.005"(syst.)"$

    其他已经测得的参数有
    - $sin^2(2theta_(12))=0.0846plus.minus 0.021$
    - $sin^2(2theta_(23))>0.92"at 90% confidence level"$
    - $Delta m_(21)^2=qty("0.753+-0.018e-4", "eV^2")$
    - $abs(Delta m_(31)^2)approx abs(Delta m_(32)^2)=qty("24.4+-0.6e-4", "eV^2")$
    目前未知的参数有
    - $delta,alpha_1,alpha_2$
    - 质量顺序,即$Delta m_(31)^2$的正负
  ],
  [#figure(image("5.svg", height: 26%), caption: [$nu_e$振荡]),#figure(image("6.svg", height: 26%), caption: [$nu_mu$振荡]),#figure(image("7.svg", height: 26%), caption: [$nu_tau$振荡])],
)
= Super-Kamiokande
== 概述
#grid(
  columns: 3,
  [
    Super-Kamiokande(Super-Kamioka Neutrino Detection Experiment)是世界上最大的切伦科夫探测器(直径39.3m,高度41.4m,填充50000t超纯水).

    Super-K的前身为1982年小柴昌俊(Koshiba)建设的神冈探测器.探测目标包括质子衰变(没有实现),太阳中微子,大气中微子,超新星中微子.
  ],
  figure(image("1.jpg", height: 60%), caption: "神岡町(岐阜県)"),
  figure(image("2.jpg", height: 60%), caption: "Super-K示意图"),
)
Super-K建造于1000米厚的岩层下的废弃矿井,对宇宙线muon的屏蔽效果等效于2700米的水深.观测到的宇宙线muon通量为$qty("6e-8", "cm^-2 s^-1 sr^-1")$.@fukuda_super-kamiokande_2003
== 结构
#grid(
  columns: 3,
  column-gutter: 1em,
  [
    Super-K有两层PMT探测器,称为ID(Inner Detector)和OD(Outer Detector)@fukuda_super-kamiokande_2003

    ID装有32吨水,朝内安装有$num("11146")$只50 cm PMT (Hamamatsu R3600)

    OD用来反符合探测,朝外安装有$num("1885")$只20 cm PMT (Hamamatsu R1408)
  ],
  figure(image("9.jpg", height: 70%), caption: "Super-K剖面"),
  figure(image("10.jpg", height: 80%), caption: "Super-K广角摄影"),
)
== 成果
#figure(image("3.png", width: 100%), caption: "Super-K运行阶段") <sk-period>
@sk-period 摘自14年论文@abe_calibration_2014,实际上,SK-IV运行到2018年.同年Hyper-K设计报告发布.
- 发现了大气中微子振荡的证据@fukuda_evidence_1998,SNO实验在这之后做出了关键性贡献(证实了三种味的中微子总量是一定的).为此梶田隆章(Kajita)与McDonald分享了2015年诺贝尔奖
- 测量了太阳中微子通量@fukuda_measurements_1998,确定了太阳中微子振荡参数@fukuda_determination_2002
= Super-K的中子探测
== 中子探测基本原理
#grid(
  columns: 2,
  column-gutter: 2em,
  [
    中子不带电,因此通过物质时和物质中的电子不发生作用,不能直接引起电离,而是通过与原子核相互作用产生能引起电离的次级粒子才能被记录.

    中子按能量可以分为
    / 低能中子(cadmium cut-off): $0~0.4$eV
      - 超冷中子(ultra-cold)
      - 冷中子(cold)
      - thermal
      - hot
    / 中能中子(epithermal): $<200$keV
    / 快中子(fast): $0.2~20$MeV
    / 高能中子(high energy): $>20$MeV
  ],
  [
    利用中子与原子核的相互作用的来探测的方法有 @pietropaolo_neutron_2020
    / 带电粒子发射的放能反应(Exoergic reactions featuring emission of charged particles): $isotope("B", a: 10)$,$isotope("Li", a: 6)$,$isotope("He", a: 3)$
      $ n+isotope("B", a: 10)->isotope("Li", a: 7)+isotope("He", a: 4) $
    / 辐射俘获(Radiative capture): $(n,gamma)$
      $ n+isotope("Gd", a: 155)->isotope("Gd", a: 156)+gamma+"IC"e^-+"A"e^- $ $"IC"e^-$是内转换电子,$"A"e^-$是俄歇电子
    / 核裂变:
    / 吸能反应:
  ],
)
== 切伦科夫辐射
#grid(
  columns: 2,
  column-gutter: 1em,
  [
    Super-K是轻水切伦科夫探测器,收集中微子发生反应后的带电粒子的切伦科夫辐射光子(Cherenkov Radiation).

    对于以$v_p=beta c$运动的带电粒子,穿过折射率$n$的介质时,若速度超过光在介质中的相速度,会产生锥状向前的辐射,即条件为
    $ c / n<v_p<c $

    测量角度即可得到带电粒子的速度
    $ cos theta=1 / (n beta) $
    水在20摄氏度时$n=1.33$,切伦科夫辐射的阈值速度为$0.75c$,对于电子$v_p=0.75c$,有$E=m_0c^2 / sqrt(1-beta^2)=qty("0.77", "MeV")$,小于此能量的电子无法引发切伦科夫辐射
  ],
  [#figure(image("8.svg", height: 40%), caption: "切伦科夫辐射")#figure(
      image("11.jpg", height: 40%),
      caption: [$nu_e$事例],
    )],
)
== 为什么需要中子探测
Super-K缺乏反中微子标记的手段.具体而言
$ overline(nu_e)+p->e^++n $
在这一步产生的中子在水中经过大概20次和自由质子的碰撞,迅速($10mu$s)热化,能量从10keV量级降低到0.025eV量级.再经过$200mu$s左右,中子被氢原子俘获
$ n+p->d+gamma+qty("2.2", "MeV") $
这里产生的康普顿散射电子能量接近切伦科夫阈值($qty("0.77", "MeV")$),而传统的切伦科夫探测器的触发阈值在$qty("5", "MeV")$左右,因此这些中子俘获不会被记录,Super-K从而不能标记反中微子和质子的俘获 @watanabe_first_2009

如果能解决这一问题,会对超新星中微子的研究产生很大帮助,因此在2009年的这篇论文中@watanabe_first_2009,作者提出了两种独立的方法记录中子俘获,并且分析了这两种方法的测试结果.
== 实验设计
#grid(
  columns: 2,
  column-gutter: 1em,
  [
    / 中子源: 论文使用了$isotope("Am")$/$isotope("Be")$(镅-铍)中子放射源(96$mu$Ci).放射源被置于一个立方BGO闪烁体内部,这可以产生被标记好的中子
      $ alpha+isotope("Be", a: 9)->isotope("C", a: 12)^*(4.43"MeV"gamma)+n $
    / 氯化钆$gamma$射线重建(方法一): - 利用氯化钆的中子俘获反应产生的高能$gamma$射线
      - 优点:顶点,时间,能量重建效率高
    / 强制触发重建(方法二): - 通过引入新的强制触发逻辑实现
      - 缺点:大多数被记录的事例因为能量太低无法重建
  ],
  figure(image("12.jpg", height: 80%), caption: [实验方法一设计]),
)
== 氯化钆$gamma$射线重建
使用了2.4L 0.2% $isotope("Gd")isotope("Cl")_3$水溶液,中子在其中被俘获,产生8MeV的$gamma$射线
#grid(
  columns: 2,
  figure(image("14.jpg"), caption: [$Delta T$ between prompt and delayed triggers]),
  figure(image("17.jpg", width: 100%), caption: [顶点重建]),
)
#figure(image("15.jpg", height: 90%), caption: [能量及时间重建])
== 强制触发重建
#grid(
  columns: (2fr, 1fr),
  column-gutter: 1em,
  [
    在Super-K的正常数据采集过程中,ID中源自所有同时发生的PMT信号总数(HITSUM)有3种触发信号
    - 超低能触发(SLE)
    - 低能触发(LE)
    - 高能触发(HE)

    为了测量中子标记效率,开发了一个与当前Super-K电子设备兼容的标准核仪器模块(NIM)
  ],
  figure(image("13.jpg", height: 40%), caption: [强制触发信号]),
)
#figure(
  image("16.jpg", height: 85%),
  caption: [Distributions of discriminating variables for signal (open histogram) and background (hatched)],
)
= 总结
== Super-K的中子探测
/ 方法一: 实现了66.7%的中子探测效率,延迟事件的能量阈值为3MeV,背景降低水平为$2times 10^(-4)$
/ 方法二: 强制触发,搜索自由中子捕获的2.2MeV$gamma$射线,其中子探测效率随位置变化,范围在13.1%到24.5%之间

研究的结果验证了在大型水切伦科夫探测器中使用10MeV甚至更低能量阈值的可行性

研究有利于
+ 观察扩散超新星中微子背景,尽管理论估计存在差异,但通过中子标记的Super-K应该每年观察到一些超新星中微子事件
+ 从日本核电站收集到的反中微子年事例率可以达5000件,分析这些数据可以最精确地测量太阳中微子振荡参数
+ 为自由质子衰变候选提供降低本底的方法
#show: appendix
#set text(lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society", title: "参考文献")
