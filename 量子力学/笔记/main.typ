#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = [量子力学笔记]
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.2": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules

#set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])

#let pst = thmbox("thm", "公设", inset: (x: 0em, top: 0em))
#let def = thmbox("thm", "定义", inset: (x: 0em, top: 0em))
#let thm = thmbox("thm", "定理", inset: (x: 0em, top: 0em))
#let exmp = thmbox("exmp", "例", inset: (x: 0em, top: 0em), titlefmt: strong)
#let sol = thmplain("sol", "解答", inset: (x: 0em, top: 0em), base: "thm").with(numbering: none)
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: strong,
  base: "thm",
)

#align(center, text(17pt)[
  *#title*
])

#align(center, text(15pt)[
  #thisauthor
])

#show: rest => columns(2, rest)

= 数学速查
#thm(
  "Schwarz不等式",
)[$ braket(alpha, alpha)braket(beta, beta)>=|braket(alpha, beta)|^2 $] <schwarz-ineq>
#proof[$ (bra(alpha)+lambda^* bra(beta))dprod (ket(alpha)+lambda ket(beta))>=0 $对任意$lambda$成立,将$lambda=-braket(beta, alpha)/braket(beta, beta)$带入得证]
== Levi-Civita symbol
参考#link(
  "https://zh.wikipedia.org/wiki/%E5%88%97%E7%B6%AD-%E5%A5%87%E7%B6%AD%E5%A1%94%E7%AC%A6%E8%99%9F",
)[中文维基页面]
$ epsilon_(i j k)epsilon_(l m n)=mdet(
  delta_(i l), delta_(i m), delta_(i n);delta_(j l), delta_(j m), delta_(j n);delta_(k l), delta_(k m), delta_(k n)
) $ <levi-det>
@levi-det 对于一般的$n$也成立
$ sum_(i=1)^3 epsilon_(i j k) epsilon_(i m n)=delta_(j m) delta_(k n)-delta_(j n)delta_(k m) $
$ (va(A)cprod va(B))_k=sum_(i j) epsilon_(k i j) A_i B_j $
== 球坐标系
$ grad=vu(r)pdv(, r)+1/r vu(theta)pdv(, theta)+1/(r sin theta)vu(phi.alt)pdv(, phi.alt) $
$ div va(u)=1/r^2 pdv(, r)(r^2 u_r)+1/(r sin theta)pdv(, theta)(sin theta u_theta)\ +1/(r sin theta)pdv(, phi.alt)u_phi.alt $
== 爱因斯坦求和约定
采用爱因斯坦求和约定,可以让式子更加简洁
$ (vb(A)cprod vb(B))^k=epsilon^(k i j)A_i B_j $
== 泊松括号
$ [A,B C]=B[A,C]+[A,B]C $
$ [A B,C]=A[B,C]+[A,C]B $
== 特殊函数
=== Legendre多项式
#def(
  "连带Legendre多项式",
)[$ (1-xi^2)dv(P, xi, 2)-2xi &dv(P, xi) \ +(l(l+1)&-m^2/(1-xi^2))P=0 $ <a-legendre-eq>]
#thm(
  "连带Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k^m (xi)P_l^m (xi)dd(xi)=2/(2l+1) ((l+m)!)/((l-m)!)delta_(k l) $ <a-legendre-orthog>]
#def(
  "Legendre多项式",
)[连带Legendre多项式中$m=0$的情况$ P_l (x)=1/(2^l l!) dv(, x, l) (x^2-1)^2 $]
#thm(
  "Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k (x) P_l (x)dd(x)=2/(2l+1) delta_(k l) $]
=== delta函数
#thm(
  "delta函数的性质",
)[$ delta(a x)=1/(|a|)delta(x) $$ delta(x)=1/(2pi)integral_(-infinity)^infinity e^(i k x)dd(k) $]
=== 傅里叶变换
$ f(x)&=1/sqrt(2pi) integral e^(i k x) g(k)dd(k)\ g(k)&=1/sqrt(2pi) integral e^(-i k x) f(x)dd(x) $
= 算符
== 基本假设
#def(
  "伴随算符",
)[$A$的伴随算符#footnote[这里为了书写简便,算符均省略hat,注意区分算符,可观测量以及算符的矩阵表示]定义为$A^dagger$,有 $ A ket(psi)=bra(psi) A^dagger $]
#def(
  "厄米算符",
)[称$A$为厄米算符当且仅当 $ A=A^dagger <==> braket(psi, A, phi)=(braket(phi, A, psi))^* \ "for arbitray" psi,phi $]
#thm()[厄米算符的本征值总是实的]
#thm()[厄米算符对应不同本征值的本征态正交]
#def("平均值")[算符$A$的平均值定义为$ expval(A)_ket(psi)=expval(A, psi) $]
#thm()[厄米算符的平均值总是实的] <hermite-re>
#thm()[平均值总是实的的算符是厄米的]
#def("对易子")[算符$A$,$B$的对易子为$ [A,B]=A B-B A $]
#def("反对易子")[算符$A$,$B$的反对易子定义为 $ {A,B}=A B+B A $]
#def("反厄米算符")[称$A$为反厄米算符当且仅当 $ A=-A^dagger $]
#thm()[反厄米算符的平均值总是虚的] <anti-hermite-im>
#def("偏差算符")[$ Delta A=A-expval(A) $]
#thm(
  "不确定关系",
)[对任意$psi$有$ expval((Delta A)^2) expval((Delta B)^2)>=1/4 |expval([A,B])|^2 $]
#proof[将$ket(alpha)=Delta A ket(psi)$与$ket(beta)=Delta B ket(psi)$带入@schwarz-ineq 可得$ expval((Delta A)^2) expval((Delta B)^2)>=|expval(Delta A Delta B)|^2 $由于$ Delta A Delta B=1/2 [Delta A,Delta B]+1/2 {Delta A,Delta B}\ =1/2 [A,B]+1/2 {Delta A,Delta B} $使用@hermite-re
  以及@anti-hermite-im$ expval((Delta A)^2) expval((Delta B)^2)>=&\ 1/4 expval([A,B])^2&+1/4 expval({Delta A,Delta B})^2\ >=&1/4 expval([A,B])^2 $]
== 常见算符表示
$ va(p)=-i hbar grad $
$ va(p)^2=- hbar^2 div grad $
$ va(l)=va(r)cprod va(p) $
$ va(l)cprod va(l)=i hbar va(l) $
$ va(l)^2&=l_z^2+l_y^2+l_z^2 \ &=-hbar^2/(sin theta)pdv(, theta)sin theta pdv(, theta)+1/(sin^2 theta) l_z^2 $
$ va(p_r)=1/2(vu(r)dprod va(p)+va(p)dprod vu(r))=-i hbar(pdv(, r)+1/r) \ =- hbar^2 1/r^2 pdv(, r, 2) r^2 pdv(, r) $
$ va(p)^2=1/r^2va(l)^2+va(p_r)^2 $
== 对易关系
$ [x_alpha,p_beta]=i hbar delta_(alpha beta) $
$ [l_alpha,x_beta]=epsilon_(alpha beta gamma)i hbar x_gamma $
$ [l_alpha,p_beta]=epsilon_(alpha beta gamma)i hbar p_gamma $
$ [l_alpha,l_beta]=epsilon_(alpha beta gamma)i hbar l_gamma $
$ [va(r),H]=(i hbar)/m va(p) $
== 算符的函数
#thm(
  "Backer-Hausdorff",
)[对算符$A$,$B$,若$C:=[A,B]$满足$[C,A]=[C,B]=0$,则有$ e^(A+B)=e^A e^B e^(-1/2 C)=e^B e^A e^(1/2 C) $]
== 矩阵形式
#def("幺正矩阵")[称A为幺正矩阵,当且仅当$ A^dagger=A^(-1) $]
#thm(
  "幺正变换",
)[对2套各自正交归一的基矢,存在幺正算符$U$使得$ ket(b_1)=U ket(a_1),dots,ket(b_n)=U ket(a_n) $]
#proof[构造$ U=sum_n ketbra(b_n, a_n) $注意到$ U^dagger U=sum_n sum_k ket(a_n)braket(b_n, b_k)bra(a_k)=I $从而$U$是幺正算符]
#def(
  "投影算符",
)[对某表象中的基矢$ket(k)$,称$P_k$为投影算符,作用在任意$ket(psi)$上可得到$ket(psi)$在$ket(k)$方向上的分量$ P_k=ket(k)bra(k) $]
#thm("单位算符")[完备的情况下有$ I&=sum_n ketbra(k_n)\ I&=integral ketbra(x)dd(x) $]
#exmp[在$l=1$的表象下, $l_z$的矩阵是什么?]
#sol[考虑$l=1$下共有3个本征态, 记为$ket(1)=ket(1\,-1),ket(2)=ket(1\,0),ket(3)=ket(1\,1)$

  那么$l_z$的矩阵表示应为$ mat(
    braket(1, l_z, 1), braket(1, l_z, 2), braket(1, l_z, 3);braket(2, l_z, 1), braket(2, l_z, 2), braket(2, l_z, 3);braket(3, l_z, 1), braket(3, l_z, 2), braket(3, l_z, 3)
  )=dmat(-hbar, 0, hbar) $]
#exmp[二态体系的哈密顿量$H=H_0+H'$,在$H_0$的表象中有$ H_0=dmat(E_1,E_2), H'=admat(H'_(1 2),H'_(2 1)) $证明$H=E_1 ketbra(1)+E_2 ketbra(2)+H'_(1 2)ketbra(1,2)+H'_(2 1)ketbra(2,1)$]
=== 不同表象中的表示
$ braket(p, x)&=1/sqrt(2pi hbar)e^(-(i p x)/hbar)\ braket(x, p)&=1/sqrt(2pi hbar)e^((i p x)/hbar) $
$ braket(p, H, psi)&=p^2/(2m)braket(p, psi)+V(i hbar pdv(, p))braket(p, psi) $
= Schödinger方程
#pst(
  "Schödinger Equation",
)[系统状态的演化由哈密顿算符决定$ i hbar pdv(, t)ket(psi)=H ket(psi) $]
#def("哈密顿量")[哈密顿算符的本征值是哈密顿量$ H ket(psi)=E ket(psi) $]
#thm(
  "Ehrenfest",
)[$ dv(, t)expval(A)_ket(psi)=frac(1, i hbar)expval([A,H])_ket(psi) $]
= 角动量
球坐标表示下, 角动量的各个分量表示为
$ l_x&=i hbar(sin phi.alt pdv(, theta)+cot theta cos phi.alt pdv(, phi.alt))\
l_y&=i hbar(-cos phi.alt pdv(, theta)+cot theta sin phi.alt pdv(, phi.alt))\
l_z&=- i hbar pdv(, phi.alt) $

球谐函数$Y(theta,phi.alt)$是$l_z$与$va(l)$的共同本征态(球坐标下表示).
$ Y(theta,phi.alt)&=Theta(theta)psi_m (phi.alt)\ va(l)^2 Y(theta,phi.alt)&=lambda hbar^2 Y(theta, phi.alt)\ psi_m (phi.alt)&=1/sqrt(2pi) e^(i m phi.alt) $
$Theta(xi)$是连带Legendre方程,其中$xi=cos theta$

当$lambda=l(l+1)$时,@a-legendre-eq 有连带Legendre多项式$P_l^m (xi)$作为解,根据归一化正交条件@a-legendre-orthog,可以定义:
$ Theta_(l m) (theta)=(-1)^m sqrt(2/(2l+1) ((l+m)!)/((l-m)!)) P_l^m (cos theta) $
满足 $ integral_0^pi Theta_(k m) (theta) Theta_(l m) (theta) sin theta dd(theta)=delta_(k l) $
最终
$ Y_(l m) (theta,phi.alt)\ =(-1)^m &sqrt(2/(2l+1) ((l+m)!)/((l-m)!)) P_l^m (cos theta) e^(i m phi.alt) $
球谐函数满足
$   &va(l)^2 Y_(l m)=l(l+1)hbar^2 Y_(l m)\ &l_z Y_(l m)=m hbar Y_(l m)\ &l=0,1,2,dots\ &m=-l,-l+1,dots,l-1,l\ &integral_0^(2pi)dd(phi.alt) integral_0^pi sin theta dd(theta) Y_(l_1 m_1)^* Y_(l_2 m_2)=delta_(l_1 l_2)delta_(m_1 m_2) $

= 势场中的波函数
== 一维无限深方势阱
$ V(x)=cases(0 "if" 0<x<a, infinity "elsewhere") $
$ E_n&=(pi^2hbar^2)/(2m a^2)n^2 "where" n=1,2,3,dots \ psi_n (x)&=cases(sqrt(2/a)sin((n pi x)/a) "if" 0<x<a, 0 "elsewhere") $
== 三维无限深方势阱
$ V(r)=cases(0 "if" (x,y,z) in [0,a]cprod[0,b]cprod[0,c], infinity "elsewhere") $
$ psi_(k_1 k_2 k_3)&(x,y,z)=\ &sin((k_1 pi x)/a)sin((k_2 pi y)/b)sin((k_3 pi z)/c) \
E_n              &=E_(k_1 k_2 k_3)=(pi^2 hbar^2)/(2m) (k_1^2/a^2+k_2^2/b^2+k_3^2/c^2) $
== 一维有限深方势阱
$ V(x)=cases(-V_0 "if" |x|<a, 0 "elsewhere") $
势阱外的波函数为平面波
$ psi(x)=cases(A e^(beta x) "if" x< -a, A e^(-beta x) "if" x>a) \ "where" beta=sqrt(2m(-E))/hbar $
势阱内的波函数为
$ psi(x)=C sin(k x) +D cos(k x) \ "where" k=sqrt(2m(V_0+E))/hbar $
替换$ z=k a,z_0=a sqrt(2m V_0)/hbar $
- 偶宇称态
$ tan(z)=sqrt(z_0^2/z^2-1) $
- 奇宇称态
$ -cot(z)=sqrt(z_0^2/z^2-1) $
#figure(
  image("finite-potential-solution.png", width: 80%),
  caption: [一维谐振子本征态],
)
== 一维有限方势垒
$ V(x)=cases(V_0 "if" 0<x<a, 0 "elsewhere") $
透射系数为
$ T=|S|^2=(1+1/(((4E)/V_0)(1-E/V_0))sinh^2(kappa a))^(-1)\ "where" kappa=sqrt(2m(V_0-E))/hbar $
在 $kappa a>>1$的情况下,
$ T=(16E(V_0-E))/V_0^2 e^(-(2a)/hbar sqrt(2m(V_0-E))) $
反射系数为
$ |R|^2+|S|^2=1 $
== 一维$delta$势垒
$ V(x)=gamma delta(x)\ -hbar^2/(2m) dv(psi, x, 2)=(E-gamma delta(x)) psi $
$psi''$在Schödinger方程的奇点处不存在,$psi$在$x=0$处不连续,对Schödinger方程积分可得*跃变条件*
$ psi'(0^+)-psi'(0^-)=(2m gamma)/hbar^2 psi(0) $
$ psi(x)=cases(e^(i k x)+R e^(-i k x) "if" x<0, S e^(i k x) "if" x>0) \ "where"
k=sqrt(2m E)/hbar $
由连续性与跃变条件有
$ S&=1/(1+(i m gamma)/(hbar^2 k))\ R&=S-1=- (i m gamma)/(1+(i m gamma)/(hbar^2
k)) $
$ T&=|S|^2=1/(1+(m gamma^2)/(2hbar^2 E))\ |R|^2&+|S|^2=1 $
特征长度与特征能量为
$ L&=hbar^2/(m gamma)\ E&=(m gamma^2)/ hbar^2 $
== 一维谐振子
$ V(x)=1/2 k x^2 $
#figure(
 image("harmonic-oscillator-solution.png", width: 90%),
 caption: [一维谐振子本征态],
)
=== 幂级数法:
薛定谔方程表示为
$ (-hbar^2/(2m)dv(d, x, 2)+1/2 k x^2)psi=E psi \ ==> dv(psi, xi,
2)+(lambda-xi^2) psi=0 \ "where" omega=sqrt(k/m), lambda=(2E)/(hbar omega), xi=x
sqrt((m omega)/hbar)=alpha x $
解为
$ E_n&=(n+1/2)hbar omega \ psi_n&=((m omega)/(pi hbar))^(1/4) 1/sqrt(2^n
n!)H_n(psi) e^(-psi^2/2) \ "where"& H_n(x)=(-1)^n e^(x^2) dv(, x, n) e^(-x^2) $
=== 升降算符法
参考 _Modern Quantum Mechanics 3rd edition_ (Sakurai)
$ H=p^2/(2m)+(m omega^2x^2)/2 $
定义3个算符
$ a &=sqrt((m omega)/(2 hbar))(x+ (i p)/(m omega)) "annihilation operator"\
a^dagger&=sqrt((m omega)/(2 hbar))(x- (i p)/(m omega)) "creation operator"\
N &=a^dagger a $
可以得到
$ &[a,a^dagger]=1/(2hbar)(-i[x,p]+i[p,x])=1\ &a^dagger a=H/(hbar omega)-1/2 $
$ H=hbar omega(N+1/2) $
将$N$的本征值记为$n$,即$N ket(n)=n ket(n)$,则有
$ H ket(n)&=(n+1/2)hbar omega ket(n)\ E_n&=(n+1/2)hbar omega $
另外
$ &[N,a]=-a \ &[N,a^dagger]=a^dagger $
升降算符的名称来源于
$ N a^dagger ket(n)&=([N,a^dagger]+a^dagger N) ket(n)=(n+1) a^dagger ket(n) \ N
a ket(n) &=([N,a]+a N) ket(n)=(n-1) a ket(n) $ <an-cr-op>
从而$a^dagger ket(n)$和$a ket(n)$也是$N$的本征态
从@an-cr-op 可发现$ a ket(n)=&c ket(n-1)==> \ &braket(n,a^dagger a,n)=|c|^2=1=braket(n,N,n)=n $ <an-cr-csqure-n>
人们一般取$c$为实数且$c=1$,对$a^dagger$也如此操作,最后有$ a ket(n)&=sqrt(n)ket(n-1)\ a^dagger ket(n)&=sqrt(n)ket(n+1) $
注意到@an-cr-csqure-n 中蕴含$n>=0$,即$N$为正定厄米算符,可证明$n$均为整数,且最小的本征值$n_0=0$.
从而谐振子基态为$ E_0=1/2 hbar omega $
== 氢原子
#figure(image("hydrogen.png", width: 90%), caption: [氢原子波函数])
