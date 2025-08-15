#import "../../../note-en.typ": *
#show: conf.with(
  title: "Note on the Elements of Differentiable Programming",
  author: "adamanteye",
  numbered-equation: true,
)
#show: rest => columns(2, rest)
= Introduction
This note is based on the book _The Elements of Differentiable Programming_ @blondel_elements_2024.
#def(
  "Differentiable programming",
)[Differentiable programming is a programming paradigm in which complex computer programs (including those with control flows and data structures) can be differentiated end-to-end automatically, enabling gradient-based optimization of parameters in the program.]

#bibliography("main.bib", style: "american-physics-society")
