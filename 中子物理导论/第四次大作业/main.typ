#import "@preview/touying:0.5.3": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#let pm=$plus.minus$
#set text(font: ("Libertinus Serif", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [$isotope("Pu", a:239)(n,f)$瞬发裂变中子谱的预平衡不对称],
    subtitle: [中子物理导论第四次大作业],
    authors: ("杨哲涵", "司书屹"),
    date: datetime(year: 2024, month: 10, day: 25),
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
