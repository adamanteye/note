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
= Super-Kamiokande
== 概述
#grid(columns:3,[
  Super-Kamiokande(abbr. for Super-Kamioka Neutrino Detection Experiment)是世界上最大的切伦科夫探测器(直径39.3m,高度41.4m,填充50000t超纯水),探测目标包括质子衰变(没有实现),太阳中微子,大气中微子,超新星中微子.

  Super-K建造于1000米厚的岩层下的废弃矿井,对宇宙线muon的屏蔽效果等效于2700米的水深.
  ],figure(image("1.jpg", height: 60%), caption: "神岡町(岐阜県)"),figure(image("2.jpg", height: 60%), caption: "Super-K示意图"))
Super-K观测到的宇宙线muon通量为$qty("6e-8","cm^-2 s^-1 sr^-1")$.@fukuda_super-kamiokande_2003
== 成果
#figure(image("3.png",width: 100%), caption: "Super-K运行阶段") <sk-period>
@sk-period 摘自14年论文@abe_calibration_2014,实际上,SK-IV运行到2018年.同年Hyper-K设计报告发布.
- 发现了大气中微子振荡的证据@fukuda_evidence_1998,SNO实验在这之后做出了关键性贡献(证明了三种味的中微子总量是一定的).Kajita与McDonald分享了2015年诺贝尔奖
- 测量了太阳中微子通量@fukuda_measurements_1998,确定了太阳中微子振荡参数@fukuda_determination_2002
= Super-K的中子探测
== 不同能区的中子探测方法
= 中子本底的确定
= 总结
#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society", title: "参考文献")
