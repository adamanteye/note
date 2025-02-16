#import "@preview/physica:0.9.4": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.2"
#import "@preview/unify:0.7.0": *
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.6": *
#let red = rgb("#8c0000")
#let maroon = rgb("#e64553")
#let orange = rgb("#db6600")
#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)
#let smcp(it) = {
  set text(features: ("smcp",), fill: orange)
  it
}
