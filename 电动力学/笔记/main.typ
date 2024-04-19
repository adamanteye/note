#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "en",
  region: "us",
)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#let title = [Note on Electrodynamics]
#set document(title: [#title])
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))

#set math.equation(numbering: "(1)", supplement: [Eq.], number-align: bottom + right)

#import "@preview/physica:0.9.2": *
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
#let proof = thmproof("proof", "proof", inset: (x: 0.5em, top: 0em), base: "thm")

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)

This note is based on the textbook _Classical Electrodynamics 3rd edition_ (John
David Jackson) as well as _电动力学简明教程_ (俞允强).

#set heading(numbering: none)
= Vector Calculus
== Scalar Triple Product
$va(A) dprod (va(B) cprod va(C))=va(B) dprod (va(C) cprod va(A))=va(C) dprod (va(A) cprod va(B))$
== Vector Triple Product
BAC-CAB rule: $va(A) cprod (va(B) cprod va(C))=va(B) cprod (va(A) dprod va(C))-va(C) cprod (va(A) dprod va(B))$
== Product Rules
$grad (f g)=f grad g+g grad f$

$grad (va(A) dprod va(B))=va(A) cprod (curl va(B))+va(B) cprod (curl va(A))+(va(A) dprod grad)va(B)+(va(B) dprod grad)va(A)$

$div (va(A) cprod va(B))=va(B) dprod (curl va(A))-va(A) dprod (curl va(B))$

$curl (va(A) cprod va(B))=(va(B)dprod grad)va(A)-(va(A) dprod grad)va(B)+va(A)(div va(B))-va(B)(grad dprod va(A))$

$div (f va(A))=f(div va(A))+va(A) dprod (grad f)$

$curl (f va(A))=f(curl va(A))-va(A) cprod (grad f)$
== Second Derivatives
$div (grad T)=(div grad)T=laplacian T$

$curl (grad T)=0$

$grad (div va(v))$

$div (curl va(v))=0$

$curl (curl va(v))=grad (div va(v))-laplacian va(v)$

== Coordinates
=== Cylindrical Coordinates
#thm("Gradient in Cylindrical Coordinates")[$ grad=vu(e_rho)pdv(,rho)+vu(e_phi.alt) 1/rho pdv(,phi.alt)+vu(e_z)pdv(,z) $]
#thm("Laplacian in Cylindrical Coordinates")[$ laplacian=pdv(,rho,2)+1/rho pdv(,rho)+1/rho^2 pdv(,phi.alt,2)+pdv(,z,2) $]

== Special Functions
#def("Complete elliptic integral of the first kind")[$ K(k)=integral_0^1 dd(x)/sqrt((1-x^2)(1-k^2 x^2)) $]

#def("Complete elliptic integral of the second kind")[$ E(k)=integral_0^1 sqrt((1-k^2 x^2)/(1-x^2)) dd(x) $]

#set heading(numbering: "1.")

= Introduction to Electrostatics
#thm(
  "Green's first identity",
)[$ integral_V (phi laplacian psi+grad phi dprod grad psi) dd(x, 3)=integral.cont_S phi pdv(psi, n) dd(a) $] <green1stid>
#proof[Substitute $va(A)$ in divergence theorem with $phi grad psi$.]
#thm(
  "Green's second identity",
)[$ integral_V (phi laplacian psi-psi laplacian phi) dd(x, 3)\
  =integral.cont_S (phi pdv(psi, n)-psi pdv(phi, n))dd(a) $ <gsi>]
#proof[interchange $phi$ and $psi$ in Green's first identity and then substract.]
== Poisson and Laplace Equations
The behavior of an electrostatics field is described by
$ div va(E)=rho/epsilon.alt_0 $
$ curl va(E)=0 $
#def(
  "Poisson equation",
)[The electric potential $Phi$ satisfies the equation $ laplacian Phi=-rho/epsilon.alt_0 $]
#def(
  "Laplacian equation",
)[
  In regions of space lacking charge, the Poisson equation becomes $ laplacian Phi=0 $
]
== Solution of Boundary-Value Problem with Green Function
#thm("Gauss's theorem")[$ integral.cont va(E) dprod dd(va(a))=q/(4pi epsilon_0)integral dd(Omega) $]
#def(
  "Green function",
)[A function $ G(va(x),va(x)')=1/abs(va(x)-va(x)')+F(va(x),va(x)') $
  must satisfy the condition that:
  $ laplacian'G(va(x),va(x)')=-4pi delta(va(x)-va(x)') $And with $F$ satisfying the Laplace equation inside the volume $V$]
#thm("general solution for Poisson function")[$ Phi(va(x))=1/(4pi epsilon.alt_0) integral_V rho(va(x)')G(va(x),va(x)')dd(x', 3)+\
1/(4pi) integral.cont_S (G(va(x),va(x)')pdv(Phi, n')-Phi(va(x)')pdv(G(va(x),va(x)'), n')) dd(a') $]
#proof[Plug $G(va(x),va(x)')$ and $Phi$ into @gsi]
#thm[solution of Poisson equation with Dirichlet or Neumann boundary conditions is unique]
#proof[Let $U=Phi_1-Phi_2$ and use @green1stid.]
#def("Dirichlet boundary conditions")[$ G_D (va(x),va(x'))=0 "for" va(x) "on S" $]
#thm("Solution to Dirichlet boundary conditions")[$ Phi(va(x))=1/(4pi epsilon_0) integral_V rho(va(x')) G_D (va(x),va(x')) dd(x,3)\  -1/(4pi) integral.cont Phi(va(x')) pdv(G_D,n') dd(a') $]
#def("Neumann boundary conditions")[This is consistent with Gauss's theorem that $ pdv(,n') G_N (va(x),va(x'))=-(4pi)/S "for" va(x) "on S" $]
#thm("Solution to Neumann boundary conditions")[$ Phi(va(x))=expval(Phi)_S+1/(4pi epsilon_0) integral_V rho(va(x')) G_N (va(x),va(x')) dd(x,3)\  +1/(4pi) integral.cont G_N pdv(Phi,n') dd(a') $]
== Energy and Capacitance
#thm("Discrete total potential")[$ W=1/(8pi epsilon_0) sum_i sum_j (q_i q_j)/(|va(x_i)-va(x_j)|) $]
#thm("Continuous total potential")[$ W&=1/(8pi epsilon_0) integral integral (rho(va(x))rho(va(x')))/(|va(x_i)-va(x_j)|) dd(x,3) dd(x',3) \ &=1/(2) integral_V rho(va(x)) Phi(va(x)) dd(x,3)\ &=-epsilon_0/2 integral Phi laplacian Phi dd(x,3) $With self-energy contributions$ W&=epsilon_0/2 integral |grad Phi|^2 dd(x,3)\ &=epsilon_0/2 integral |va(E)|^2 dd(x,3) $]
#def("Energy density")[With self-energy contributions$ w=epsilon_0/2|va(E)|^2 $]
= Boundary-Value Problems in Electrostatics
== Method of Images
/ What are image charges: A small number of charges
  - suitably placed
  - appropriately charged
  - external to the region of interest
  - simulating the required boundary conditions
/ Zero potential plane conductor condition: $q'=-q$ and $x'=-x$
#figure(
  image("image-1.png", width: 60%),
  caption: [Electric filed of $q$ away from an infinite plane conductor],
) <glacier>
/ hollow grounded sphere conductor:
== Laplace Equation in Rectangular Coordinates
== Fields in Two-Dimensional Corners


== Expansion in Spherical Coordinates
$ 1/(|va(x)-va(x')|)=&4pi sum_(l=0)^infinity sum_(m=-l)^l 1/(2l+1) r_<^l/r_>^(l+1) \ &Y_(l m) (theta, phi.alt)Y_(l m)^* (theta', phi.alt') Y_(l m) (theta, phi.alt) $
= Multipoles and Dielectrics
== Multipole Expansion
$ Phi(va(x))=1/(4pi epsilon_0)sum_(l=0)^infinity sum_(m=-l)^l (4pi)/(2l+1)q_(l m) (Y_(l m) (theta, phi.alt))/r^(l+1) $
#def(
  "traceless quadrupole moment",
)[$ Q_(i j)=integral (3 x'_i x'_j-r^(prime 2)delta_(i j))rho(va(x'))dd(x', 3) $]

$ va(p)=integral va(x')rho(va(x'))dd(x', 3) $
$ Phi(va(x))=1/(4pi epsilon_0)&(q/r+(va(p)dprod va(x))/r^3\ +&1/2sum_(i,j)Q_(i j)(x_i x_j)/r^5+dots) $
