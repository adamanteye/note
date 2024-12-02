#import "common.typ": *
#let def = thmbox(
  "thm",
  "定义",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let pst = thmbox(
  "thm",
  "公设",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
)
#let thm = thmbox(
  "thm",
  "定理",
  inset: (x: 0em, top: 0em),
  namefmt: x => strong(text(fill: red, x)),
  titlefmt: emph,
  base: none,
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
  base: none,
)
#let sol = thmproof(
  "sol",
  "解答",
  inset: (x: 0em, top: 0em),
  titlefmt: x => strong(text(fill: red, x)),
  base: "exmp",
)
#let proof = thmproof(
  "proof",
  "证明",
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
    font: ("Libertinus Serif", "霞鶩文楷 TC"),
    lang: "zh",
    region: "cn",
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
    set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])
    doc
  } else {
    doc
  }

}
