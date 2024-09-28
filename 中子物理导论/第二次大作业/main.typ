#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Super-K的中子本底探测调研报告],
    subtitle: [中子物理导论第二次大作业],
    authors: ("杨哲涵","司书屹"),
    date: datetime.today(),
    institution: [工物系],
    logo: none,
  ),
  config-colors(
    primary: rgb(106,8,116),
    secondary: rgb("#6908749c"),
    tertiary: rgb("#7DB9DE"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#434343"),
  ),
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
#grid(columns:2,[
  1967-1969年间,Pontecorvo等人提出并发展了$nu_e$和$nu_mu$是两种中微子质量本征态的混合态.

  1975-1976年间,Eliezer和Swift等人将中微子振荡理论发展成熟.

  中微子振荡作为一种量子现象,其参数可以类比不同本征基矢间的表象变换矩阵.

  记中微子3种味的本征态为$ket(nu_alpha),alpha=e,mu,tau$,3种质量的本征态为$ket(nu_i),i=1,2,3$.
  ],figure(image("4.svg", height: 60%), caption: "中微子的三种味"))
描述中微子振荡的矩阵被称为PMNS矩阵(Pontecorvo-Maki-Nakagawa-Sakata Matrix),常记为$U$.
$ ket(nu_alpha)=sum_i U_(alpha i) ket(nu_i) $
$ U=mat(1,0,0;0,cos theta_(23),sin theta_(23);0,-sin theta_(23),cos theta_(23))mat(cos theta_(13),0,sin theta_(13)e^(-i delta);0,1,0;-sin theta_(13),0,cos theta_(13))mat(cos theta_(12),sin theta_(12),0;-sin theta_(12),cos theta_(12),0;0,0,1)mat(e^(i alpha_1\/2),0,0;0,e^(i alpha_2\/2),0;0,0,1) $
对于某个本征态为$ket(nu_j)$的中微子,其行进$t$时间后可以如此描述
$ ket(nu_j (t))=e^(-i(E_j t-va(p)dprod va(x))) ket(nu_j (0)) $
上式取自然单位制($c=hbar=1$)
$ E_j=sqrt(p_j^2+m_j^2)approx.eq E+m_j^2/(2E) $
将$t$换成传播距离$L$后有
$ ket(nu_j (L))=e^(-i (m_j^2 L)/(2E)) ket(nu_j (0)) $

#grid(columns:(2fr,1fr),[
  上面均采用质量本征态描述,那么在味本征态描述下
  $ P_(alpha -> beta)&=abs(braket(nu_beta,nu_alpha (L)))^2\ &=abs(sum_j U_(alpha j)^* U_(beta j)e^(-i (m_j^2 L)/(2E)))^2\ &=delta_(alpha beta)-4sum_(j>k)Re{U^*_(alpha j)U_(beta j)U_(alpha k)U^*_(beta k)}sin^2((Delta m_(j k)^2 L)/(4E))\ &+2sum_(j>k)Im{U^*_(alpha j)U_(beta j)U_(alpha k)U^*_(beta k)}sin((Delta m_(j k)^2 L)/(2E)) $
  这便给出了味变化的概率.

  我国的大亚湾核反应堆中微子实验测量得到$sin^2(2theta_(13))=0.092plus.minus 0.016"(stat.)" plus.minus 0.005"(syst.)"$

  其他已经测得的参数有
  - $sin^2(2theta_(12))=0.0846plus.minus 0.021$
  - $sin^2(2theta_(23))>0.92"at 90% confidence level"$
  - $Delta m_(21)^2=qty("0.753+-0.018e-4","eV^2")$
  - $abs(Delta m_(31)^2)approx abs(Delta m_(32)^2)=qty("24.4+-0.6e-4","eV^2")$
  目前未知的参数有
  - $delta,alpha_1,alpha_2$
  - 质量顺序,即$Delta m_(31)^2$的正负
  ],[#figure(image("5.svg", height: 26%),caption:[$nu_e$振荡]),#figure(image("6.svg", height: 26%),caption:[$nu_mu$振荡]),#figure(image("7.svg", height: 26%),caption:[$nu_tau$振荡])])
= Super-Kamiokande
== 概述
#grid(columns:3,[
  Super-Kamiokande(Super-Kamioka Neutrino Detection Experiment)是世界上最大的切伦科夫探测器(直径39.3m,高度41.4m,填充50000t超纯水).
  
  Super-K的前身为1982年小柴昌俊(Koshiba)建设的神冈探测器.探测目标包括质子衰变(没有实现),太阳中微子,大气中微子,超新星中微子.
  ],figure(image("1.jpg", height: 60%), caption: "神岡町(岐阜県)"),figure(image("2.jpg", height: 60%), caption: "Super-K示意图"))
Super-K建造于1000米厚的岩层下的废弃矿井,对宇宙线muon的屏蔽效果等效于2700米的水深.观测到的宇宙线muon通量为$qty("6e-8","cm^-2 s^-1 sr^-1")$.@fukuda_super-kamiokande_2003
== 成果
#figure(image("3.png",width: 100%), caption: "Super-K运行阶段") <sk-period>
@sk-period 摘自14年论文@abe_calibration_2014,实际上,SK-IV运行到2018年.同年Hyper-K设计报告发布.
- 发现了大气中微子振荡的证据@fukuda_evidence_1998,SNO实验在这之后做出了关键性贡献(证实了三种味的中微子总量是一定的).为此梶田隆章(Kajita)与McDonald分享了2015年诺贝尔奖
- 测量了太阳中微子通量@fukuda_measurements_1998,确定了太阳中微子振荡参数@fukuda_determination_2002
= Super-K的中子探测
== 不同能区的中子探测方法
= 中子本底的确定
= 总结
#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society", title: "参考文献")
