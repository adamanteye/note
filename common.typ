#import "physics.typ": *
#import "@preview/cetz:0.4.0"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
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
