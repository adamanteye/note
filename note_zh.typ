#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.0"
#import "@preview/unify:0.6.0": *
#import "@preview/codly:1.0.0": *
#import "@preview/codly-languages:0.1.1": *
#let red = rgb("#8c0000")
#let def = thmbox(
  "thm",
  "定义",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none
)
#let pst = thmbox(
  "thm",
  "公设",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none
)
#let thm = thmbox(
  "thm",
  "定理",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none
)
#let coll = thmbox(
  "coll",
  "推论",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: "thm",
)
#let exmp = thmbox(
  "thm",
  "例",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none
)
#let sol = thmbox(
  "exmp",
  "解答",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none
)
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: x => text(fill: red, x),
  base: "thm"
)
#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)
#let conf(
  title: none,
  author: none,
  numbered-equation: false,
  doc,
) = {
  if author != none {
    set document(title: title, author: author)
  } else {
    set document(title: title)
  }
  set heading(numbering: "1.")
  show link: it => underline(text(fill: red, it), offset: 0.2em)
  show: codly-init.with()
  codly(languages: codly-languages)
  set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
  set text(
    size: 12pt,
    font: ("Libertinus Serif", "霞鶩文楷 TC"),
    lang: "zh",
    region: "cn",
  )
  set quote(block: true)
  set par(leading: 1em)
  align(center, text(1.4em)[
    *#title*
  ])
  if author != none {
    align(center, text(1.2em)[
      #author
    ])
  }
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
