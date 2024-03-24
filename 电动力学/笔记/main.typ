#set text(font: ("Linux Libertine", "Source Han Serif"), lang: "en", region: "us")
#set heading(numbering: "1.")
#let title = [Note on Electrodynamics]
#set document(title: [#title])
#set page("a4",numbering: "1",margin: (x: 1.2cm, y: 1.2cm))

#set math.equation(numbering: "(1)",supplement: [Eq.],number-align:bottom+right)

#import "@preview/physica:0.9.2": *

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)

= Vector Calculus
== Scalar Triple Product
$vb(A) dprod (vb(B) cprod vb(C))=vb(B) dprod (vb(C) cprod vb(A))=vb(C) dprod (vb(A) cprod vb(B))$
== Vector Triple Product
BAC-CAB rule: $vb(A) cprod (vb(B) cprod vb(C))=vb(B) cprod (vb(A) dprod vb(C))-vb(C) cprod (vb(A) dprod vb(B))$
== Product Rules
$grad (f g)=f grad g+g grad f$

$grad (vb(A) dprod vb(B))=vb(A) cprod (curl vb(B))+vb(B) cprod (curl vb(A))+(vb(A) dprod grad)vb(B)+(vb(B) dprod grad)vb(A)$

$div (vb(A) cprod vb(B))=vb(B) dprod (curl vb(A))-vb(A) dprod (curl vb(B))$

$curl (vb(A) cprod vb(B))=(vb(B)dprod grad)vb(A)-(vb(A) dprod grad)vb(B)+vb(A)(div vb(B))-vb(B)(grad dprod vb(A))$

$div (f vb(A))=f(div vb(A))+vb(A) dprod (grad f)$

$curl (f vb(A))=f(curl vb(A))-vb(A) cprod (grad f)$
== Second Derivatives
$div (grad T)=(div grad)T=laplacian T$

$curl (grad T)=0$

$grad (div vb(v))$

$div (curl vb(v))=0$

$curl (curl vb(v))=grad (div vb(v))-laplacian vb(v)$
= Introduction to Electrostatics
Substitute $vb(A)$ in divergence theorem with $phi grad psi$ leads to *Green's firt identity*: $ integral_V (phi laplacian psi+grad phi dprod grad psi) dd(x,3)=integral.cont_S phi pdv(psi,n) dd(a) $
With $phi$ and $psi$ interchanged we have *Green's second identity*:
$ integral_V (phi laplacian psi-psi laplacian phi) dd(x,3)\
=integral.cont_S (phi pdv(psi,n)-psi pdv(phi, n))dd(a) $ <gsi>
== Poisson and Laplace Equations
The behavior of an electrostatics field is described by
$ div vb(E)=rho/epsilon.alt_0 $
$ curl vb(E)=0 $
Equivalent to *Posisson Equation* $ laplacian Phi=-rho/epsilon.alt_0 $
In regions of space lacking charge, the equation becomes *Laplace Equation* $ laplacian Phi=0 $
== Solution of Boundary-Value Problem with Green Function
A *green function* $ G(vb(x),vb(x)')=1/abs(vb(x)-vb(x)')+F(vb(x),vb(x)') $
must satisfy the condition that:
$ laplacian'G(vb(x),vb(x)')=-4pi delta(vb(x)-vb(x)') $
Plug $G(vb(x),vb(x)')$ and $Phi$ into @gsi, we obtain the solution:
$ Phi(vb(x))=1/(4pi epsilon.alt_0) integral_V rho(vb(x)')G(vb(x),vb(x)')dd(x',3)+\
1/(4pi) integral.cont_S (G(vb(x),vb(x)')pdv(Phi,n')-Phi(vb(x)')pdv(G(vb(x),vb(x)'),n')) dd(a') $
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