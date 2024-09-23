#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Super-K的中子探测调研报告],
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
#set text(size: 22pt)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#title-slide()

== 目录 <touying:hidden>

#align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))

= 超级神冈实验
= 中子本底的确定
= 总结
#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society", title: "参考文献")
