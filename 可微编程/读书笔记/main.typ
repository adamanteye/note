#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *

#set text(
  font: "Libertinus Serif",
  lang: "en",
  region: "us",
)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#let title = [Note on the Elements of Differentiable Programming]
#set document(title: [#title])
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)", supplement: [Eq.], number-align: bottom + right)

#show: thmrules
#let def = thmbox(
  "def",
  "Definition",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none,
)
#let thm = thmbox(
  "thm",
  "Theorem",
  inset: (x: 0em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none,
)
#let proof = thmproof("proof", "proof", inset: (x: 0.5em, top: 0em), base: "thm")

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)

= Introduction

This note is based on the book _The Elements of Differentiable Programming_ @blondel_elements_2024.

#def("Differentiable programming")[Differentiable programming is a programming paradigm in which complex computer programs (including those with control flows and data structures) can be differentiated end-to-end automatically, enabling gradient-based optimization of parameters in the program.]


#bibliography("main.bib", style: "american-physics-society")
