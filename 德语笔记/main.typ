#set text(
  font: ("Libertinus Serif", "Source Han Serif"),
  lang: "de",
  region: "de",
)
#let title = "德语笔记"
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#show figure.where(kind: table): set block(breakable: true)
#align(
  center,
  text(17pt)[
    *#title*
  ],
)

#align(
  center,
  text(15pt)[
    #thisauthor
  ],
)

#columns(2)[
  = 形容词
  #set heading(offset: 1)
  #include "形容词.typ"
  #set heading(offset: 0)
]
= 动词
#set heading(offset: 1)
#include "动词.typ"
#set heading(offset: 0)
#include "动词表.typ"
#columns(2)[
  = 数词
  #set heading(offset: 1)
  #include "数词.typ"
  #set heading(offset: 0)
]
= 阅读和翻译练习
#include "阅读和翻译练习.typ"
