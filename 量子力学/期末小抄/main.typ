#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = [量子力期末小抄]
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1cm, y: 1cm), flipped: true)
#import "@preview/physica:0.9.3": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

#let pst = thmbox(
  "thm",
  "公设",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  inset: (x: 0em, top: 0em),
)
#let def = thmbox(
  "thm",
  "定义",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  inset: (x: 0em, top: 0em),
  padding: (top: 0.1em, bottom: 0.1em),
)
#let thm = thmbox(
  "thm",
  "定理",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  inset: (x: 0em, top: 0em),
)
#let coll = thmbox(
  "coll",
  "推论",
  namefmt: x => [(#(strong(x)))],
  titlefmt: emph,
  inset: (x: 0em, top: 0em),
  base: "thm",
)
#let exmp = thmbox("exmp", "例", titlefmt: emph, inset: (x: 0em, top: 0em))
#let sol = thmplain("sol", "解答", titlefmt: emph, inset: (x: 0em, top: 0em), base: "thm").with(numbering: none)
#let proof = thmproof("proof", "证明", inset: (x: 0em, top: 0em), titlefmt: emph, base: "thm")

#set par(leading: 0.3em)
#set block(spacing: 0.4em)
#show: rest => columns(6, rest, gutter: 1%)

#set text(8pt) // 经过测试,这是最小的字号

= 数学速查
$ epsilon_(i j k)epsilon_(l m n)=mdet(
  delta_(i l), delta_(i m), delta_(i n);delta_(j l), delta_(j m), delta_(j n);delta_(k l), delta_(k m), delta_(k n)
) $
$ sum_(i=1)^3 epsilon_(i j k) epsilon_(i m n)=delta_(j m) delta_(k n)-delta_(j n)delta_(k m) $
$ (va(A)cprod va(B))_k=sum_(i j) epsilon_(k i j) A_i B_j $
$ grad=vu(r)pdv(, r)+1/r vu(theta)pdv(, theta)+1/(r sin theta)vu(phi.alt)pdv(, phi.alt) $
$ div va(u)=1/r^2 pdv(, r)(r^2 u_r)+1/(r sin theta)pdv(, theta)(sin theta u_theta)\ +1/(r sin theta)pdv(, phi.alt)u_phi.alt $
$ [A,B C]=B[A,C]+[A,B]C $
$ [A B,C]=A[B,C]+[A,C]B $
#def(
  "连带Legendre多项式",
)[$ (1-xi^2)dv(P, xi, 2)-2xi &dv(P, xi) \ +(l(l+1)&-m^2/(1-xi^2))P=0 $$ P_l^m (x)=1/(2^l l!) (1-x^2)^(m^2/2) dv(, x, l+m) (x^2-1)^l $]
#thm(
  "连带Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k^m (xi)P_l^m (xi)dd(xi)=2/(2l+1) ((l+m)!)/((l-m)!)delta_(k l) $] <a-legendre-orthog>
#def("Legendre多项式")[$ P_l (x)=1/(2^l l!) dv(, x, l) (x^2-1)^2 $]
#thm(
  "Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k (x) P_l (x)dd(x)=2/(2l+1) delta_(k l) $]
#thm(
  "厄米多项式的正交性",
)[$ integral_(-infinity)^(+infinity) H_m (xi) H_n (xi) e^(-xi^2) dd(xi)=sqrt(pi) 2^n n! delta_(m n) $]
#thm(
  [$delta$函数的性质],
)[$ delta(a x)&=1/(|a|)delta(x) \ delta(x)&=1/(2pi)integral_(-infinity)^infinity e^(i k x)dd(k)\ x delta(x)&=0\ delta(f(x))&=sum_i delta(x-x_i)/abs(f'(x_i)) $]
#def(
  [三维$delta$函数],
)[假设已定义一维Dirac函数$delta(x)$,那么$ delta(va(r))&=delta(x)delta(y)delta(z)\ &= 1/(r^2sin theta)delta(r)delta(theta)delta(phi.alt)\ &=1/rho delta(rho)delta(phi.alt)delta(z) $]
#def(
  "球谐函数",
)[$ Y_(l m) (theta,phi.alt)\ =(-1)^m &sqrt((2l+1)/(4pi) ((l-m)!)/((l+m)!)) P_l^m (cos theta) e^(i m phi.alt) $$ Y_(00)&=1/sqrt(4pi),Y_(10)=sqrt(3/(4pi))cos theta\ Y_(1plus.minus 1)&=minus.plus sqrt(3/(8pi))sin theta e^(plus.minus i phi.alt)\ Y_(20)&=sqrt(5/(16pi))(3cos^2theta-1)\ Y_(2plus.minus 1)&=minus.plus sqrt(15/(8pi))cos theta sin theta e^(plus.minus i phi.alt)\ Y_(2plus.minus 2)&=1/2 sqrt(15/(8pi))sin^2theta e^(plus.minus 2i phi.alt) $]
#thm(
  "球谐函数的完备性",
)[平方可积的球谐函数形成了一个希尔伯特空间$ integral.double Y_(l' m') Y_(l m) sin theta dd(theta) dd(phi.alt)=delta_(l l') delta_(m m') $$ sum_(l=0)^(+infinity)sum_(m=-l)^(+l) Y_(l m) (theta,phi.alt) Y_(l' m')^* (theta',phi.alt')\ =1/(sin theta) delta(theta-theta') delta(phi.alt-phi.alt') $]
#thm(
  "球谐函数的递推性质",
)[$ z/r Y_(l m)=&cos theta Y_(l m)\ =&a_(l m)Y_(l+1,m)+a_(l-1,m)Y_(l-1,m)\ (x+i y)/r Y_(l m)=& e^(+i phi.alt)sin theta Y_(l m)\ =& b_(l-1,-(m+1))Y_(l-1,m+1)-b_(l m)Y_(l+1,m+1)\ (x-i y)/r Y_(l m)=&e^(- i phi.alt)sin theta Y_(l m)\ =& -b_(l-1,m-1)Y_(l-1,m-1)+b_(l,-m)Y_(l+1,m-1) \ a_(l m)=& sqrt(((l+1)^2-m^2)/((2l+1)(2l+3)))\ b_(l m)=&sqrt((l+m+1)(l+m+2))/((2l+1)(2l+3)) $]
#thm(
  "傅里叶变换",
)[$ f(x)&=1/sqrt(2pi) integral e^(i k x) g(k)dd(k)\ g(k)&=1/sqrt(2pi) integral e^(-i k x) f(x)dd(x) $]
#thm(
  "正交对角化",
)[$ A&=P D P^(-1) \ D&=dmat(lambda_1, dots, lambda_n)"," P=mat(v_1, dots, v_n) $]
$ integral_(-infinity)^(+infinity) e^(-a^2x^2) dd(x)=sqrt(pi)/abs(a) $
$ integral_0^(+infinity)r^n e^(-r\/a)dd(r)=n! a^(n+1) $

= 波函数
#def("概率密度")[$rho=psi^* psi$]
#def(
  "概率流密度",
)[$ va(j)&=-(i hbar)/(2m)(psi^* grad psi-psi grad psi^*)\ &=1/(2m) (psi^* p psi-psi p psi^*) $]
#thm("概率守恒")[概率(粒子数)守恒的微分式$pdv(rho, t)+div va(j)=0$]
#def(
  [$delta$函数规格化],
)[对于全空间积分发散的波函数,可以要求$ integral psi^*_p' (x) psi_p (x)=delta(p'-p) $]
#thm(
  "不确定关系",
)[对任意$psi$有$ expval((Delta A)^2) expval((Delta B)^2)>=1/4 |expval([A,B])|^2 $]
= 算符
$ va(p)=-i hbar grad $
$ va(p)^2=- hbar^2 div grad $
$ va(p_r)=1/2(vu(r)dprod va(p)+va(p)dprod vu(r))\ =-i hbar(pdv(, r)+1/r) \ =- hbar^2 1/r^2 pdv(, r, 2) r^2 pdv(, r) $
$ va(p)^2=1/r^2va(l)^2+va(p_r)^2 $
$ [x_alpha,p_beta]=i hbar delta_(alpha beta) $
$ [l_alpha,x_beta]=epsilon_(alpha beta gamma)i hbar x_gamma $
$ [l_alpha,p_beta]=epsilon_(alpha beta gamma)i hbar p_gamma $
$ [l_alpha,l_beta]=epsilon_(alpha beta gamma)i hbar l_gamma $
$ [va(r),H]=(i hbar)/m va(p) $
#pst("Schödinger Equation")[$ i hbar pdv(, t)ket(psi)=H ket(psi) $]
#def("定态")[若$ket(psi(t))$是哈密顿量的本征态,则称其为定态.定态是体系的能量有确定值的状态.]
#thm[定态下,一切不显含时间的力学量的平均值和概率分布都不随时间变化]
#thm(
  "Backer-Hausdorff",
)[对算符$A$,$B$,若$C:=[A,B]$满足$[C,A]=[C,B]=0$,则有$ e^(A+B)=e^A e^B e^(-1/2 C)=e^B e^A e^(1/2 C) $]
= 氢原子
化为单体问题后有$ V(r)=-e^2/r $
#def("Bohr半径")[$a=hbar^2/(mu e^2)$]
能量本征值为$ E_n&=-(mu e^4)/(2 hbar^2) 1/n^2=-e^2/(2a)1/n^2\ n&=n_r+l+1\ n_r&=0,1,2,dots $
径向本征函数为$ R_(n l) (r)=2/(a^(3\/2)n^2(2l+1)!)sqrt(((n+1)!)/(n-l-1)!)\ e^(-xi\/2)xi^l F(-n_r,2l+2,xi)\  "where" xi=(2r)/(n a) $
$ R_(10)&=2/a^(3\/2)e^(-r\/a) \ R_(20)&=1/(sqrt(2)a^(3\/2))(1-r/(2a))e^(-r\/2a)\ R_(21)&=1/(2sqrt(6)a^(3\/2))r/a e^(-r\/2a)\ R_(30)&=2/(3sqrt(3)a^(3\/2))(1-(2r)/(3a)+2/27 r^2/a^2)e^(-r\/3a) $
本征函数为$ psi_(n l m)=R_(n l) (r)Y_(l m)(theta, phi.alt) $
简并度为$ f_n=sum_(l=0)^(n-1) (2l+1)=n^2 $
统计意义上,电子的电流密度(绕z轴的环电流密度)为$ va(j)&=(i e hbar)/(2mu) (psi^* grad psi-psi grad psi^*)\ &=-(e hbar m)/mu 1/(r sin theta) abs(psi_(n l m))^2 vu(e_phi.alt) $
总的磁矩为$ va(M)=&-(e hbar m)/(2mu c) vu(z) integral abs(psi_(n l m))^2 dd(tau)\ =&-(e hbar m)/(2mu c)vu(z) $
#def("Bohr磁子")[$ mu_B=(e hbar)/(2mu c) $]
类氢离子($isotope("He")^+,isotope("Li")^(++),dots$)需将核电荷数$+e$换成$+Z e$,约化质量换成相应的$mu$
$ E_n=-(mu e^4)/(2 hbar^2) Z^2/n^2=-e^2/(2 a)Z^2/n^2 $
= 自旋和角动量
#def(
  "角动量",
)[
  $ l_x&=i hbar(sin phi.alt pdv(, theta)+cot theta cos phi.alt pdv(, phi.alt))\
  l_y&=i hbar(-cos phi.alt pdv(, theta)+cot theta sin phi.alt pdv(, phi.alt))\
  l_z&=- i hbar pdv(, phi.alt) $
  $ va(l)=va(r)cprod va(p) $
  $ va(l)cprod va(l)=i hbar va(l) $
  $ va(l)^2&=l_z^2+l_y^2+l_z^2 \ &=-hbar^2/(sin theta)pdv(, theta)sin theta pdv(, theta)+1/(sin^2 theta) l_z^2 $
]
#let Jpm = $J_(plus.minus)$
#let Jmp = $J_(minus.plus)$
#let Jp = $J_+$
#let Jm = $J_-$
#def(
  "角动量升降算符",
)[$ Jpm&=J_x plus.minus i J_y\ Jpm Jmp&=va(J)^2-J_z^2 plus.minus hbar J_z \ va(J)^2&=1/2 (Jp Jm+Jm Jp)+J_z^2 $]
$   &[Jp,Jm]=2hbar J_z, [J_z,Jpm]=plus.minus hbar Jpm\ &[J_x,Jpm]=minus.plus hbar J_z,[J_y,Jpm]=-hbar J_z\ &[va(J)^2,Jpm]=0 $$ Jpm ket(j m)=hbar sqrt(j(j+1)-m(m plus.minus 1)) ket(j m plus.minus 1) $
#def(
  "Pauli矩阵",
)[$ sigma_x=mat(0, 1;1, 0),sigma_y=mat(0, -i;i, 0),sigma_z=mat(1, 0;0, 1) $$ sigma_alpha sigma_beta=delta_(alpha beta)+i sum_gamma epsilon_(alpha beta gamma) sigma_gamma\ sigma_alpha=sigma_alpha^dagger $]
#def("磁矩算符")[$ va(mu)=g mu_B/hbar va(j)\ va(j)=va(s),va(l), g_l=-1,g_s=-2 $]
#def("磁矩磁场相互作用能")[$ W=-(va(mu_l)+va(mu_s))dprod va(B) $]
#def(
  "旋量波函数",
)[$ psi(va(r), s_z)=mat(psi_1(va(r),+hbar/2);psi_2(va(r),-hbar/2)) $在哈密顿量不含自旋或可以表示成与自旋部分之和的时候$ psi(va(r), s_z)=psi(va(r))chi(s_z)\ alpha=chi_(+1\/2)(s_z)=mat(1;0)\ beta=chi_(-1\/2)(s_z)=mat(0;1) $]
#thm(
  "耦合与非耦合表象的基底变换",
)[$ ket(j_1 j_2 j m)=sum_(m_1=-j_1)^(j_1)sum_(m_2=-j_2)^(j_2) C_(j_1 m_1 j_2 m_2)^(j_1 j_2 j m) ket(j_1 m_1 j_2 m_2) $$ C_(j_1 m_1 j_2 m_2)^(j m)=braket(j_1 m_1 j_2 m_2, j_1 j_2 j m) $]
#thm(
  "电子耦合与非耦合表象变换",
)[$ Psi_(l,j=l+1/2,m_j)&=1/sqrt(2j) mat(sqrt(j+m_j)Y_(l,m_j-1/2);sqrt(j-m_j)Y_(l,m_j+1/2))\ Psi_(l,j=l-1/2,m_j)&=1/sqrt(2j+2) mat(-sqrt(j-m_j+1)Y_(l,m_j-1/2);sqrt(j-m_j+1)Y_(l,m_j+1/2)) $$ Y_(l m_l chi_(1/2))=sqrt((l+m_l+1)/(2l+1))Psi_(l,j=l+1/2,m_l+1/2)\ -sqrt((l-m_l)/(2l+1))Psi_(l,j=l-1/2,m_l+1/2)\ Y_(l m_l chi_(-1/2))=sqrt((l-m_l+1)/(2l+1))Psi_(l,j=l+1/2,m_l-1/2)\ +sqrt((l+m_l)/(2l+1))Psi_(l,j=l-1/2,m_l-1/2) $]
#def(
  "自旋三重态与单态",
)[选择${va(S)^2,S_z}$作为对易自旋力学量完全集$ va(S)^2 chi_(S M_S)=&S(S+1)hbar^2chi_(S M_S)\ S_z chi_(S M_S)=&M_S hbar chi_(S M_S) $
  #figure(table(
    stroke: none,
    columns: 3,
    table.hline(),
    table.header([$chi_(S M_S)$], [$S$], [$M_S$]),
    [$alpha_1alpha_2$],
    [$1$],
    [$1$],
    [$1/sqrt(2)(alpha_1beta_2+beta_1alpha_2)$],
    [$1$],
    [$0$],
    [$beta_1beta_2$],
    [$1$],
    [$-1$],
    [$1/sqrt(2)(alpha_1beta_2-beta_1alpha_2)$],
    [$0$],
    [$0$],
    table.hline(),
  ))]
$ (va(sigma_1) dprod va(sigma_2))^2=3-2va(sigma_1) dprod va(sigma_2) $
= 矩阵形式
#thm(
  "幺正变换",
)[对2套各自正交归一的基矢,存在幺正算符$ U=sum_n ket(b_n)bra(a_n) $使得$ ket(b_1)=U ket(a_1),dots,ket(b_n)=U ket(a_n) $]
$ braket(p, x)&=1/sqrt(2pi hbar)e^(-(i p x)/hbar)\ braket(x, p)&=1/sqrt(2pi hbar)e^((i p x)/hbar) $
$ braket(p, H, psi)&=p^2/(2m)braket(p, psi)+V(i hbar pdv(, p))braket(p, psi) $
= 一维谐振子
$ V(x)=1/2 k x^2 $
$ dv(psi, xi, 2)+(lambda-xi^2) psi=0 \ "where" omega=sqrt(k/m), lambda=(2E)/(hbar omega), xi=x
sqrt((m omega)/hbar) $
$ E_n&=(n+1/2)hbar omega \ psi_n (x)&=((m omega)/(pi hbar))^(1/4) 1/sqrt(2^n
n!)H_n (xi) e^(-xi^2/2) \ "where"& H_n (x)=(-1)^n e^(x^2) dv(, x, n) e^(-x^2) $

$ a       &=sqrt((m omega)/(2 hbar))(x+ (i p)/(m omega))\
a^dagger&=sqrt((m omega)/(2 hbar))(x- (i p)/(m omega))\
N       &=a^dagger a $

$ [a,a^dagger]=1 $
$ H ket(n)&=(n+1/2)hbar omega ket(n)\ E_n&=(n+1/2)hbar omega $
$   &[N,a]=-a \ &[N,a^dagger]=a^dagger $
$ a ket(n)&=sqrt(n)ket(n-1)\ a^dagger
ket(n)  &=sqrt(n+1)ket(n+1) $
$ ket(n)=1/sqrt(n!)(a^dagger)^n ket(0) $
$ a ket(0)=0 $
$ psi_0 (x)=((m omega)/(pi hbar))^(1/4) e^(-(m omega)/(2hbar)x^2) $

$ braket(x, n)=&1/sqrt(n!)braket(x, (a^dagger)^n, 0)\ =&1/sqrt(2^n n!) ((m
omega)/(pi hbar))^(1/4) \ &(sqrt((m omega)/hbar)x+sqrt(hbar/(m omega))dv(, x))^n
e^(-(m omega)/(2hbar)x^2) $
= 守恒量
#thm(
  "Ehrenfest",
)[若力学量$A$不显含时间,有$ dv(, t)expval(A)=frac(1, i hbar)expval([A,H]) $] <ehrenfest>
#proof[考虑力学量$A(t)$在任意$ket(psi(t))$上的演化,可得$ dv(, t) expval(A)=expval(pdv(A, t))+1/(i hbar)expval([A,H]) $此外$A$不显含时间,有$pdv(A, t)=0$.]
#thm[若力学量$A$不显含时间,且$[A,H]=0$,则$A$在任何$ket(psi(t))$下的平均值与概率分布均不变.]
#exmp[中心力场中的守恒量为${H,va(l)^2,l_z}$.]
#exmp[自由粒子的态可以用${p_x,p_y,p_z}$标记,对应能量的简并度一般是无穷大.]
#thm(
  "Feynman-Hellmann",
)[若系统哈密顿量含有某参数$lambda$,$E_n$为哈密顿量的本征值,相应归一化本征态(束缚态)为$ket(psi_n)$,有$ pdv(E_n, lambda)=expval(pdv(H, lambda), psi_n) $]
#thm(
  "位力(virial)",
)[处于势场$V(va(r))$中的粒子,动能算符在定态上的平均值为$ expval(T)=1/2 expval(va(r) dprod grad V) $]
#coll[当势能为坐标的$n$次齐次函数时,有$ expval(T)=n/2 expval(V) $]
