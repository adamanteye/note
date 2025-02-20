#import "physics.typ": *
#let def = thmbox(
  "thm",
  "定义",
  inset: (x: 0em, top: 0em),
  namefmt: strong,
  titlefmt: emph,
  base: none,
)
#let pst = thmbox(
  "thm",
  "公设",
  inset: (x: 0em, top: 0em),
  namefmt: strong,
  titlefmt: emph,
  base: none,
)
#let thm = thmbox(
  "thm",
  "定理",
  inset: (x: 0em, top: 0em),
  namefmt: strong,
  titlefmt: emph,
  base: none,
)
#let coll = thmbox(
  "coll",
  "推论",
  inset: (x: 0em, top: 0em),
  namefmt: strong,
  titlefmt: emph,
  base: "thm",
)
#let exmp = thmbox(
  "thm",
  "例",
  inset: (x: 0em, top: 0em),
  namefmt: strong,
  titlefmt: emph,
  base: none,
)
#let sol = thmproof(
  "sol",
  "解答",
  inset: (x: 0em, top: 0em),
  titlefmt: strong,
  base: "exmp",
)
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: strong,
  base: "thm",
)
