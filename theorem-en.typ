#import "physics.typ": *
#let def = thmbox(
  "thm",
  "Def",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let pst = thmbox(
  "thm",
  "Post",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let thm = thmbox(
  "thm",
  "Thm",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let coll = thmbox(
  "coll",
  "Coll",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: "thm",
)
#let exmp = thmbox(
  "thm",
  "Exmp",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let sol = thmproof(
  "sol",
  "Sol",
  inset: (x: 0em, top: 0em),
  titlefmt: x => strong(text(fill: red, x)),
  base: "exmp",
)
#let proof = thmproof(
  "proof",
  "Proof",
  inset: (x: 0em, top: 0em),
  titlefmt: x => text(fill: red, x),
  base: "thm",
)
