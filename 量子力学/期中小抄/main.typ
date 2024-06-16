#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = [量子力期中小抄]
#let thisauthor = "杨哲涵"
#set document(title: [#title], author: thisauthor)
#set heading(numbering: "1.")
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#set page("a4", numbering: "1", margin: (x: 1cm, y: 1cm))
#import "@preview/physica:0.9.2": *
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
  padding: (top: 0.1em, bottom: 0.1em)
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
#let proof = thmproof(
  "proof",
  "证明",
  inset: (x: 0em, top: 0em),
  titlefmt: emph,
  base: "thm",
)

#set par(leading: 0.3em)
#set block(spacing: 0.4em)
#show: rest => columns(3, rest,gutter: 1%)

#set text(8pt) // 经过测试,这是最小的字号

= 数学速查
#thm(
  "Schwarz不等式",
)[$ braket(alpha, alpha)braket(beta, beta)>=|braket(alpha, beta)|^2 $] <schwarz-ineq>
$ epsilon_(i j k)epsilon_(l m n)=mdet(
  delta_(i l), delta_(i m), delta_(i n);delta_(j l), delta_(j m), delta_(j n);delta_(k l), delta_(k m), delta_(k n)
) $
$ sum_(i=1)^3 epsilon_(i j k) epsilon_(i m n)=delta_(j m) delta_(k n)-delta_(j n)delta_(k m) $
$ (va(A)cprod va(B))_k=sum_(i j) epsilon_(k i j) A_i B_j $
$ grad=vu(r)pdv(, r)+1/r vu(theta)pdv(, theta)+1/(r sin theta)vu(phi.alt)pdv(, phi.alt) $
$ div va(u)=1/r^2 pdv(, r)(r^2 u_r)+1/(r sin theta)pdv(, theta)(sin theta u_theta)\ +1/(r sin theta)pdv(, phi.alt)u_phi.alt $
$ (vb(A)cprod vb(B))^k=epsilon^(k i j)A_i B_j $
$ [A,B C]=B[A,C]+[A,B]C $
$ [A B,C]=A[B,C]+[A,C]B $
#def(
  "连带Legendre多项式",
)[$ (1-xi^2)dv(P, xi, 2)-2xi &dv(P, xi) \ +(l(l+1)&-m^2/(1-xi^2))P=0 $$ P_l^m (x)=1/(2^l l!) (1-x^2)^(m^2/2) dv(, x, l+m) (x^2-1)^l $]
#thm(
  "连带Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k^m (xi)P_l^m (xi)dd(xi)=2/(2l+1) ((l+m)!)/((l-m)!)delta_(k l) $] <a-legendre-orthog>
#def(
  "Legendre多项式",
)[$ P_l (x)=1/(2^l l!) dv(, x, l) (x^2-1)^2 $]
#thm(
  "Legendre多项式的正交性",
)[$ integral_(-1)^1 P_k (x) P_l (x)dd(x)=2/(2l+1) delta_(k l) $]
#thm(
  "厄米多项式的正交性",
)[$ integral_(-infinity)^(+infinity) H_m (xi) H_n (xi) e^(-xi^2) dd(xi)=sqrt(pi) 2^n n! delta_(m n) $]
#thm(
  [$delta$函数的性质],
)[$ delta(a x)&=1/(|a|)delta(x) \ delta(x)&=1/(2pi)integral_(-infinity)^infinity e^(i k x)dd(k)\ x delta(x)&=0\ delta(f(x))&=sum_i delta(x-x_i)/abs(f'(x_i)) $]

$ f(x)&=1/sqrt(2pi) integral e^(i k x) g(k)dd(k)\ g(k)&=1/sqrt(2pi) integral e^(-i k x) f(x)dd(x) $

$ integral_(-infinity)^(+infinity) e^(-x^2) dd(x)=sqrt(pi) $

$ A&=P D P^(-1) \ D&=dmat(lambda_1,dots,lambda_n )"," P=mat(v_1,dots,v_n) $
= 态与算符
#def("概率密度")[$rho=psi^* psi$]
#def("概率流密度",)[$ va(j)&=-(i hbar)/(2m)(psi^* grad psi-psi grad psi^*)\ &=1/(2m) (psi^* p psi-psi p psi^*) $]
#thm("概率守恒")[概率(粒子数)守恒的微分式$pdv(rho, t)+div va(j)=0$]
#def([$delta$函数规格化])[对于全空间积分发散的波函数,可以要求$ integral psi^*_p' (x) psi_p (x)=delta(p'-p) $]
#thm(
  "不确定关系",
)[对任意$psi$有$ expval((Delta A)^2) expval((Delta B)^2)>=1/4 |expval([A,B])|^2 $]

$ va(p)=-i hbar grad $
$ va(p)^2=- hbar^2 div grad $
$ va(l)=va(r)cprod va(p) $
$ va(l)cprod va(l)=i hbar va(l) $
$ va(l)^2&=l_z^2+l_y^2+l_z^2 \ &=-hbar^2/(sin theta)pdv(, theta)sin theta pdv(, theta)+1/(sin^2 theta) l_z^2 $
$ va(p_r)=1/2(vu(r)dprod va(p)+va(p)dprod vu(r))=-i hbar(pdv(, r)+1/r) \ =- hbar^2 1/r^2 pdv(, r, 2) r^2 pdv(, r) $
$ va(p)^2=1/r^2va(l)^2+va(p_r)^2 $

$ [x_alpha,p_beta]=i hbar delta_(alpha beta) $
$ [l_alpha,x_beta]=epsilon_(alpha beta gamma)i hbar x_gamma $
$ [l_alpha,p_beta]=epsilon_(alpha beta gamma)i hbar p_gamma $
$ [l_alpha,l_beta]=epsilon_(alpha beta gamma)i hbar l_gamma $
$ [va(r),H]=(i hbar)/m va(p) $
#pst(
  "Schödinger Equation",
)[$ i hbar pdv(, t)ket(psi)=H ket(psi) $]
#def("定态")[若$ket(psi(t))$是哈密顿量的本征态,则称其为定态.定态是体系的能量有确定值的状态.]
#thm[定态下,一切不显含时间的力学量的平均值和概率分布都不随时间变化]
#def("角动量")[
$ l_x&=i hbar(sin phi.alt pdv(, theta)+cot theta cos phi.alt pdv(, phi.alt))\
l_y&=i hbar(-cos phi.alt pdv(, theta)+cot theta sin phi.alt pdv(, phi.alt))\
l_z&=- i hbar pdv(, phi.alt) $]

$ Y(theta,phi.alt)&=Theta(xi)psi_m (phi.alt)\ va(l)^2 Y(theta,phi.alt)&=lambda hbar^2 Y(theta, phi.alt)\ psi_m (phi.alt)&=1/sqrt(2pi) e^(i m phi.alt) $

$ Y_(l m) (theta,phi.alt)\ =(-1)^m &sqrt((2l+1)/(4pi) ((l-m)!)/((l+m)!)) P_l^m (cos theta) e^(i m phi.alt) $
球谐函数满足
$   &va(l)^2 Y_(l m)=l(l+1)hbar^2 Y_(l m)\ &l_z Y_(l m)=m hbar Y_(l m)\ &l=0,1,2,dots\ &m=-l,-l+1,dots,l-1,l\ &integral_0^(2pi)dd(phi.alt) integral_0^pi sin theta dd(theta) Y_(l_1 m_1)^* Y_(l_2 m_2)=delta_(l_1 l_2)delta_(m_1 m_2) $
#thm(
  "Backer-Hausdorff",
)[对算符$A$,$B$,若$C:=[A,B]$满足$[C,A]=[C,B]=0$,则有$ e^(A+B)=e^A e^B e^(-1/2 C)=e^B e^A e^(1/2 C) $]
= 矩阵形式
#thm(
  "幺正变换",
)[对2套各自正交归一的基矢,存在幺正算符$U$使得$ ket(b_1)=U ket(a_1),dots,ket(b_n)=U ket(a_n) $]
$ braket(p, x)&=1/sqrt(2pi hbar)e^(-(i p x)/hbar)\ braket(x, p)&=1/sqrt(2pi hbar)e^((i p x)/hbar) $
$ braket(p, H, psi)&=p^2/(2m)braket(p, psi)+V(i hbar pdv(, p))braket(p, psi) $
= 简单势场
#def("简并")[如果对一个给定的能量$E$,只有一个线性独立的波函数存在,则称该能级是非简并的,否则
称它是简并的,其线性独立的波函数的个数称为它的简并度]
== 关于一维定态Schrödinger方程的解的结论
#thm("Wronski")[若势能$V(x)$在$-infinity<x<+infinity$上没有奇点,$psi_1 (x)$和$psi_2 (x)$都是一维定态Schrödinger方程的解,而且属于相同的能量,那么$ mdet(psi_1,psi_2;psi'_1,psi'_2)="constant" $]
#thm("共轭")[假定$V(x)$是实函数,那么若$psi$是解,$psi^*$也是解]
#thm("反射")[若$V(x)=V(-x)$,那么若$psi(x)$是解,$psi(-x)$也是解]
#thm("不简并")[一维束缚定态必是非简并态]
== 一维无限深方势阱
$ V(x)=cases(0 &"if" 0<x<a, infinity &"elsewhere") $
$ E_n&=(pi^2hbar^2)/(2m a^2)n^2 "where" n=1,2,3,dots \ psi_n (x)&=cases(sqrt(2/a)sin((n pi x)/a) &"if" 0<x<a, 0 &"elsewhere") $
== 三维无限深方势阱
$ V(r)=cases(0 &"if" (x,y,z) in [0,a]cprod[0,b]cprod[0,c], infinity &"elsewhere") $
$ psi_(n_1 n_2 n_3)&(x,y,z)=\ sqrt(8/(a b c))&sin((n_1 pi x)/a)sin((n_2 pi y)/b)sin((n_3 pi z)/c) \ &E_(n_1 n_2 n_3)=(pi^2 hbar^2)/(2m) (n_1^2/a^2+n_2^2/b^2+n_3^2/c^2) $
== 一维有限深方势阱
$ V(x)=cases(0 &"if" abs(x)<a/2, V_0 &"if" abs(x)>a/2) $
势阱外的波函数为平面波
$ psi(x)=cases(
  C e^(beta x) &"if" x< -a/2,
  A sin(k x)+B cos(k x) &"if" abs(x) < a/2,
  D e^(-beta x) &"if" x>a/2,

) \ beta=sqrt(2m(V_0-E))/hbar ","k=sqrt(2m E)/hbar $
无量纲数 $xi=(k a)/2$, $eta=(beta a)/2$ 满足
$ eta^2+xi^2=(m V_0 a^2)/(2 hbar^2) $
/ 偶宇称态: $xi tan(xi)=eta$
基态宇称为偶
/ 奇宇称态: $-xi cot(xi)=eta$
在$V_0 a^2>= (pi^2 hbar^2)/(2m)$时才可能出现最低的奇宇称能级
$ E_n=(2hbar^2)/(m a^2)xi^2 $
== 一维有限高方势垒
$ V(x)=cases(V_0 &"if" 0<x<a, 0 &"elsewhere") $
取波函数$ psi(x)=cases(e^(i k x)+R e^(- i k x) &"if" x<0, S e^(i k x) &"if" x>0) $
透射系数为
$ T=|S|^2=(1+1/(((4E)/V_0)(1-E/V_0))sinh^2(kappa a))^(-1)\ "where" kappa=sqrt(2m(V_0-E))/hbar $
在 $kappa a>>1$的情况下,
$ T=(16E(V_0-E))/V_0^2 e^(-(2a)/hbar sqrt(2m(V_0-E))) $
反射系数为
$ |R|^2+|S|^2=1 $
== 一维$delta$势垒
$ V(x)=gamma delta(x)\ -hbar^2/(2m) dv(psi, x, 2)=(E-gamma delta(x)) psi $
在Schödinger方程的奇点$x=0$处$psi''$不存在,$psi$不连续,对Schödinger方程积分可得*跃变条件*
$ psi'(0^+)-psi'(0^-)=(2m gamma)/hbar^2 psi(0) $
$ psi(x)=cases(e^(i k x)+R e^(-i k x) &"if" x<0, S e^(i k x) &"if" x>0) \
"where"
k=sqrt(2m E)/hbar $
由连续性与跃变条件有
$ S&=1/(1+(i m gamma)/(hbar^2 k))\ R&=S-1=- (i m gamma)/(hbar^2 k) 1/(1+(i m
gamma)/(hbar^2
k)) $
$ T&=|S|^2=1/(1+(m gamma^2)/(2hbar^2 E))\ |R|^2&+|S|^2=1 $
特征长度为$L=hbar^2/(m gamma)$,特征能量为$E=(m gamma^2)/ hbar^2 $
== 一维谐振子
$ V(x)=1/2 k x^2 $
=== 幂级数法
$ dv(psi, xi,
2)+(lambda-xi^2) psi=0 \ "where" omega=sqrt(k/m), lambda=(2E)/(hbar omega), xi=x
sqrt((m omega)/hbar) $
$ E_n&=(n+1/2)hbar omega \ psi_n (x)&=((m omega)/(pi hbar))^(1/4) 1/sqrt(2^n
n!)H_n (xi) e^(-xi^2/2) \ "where"& H_n (x)=(-1)^n e^(x^2) dv(, x, n) e^(-x^2) $
=== 升降算符法
$ H=p^2/(2m)+(m omega^2x^2)/2 $
$ a &=sqrt((m omega)/(2 hbar))(x+ (i p)/(m omega))\
a^dagger&=sqrt((m omega)/(2 hbar))(x- (i p)/(m omega))\
N &=a^dagger a $
$ [a,a^dagger]=1 $
$ H ket(n)&=(n+1/2)hbar omega ket(n)\ E_n&=(n+1/2)hbar omega $
$ &[N,a]=-a \ &[N,a^dagger]=a^dagger $
$ a ket(n)&=sqrt(n)ket(n-1)\ a^dagger
ket(n) &=sqrt(n+1)ket(n+1) $
$ ket(n)=1/sqrt(n!)(a^dagger)^n ket(0) $
$ a ket(0)=0 $
$ psi_0 (x)=((m omega)/(pi hbar))^(1/4) e^(-(m omega)/(2hbar)x^2) $

$ braket(x, n)=&1/sqrt(n!)braket(x, (a^dagger)^n, 0)\ =&1/sqrt(2^n n!) ((m
omega)/(pi hbar))^(1/4) \ &(sqrt((m omega)/hbar)x+sqrt(hbar/(m omega))dv(, x))^n
e^(-(m omega)/(2hbar)x^2) $
= 守恒量与对称性
== 守恒量
#thm(
 "Ehrenfest",
)[若力学量$A$不显含时间,有$ dv(, t)expval(A)=frac(1, i hbar)expval([A,H]) $] <ehrenfest>
#proof[考虑力学量$A(t)$在任意$ket(psi(t))$上的演化,可得$ dv(, t) expval(A)=expval(pdv(A,
t))+1/(i hbar)expval([A,H]) $此外$A$不显含时间,有$pdv(A, t)=0$.]
#thm[若力学量$A$不显含时间,且$[A,H]=0$,则$A$在任何$ket(psi(t))$下的平均值与概率分布均不变.]
#proof[平均值不变由@ehrenfest 说明,概率分布的证明如下

 取包含$A,H$在内的力学量完全集,将任何态$ket(psi)$用完全集的共同本征态${ket(psi_k)}$展开
 $ ket(psi(t))=sum_k a_k (t) ket(psi_k) $
 其中$a_k (t)=braket(psi_k, psi(t))$
 现在考虑概率的变化
 $ dv(, t) abs(a_k (t))^2=dv(a_k^*, t)a_k + a_k^* dv(a_k, t) $由于$ dv(a_k^*,
t)&=-1/(i hbar)braket(psi, H, psi_k)=-E_k/(i hbar)a_k^* \ dv(a_k, t)&=E_k/(i
 hbar)a_k $因此$dv(, t) abs(a_k (t))^2=0$.]
#exmp[中心力场中的守恒量为${H,va(l)^2,l_z}$.]
#exmp[自由粒子的态可以用${p_x,p_y,p_z}$标记,对应能量的简并度一般是无穷大.]
#thm("Feynman-Hellmann")[若系统哈密顿量含有某参数$lambda$,$E_n$为哈密顿量的本征值,相应归一化本征态(束缚态)为$ket(psi_n)$,有$ pdv(E_n,lambda)=expval(pdv(H,lambda),psi_n) $]
#thm(
 "位力(virial)",
)[处于势场$V(va(r))$中的粒子,动能算符在定态上的平均值为$ expval(T)=1/2 expval(va(r) dprod grad V) $]
#coll[当势能为坐标的$n$次齐次函数时,有$ expval(T)=n/2 expval(V) $]
== 力学量完全集
#def(
 "CSCO",
)[彼此独立,互相对易的厄米算符的共同本征态如果能唯一确定体系的状态,那么这组力学量就称为*对易力学量完全集*(complete set of
commuting
 observables).]
#def(
 "CSCCO",
)[如果对易力学量完全集中包含哈密顿量,并且哈密顿量是守恒量(不显含时间),那么该完全集中所有力学量都是守恒量,这样的完全集称为*对易守恒量完全集*(complete
 set of commuting conserved observables).]
== Schödinger图像与Heisenberg图像 <heisgenberg-pic>
#def(
 "Schödinger图像",
)[$ket(psi(t))$随时间演化,其变化遵守Schrödinger方程,力学量算符(不显含时间)与时间无关,这种描述方式称为Schrödinger图像.]
#def(
 "Heisenberg图像",
)[$ket(psi)$不随时间变化,力学量算符$A(t)$随时间演化,这种描述方式称为Heisenberg图像#footnote([除了@heisgenberg-pic
以外,其他部分均采用Schrödinger图像]).]
#thm("Heisenberg方程")[算符$A(t)$随时间的变化为$ dv(, t)A(t)=1/(i hbar)[A(t),H] $]
== 相互作用图像
相互作用图像介于Schrödinger图像和Heisenberg图像之间,在用微扰论来处理问题时有广泛的应用.

== 全同粒子体系与交换对称性
#def(
  "全同粒子",
)[经典中,由于粒子的性质和状态可以连续变化,谈不上两个粒子真正全同.但实际上粒子是量子化的,属于同一类(内禀属性即静质量,电荷,自旋,磁矩,寿命,
  内部结构等相同)的粒子称为全同粒子.]
#def(
  "交换算符",
)[$ P_(i j)&psi(dots, q_i, dots, q_j, dots, t)\ &=psi(dots, q_j, dots, q_i, dots, t) $] <exchange-operator>
#thm[交换算符是厄米的.]
#thm[交换算符是幺正的.]
#pst("全同性假设")[全同粒子体系中,可观测量对任何两个粒子交换是不变的,即任意两个全同粒子的交换,都不改变体系的物理状态.] <identity-postulate>
#coll(
  "全同粒子体系波函数的性质",
)[根据@exchange-operator 以及@identity-postulate,全同粒子体系的波函数$psi$满足$ P_(i j) psi&=C psi \ C&=plus.minus 1 $]
#thm("全同粒子的统计性不变")[全同粒子系的波函数交换对称性是不随时间变化的,即Bose统计或Fermi统计是不变的.]
#thm(
  [$N$个全同玻色子体系的波函数],
)[$ Psi_(n_1 dots n_N)^S (q_1,dots,q_N)&\ =sqrt((product_i n_i !)/N!)sum_P
                                     &P(psi_k_1 (q_1) dots psi_k_N (q_N)) $]
#def(
  "反对称化算符",
)[$ cal(A)=sqrt(1/N!)sum_P delta_P P $这里$P$代表$N$个粒子的一种排列,$delta_P$在$P$是经过奇数个对换得到时为$-1$,偶数个对换为$+1$]
#thm(
  [$N$个全同费米子体系的波函数],
)[$ Psi_(n_1 dots n_N)^A &(q_1,dots,q_N)\ =&sqrt(1/N!) mdet(
    psi_k_1 (q_1), dots, psi_k_1 (q_N);dots.v, , dots.v;psi_k_N (q_1), dots, psi_k_N (q_N)
  ) \ =&cal(A) psi_k_1 (q_1) dots psi_k_N
  (q_N) $]
#thm("Pauli不相容原理")[不允许有两个及以上全同的费米子处于同一个单粒子态]
#exmp[对3个全同粒子组成的系统,如果可能的单粒子态有3种.那么Boltzmann统计(经典统计),Bose统计,Fermi统计下,系统的可能态数目分别为27,10,1.

  一般来说,对于3个及3个以上的全同粒子体系,Bose统计与Fermi统计的可能态数目总是少于Boltzmann统计.因为后者包含有一些没有对称性或混杂对称性的状态.]
== 二次量子化方法
对全同粒子编号本来就是多余的,粒子填布数表象描述全同粒子体系的量子态更为方便.

在同一势场中运动的全同粒子体系的态可以用单粒子态上的粒子占有数表示
$ ket(n_1 n_2 n_3 dots)=ket(n_1)ket(n_2)ket(n_3)dots $
即在$ket(psi_1),ket(psi_2),ket(psi_3),dots$上分别有$n_1,n_2,n_3,dots$个粒子.
