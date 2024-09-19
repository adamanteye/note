#import "@preview/touying:0.5.2": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [中子质量精确测量调研报告],
    subtitle: [中子物理导论第一次大作业],
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

= 引言
- 1930年,德国物理学家Walther Bothe和Herbert Becker首次发现了中子辐射.这种中性辐射被Chadwick于1932年正确解释为中子
- 由于中子参与了反应能的大多数计算,精确测量中子能量是非常重要的
#pause
- 一些早期的中子质量测量@stephens_neutron-hydrogen_1947 结果有$qty("1.008941+-0.00002","u")$
- 1999年,新的中子质量测量@kessler_deuteron_1999 结果为$qty("1.00866491637+-0.00000000082","u")$,这一测量基于$isotope(D,a:2,z:1)$的结合能.$ isotope(n)+isotope(p)->isotope(d)+gamma $
- 根据#link("https://physics.nist.gov/cuu/pdf/wall_2022.pdf")[CODATA RECOMMENDED VALUES OF THE FUNDAMENTAL PHYSICAL CONSTANTS: 2022],当前中子质量的推荐值为$qty("1.008664 91606+-0.00000000040","u")$,测量精度与1999年的测量结果相当
= 基于结合能对中子质量的测量
== 概述
- 1986年G. L. Greene, E. G. Kessler, Jr.以及R. D. Deslattes的论文@kessler_deuteron_1999 的测量得到$isotope(D,a:2,z:1)$的结合能为$B(isotope(d))=qty("2.3881768+-0.0000024e-3","u")$,论文作者利用这一数据得到了中子质量的测量结果为$qty("1.008664919+-0.00000000014","u")$
- 在1986年到1999年间,两方面的进步提高了测量精度
  + 这里补充5,6论文
  + GAMS-4的0.1MeV到6MeV的$gamma$射线测量精度不断地得到改善
- 1999年, E.G. Kessler, Jr., M.S. Dewey, R.D. Deslattes, A. Henins, H.G. Borner, M. Jentschel, C. Doll以及H. Lehmann又利用更准确的原子质量数据重新计算了中子质量
== 从结合能得到中子质量

= 总结
#show: appendix
#set text(font: ("Linux Libertine", "Source Han Serif SC"), lang: "en", region: "us")
#bibliography("ref.bib", style: "american-physics-society")
