#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *

#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [在SNO+水相实验中测量中子-质子俘获],
    subtitle: [中子物理导论第三次大作业],
    authors: ("杨哲涵","司书屹"),
    date: datetime(year: 2024, month: 10, day: 11),
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
= 介绍
== SNO+实验
SNO+是一项大型液体闪烁体实验,位于加拿大萨德伯里一个矿区.具有$qty("5890+-94","m")$等效水深.

SNO+的主要目标是寻找无中微子双$beta$衰变(0$nu beta beta$)@andringa_current_2016.
= 中子俘获分析
= 热中子-质子俘获截面
= 总结
得到热中子-质子俘获界面为$num("336.3+1.2-1.5")$mb@anderson_measurement_2020.
#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("main.bib", style: "american-physics-society", title: "参考文献")
