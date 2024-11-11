#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.0"
#import "@preview/unify:0.6.0": *
#let def = thmbox(
  "thm",
  "定义",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none
)
#let pst = thmbox(
  "thm",
  "公设",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none
)
#let thm = thmbox(
  "thm",
  "定理",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none
)
#let coll = thmbox(
  "coll",
  "推论",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: "thm",
)
#let exmp = thmbox(
  "thm",
  "例",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none
)
#let sol = thmbox(
  "exmp",
  "解答",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none
)
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: emph,
  namefmt: x => [(#(strong(x)))],
  base: "thm"
)
#let conf(
  title: none,
  author: none,
  numbered-equation: false,
  doc,
) = {
  set document(title: title, author: author)
  set heading(numbering: "1.")
  show link: it => underline(text(fill: rgb("#8c0000"), it))
  set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
  set text(
    size: 12pt,
    font: ("Libertinus Serif", "Source Han Serif"),
    lang: "zh",
    region: "cn",
  )
  set quote(block: true)
  set par(leading: 1em)
  align(center, text(1.4em)[
    *#title*
  ])
  align(center, text(1.2em)[
    #author
  ])
  show: thmrules
  show: rest => columns(2, rest)
  set align(left)
  if numbered-equation {
    set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])
    doc
  } else {
    doc
  }

}
