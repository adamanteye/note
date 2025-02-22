#import "common.typ": *
#import "theorem_en.typ": *
#let conf(
  title: none,
  author: none,
  numbered-equation: false,
  mono-font: "LXGW Bright Code TC",
  doc,
) = {
  if author != none {
    set document(title: title, author: author)
  } else {
    set document(title: title)
  }
  set heading(numbering: "1.")
  show link: it => underline(text(fill: orange, it), offset: 0.2em)
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
  show strong: set text(fill: red)
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
  show raw.where(block: false): it => text(fill: maroon, it)
  show raw: set text(font: mono-font)
  set align(left)
  set table(stroke: none, align: left)
  if numbered-equation {
    set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [Eq.])
    doc
  } else {
    doc
  }
}
