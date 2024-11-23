#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.0"
#import "@preview/unify:0.6.0": *
#import "@preview/codly:1.0.0": *
#import "@preview/codly-languages:0.1.1": *
#let red = rgb("#8c0000")
#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)
