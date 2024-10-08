#set text(
  font: "Linux Libertine",
  lang: "en",
  region: "us",
)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#let title = [Special Relativity]
#set document(title: title)
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))

#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

#let def = thmbox(
  "def",
  "Definition",
  inset: (x: 0.5em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none,
)
#let thm = thmbox(
  "thm",
  "Theorem",
  inset: (x: 0.5em, top: 0em),
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  base: none,
)

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)

= The Special Theory of Relativty
#def("Minowski Metric")[$ tensor(g, -mu, -nu)=dmat(-1, 1, 1, 1) $]
#def[For the scalar product of a 4-vector with itself $tensor(a,+mu)tensor(a,-mu)$
/ spacelike: $tensor(a,+mu)tensor(a,-mu)>0$
/ timelike: $tensor(a,+mu)tensor(a,-mu)<0$
/ lightlike: $tensor(a,+mu)tensor(a,-mu)=0$
]
#def(
  "Lorentz Transform Matrix",
)[$ tensor(Lambda, +mu, -nu)=mat(gamma, -gamma beta, , ;-gamma beta, gamma, , ;, , 1, ;, , , 1) $]
$ x_mu=tensor(g, -mu, -nu)x^nu $
$ overline(x^mu)=tensor(Lambda, +mu, -nu)x^nu $
#def("Proper Time")[$ dd(tau)=sqrt(1-u^2/c^2)dd(t) $]
#def("Proper Velocity")[$ tensor(eta,+mu)=dv(tensor(x,+mu),tau) $$ tensor(eta,+0)=c dv(t,tau)=c/sqrt(1-u^2\/c^2) $]
= Relativistic Mechanics
#def("Energy")[$ E=p^0c=(m c^2)/sqrt(1-u^2/c^2) $]
#def(
  "Momentum",
)[$ va(p)=m va(eta)=m(eta^1,eta^2,eta^3) $]
#def("Minowski Force")[ $ K^mu=dv(p^mu, tau) $ ]
#thm(
  "Conservation of Energy and Momentum",
)[$ p^mu p_mu=-m^2 c^2 $$ E^2-p^2c^2=m^2c^4 $]
#def(
  "Lorentz Invariant",
)[An Lorentz invariant is the same value in all inertial systems.

  Proper time $tau$ and $gamma L$ are both Lorentz invariants.]