#import "common.typ": *
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
    font: "Libertinus Serif",
    lang: "en",
    region: "us",
  )
  set quote(block: true)
  set par(leading: 1em)
  align(
    center,
    text(1.4em)[
      *#title*
    ],
  )
  if author != none {
    align(
      center,
      text(1.2em)[
        #author
      ],
    )
  }
  show: thmrules
  show figure.where(kind: table): set block(breakable: true)
  set enum(numbering: n => text(fill: red, numbering("1.", n)))
  set list(marker: n => text(fill: red, "•"))
  show raw.where(block: false): it => (
    h(0.5em) + box(fill: red.lighten(80%), outset: 0.25em, text(fill: red, it)) + h(0.5em)
  )
  show: rest => columns(2, rest)
  set align(left)
  if numbered-equation {
    set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [Eq.])
    doc
  } else {
    doc
  }

}
