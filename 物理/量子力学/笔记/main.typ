#import "../../../note_zh.typ": *
#show: conf.with(
  title: "量子力学笔记",
  author: "adamanteye",
  numbered-equation: true,
)
#figure(
  table(
    stroke: none,
    columns: 5,
    table.hline(),
    table.header([], [$delta$势], [线性], [谐振子], [库仑$kappa=Z e^2$]),
    [],
    [$mu=hbar=gamma=1$],
    [$mu=hbar=F=1$],
    [$mu=hbar=omega=1$],
    [$mu=hbar=kappa=1$],
    table.hline(),
    [能量$[E]$],
    [$mu gamma^2\/hbar^2$],
    [$(hbar^2 F^2\/mu)^(1\/3)$],
    [$hbar omega$],
    [$mu kappa^2\/hbar^2$],
    [长度$[L]$],
    [$hbar^2\/mu gamma$],
    [$(hbar^2\/mu F)^(1\/3)$],
    [$sqrt(hbar\/mu omega)$],
    [$hbar^2\/mu kappa$],
    [时间$[T]$],
    [$hbar^3\/mu gamma^2$],
    [$(hbar mu\/F^2)^(1\/3)$],
    [$1\/omega$],
    [$hbar^3\/mu kappa^2$],
    [速度$[v]$],
    [$gamma\/hbar$],
    [$(hbar F\/mu^2)^(1\/3)$],
    [$sqrt(hbar omega\/mu)$],
    [$kappa\/hbar$],
    [动量$[p]$],
    [$mu gamma\/hbar$],
    [$(hbar mu F)^(1\/3)$],
    [$sqrt(hbar mu omega)$],
    [$mu kappa\/hbar$],
    table.hline(),
  ),
  caption: [自然单位制],
)
#show: rest => columns(2, rest)
= 数学速查
#thm("Schwarz不等式")[$ braket(alpha, alpha)braket(beta, beta)>=|braket(alpha, beta)|^2 $] <schwarz-ineq>
#proof[$
    (bra(alpha)+lambda^* bra(beta))dprod (ket(alpha)+lambda ket(beta))>=0
  $对任意$lambda$成立,将$lambda=-braket(beta, alpha) / braket(beta, beta)$带入得证]
#thm("三角恒等式")[$ sin(a)sin(b)=1 / 2(cos(a-b)-cos(a+b)) $]
== Levi-Civita symbol
参考#link(
  "https://zh.wikipedia.org/wiki/%E5%88%97%E7%B6%AD-%E5%A5%87%E7%B6%AD%E5%A1%94%E7%AC%A6%E8%99%9F",
)[中文维基页面]
#def("Levi-Civiat Symbol")[#grid(
    columns: (30%, 1fr),
    image("levicivita-symbol.png"), $ epsilon_(i j k)=cases(1&, 0&"for equal indices", -1&) $,
  )]
$
  epsilon_(i j k)epsilon_(l m n)=mdet(
    delta_(i l), delta_(i m), delta_(i n); delta_(j l), delta_(j m), delta_(j n); delta_(k l), delta_(k m), delta_(k n)
  )
$ <levi-det>
@levi-det 对于一般的$n$也成立
$ sum_(i=1)^3 epsilon_(i j k) epsilon_(i m n)=delta_(j m) delta_(k n)-delta_(j n)delta_(k m) $
$ (va(A)cprod va(B))_k=sum_(i j) epsilon_(k i j) A_i B_j $
== 球坐标系
$ grad=vu(r)pdv(, r)+1 / r vu(theta)pdv(, theta)+1 / (r sin theta)vu(phi.alt)pdv(, phi.alt) $
$
  div va(u)=1 / r^2 pdv(, r)(r^2 u_r)+1 / (r sin theta)pdv(, theta)(sin theta u_theta)\ +1 / (r sin theta)pdv(, phi.alt)u_phi.alt
$
== 爱因斯坦求和约定
采用爱因斯坦求和约定,可以让式子更加简洁
$ (vb(A)cprod vb(B))^k=epsilon^(k i j)A_i B_j $
== 泊松括号
$ [A,B C]=B[A,C]+[A,B]C $
$ [A B,C]=A[B,C]+[A,C]B $
$ [A,[B,C]]+B[C,A]+[C,[A,B]]=0 $
== 特殊函数
#def("连带Legendre多项式")[$ (1-xi^2)dv(P, xi, 2)-2xi &dv(P, xi) \ +(l(l+1)&-m^2 / (1-xi^2))P=0 $$
    P_l^m (x)=1 / (2^l l!) (1-x^2)^(m^2 / 2) dv(, x, l+m) (x^2-1)^l
  $]
#thm("连带Legendre多项式的正交性")[$
    integral_(-1)^1 P_k^m (xi)P_l^m (xi)dd(xi)=2 / (2l+1) ((l+m)!) / ((l-m)!)delta_(k l)
  $] <a-legendre-orthog>
#def("Legendre多项式")[连带Legendre多项式中$m=0$的情况$ P_l (x)=1 / (2^l l!) dv(, x, l) (x^2-1)^2 $]
#thm("Legendre多项式的正交性")[$ integral_(-1)^1 P_k (x) P_l (x)dd(x)=2 / (2l+1) delta_(k l) $]
#def("球谐函数")[$
    Y_(l m) (theta,phi.alt)\ =(-1)^m &sqrt((2l+1) / (4pi) ((l-m)!) / ((l+m)!)) P_l^m (cos theta) e^(i m phi.alt)
  $$
    Y_(00)&=1 / sqrt(4pi),Y_(10)=sqrt(3 / (4pi))cos theta\ Y_(1plus.minus 1)&=minus.plus sqrt(3 / (8pi))sin theta e^(plus.minus i phi.alt)\ Y_(20)&=sqrt(5 / (16pi))(3cos^2theta-1)\ Y_(2plus.minus 1)&=minus.plus sqrt(15 / (8pi))cos theta sin theta e^(plus.minus i phi.alt)\ Y_(2plus.minus 2)&=1 / 2 sqrt(15 / (8pi))sin^2theta e^(plus.minus 2i phi.alt)
  $]
#thm("球谐函数的完备性")[平方可积的球谐函数形成了一个希尔伯特空间$ integral.double Y_(l' m') Y_(l m) sin theta dd(theta) dd(phi.alt)=delta_(l l') delta_(m m') $$
    sum_(l=0)^(+infinity)sum_(m=-l)^(+l) Y_(l m) (theta,phi.alt) Y_(l' m')^* (theta',phi.alt')\ =1 / (sin theta) delta(theta-theta') delta(phi.alt-phi.alt')
  $]
#thm("球谐函数的递推性质")[$
    z / r Y_(l m)=&cos theta Y_(l m)\ =&a_(l m)Y_(l+1,m)+a_(l-1,m)Y_(l-1,m)\ (x+i y) / r Y_(l m)=& e^(+i phi.alt)sin theta Y_(l m)\ =& b_(l-1,-(m+1))Y_(l-1,m+1)-b_(l m)Y_(l+1,m+1)\ (x-i y) / r Y_(l m)=&e^(- i phi.alt)sin theta Y_(l m)\ =& -b_(l-1,m-1)Y_(l-1,m-1)+b_(l,-m)Y_(l+1,m-1) \ a_(l m)=& sqrt(((l+1)^2-m^2) / ((2l+1)(2l+3)))\ b_(l m)=&sqrt((l+m+1)(l+m+2)) / ((2l+1)(2l+3))
  $]
#thm("厄米多项式的正交性")[$
    integral_(-infinity)^(+infinity) H_m (xi) H_n (xi) e^(-xi^2) dd(xi)=sqrt(pi) 2^n n! delta_(m n)
  $]
#thm("厄米多项式的递推关系")[$ H_(n+1) (xi)-2xi H_n (xi)+2n H_(n-1) (xi)=0 $]
#def("合流超几何微分方程")[$ z dv(y, z, 2)+(gamma-z)dv(y, z)-alpha y=0 $]
#def("合流超几何函数")[$
    F(alpha,gamma,z)&=sum_(k=0)^infinity alpha_k / gamma_k z^k / (k!)\ "where" alpha_k&=alpha(alpha+1)dots(alpha+k-1)\ gamma_k&=gamma(gamma+1)dots(gamma+k-1)
  $]
== $delta$函数
#thm([$delta$函数的性质])[$
    delta(a x)&=1 / (|a|)delta(x) \ delta(x)&=1 / (2pi)integral_(-infinity)^infinity e^(i k x)dd(k)\ x delta(x)&=0\ delta(f(x))&=sum_i delta(x-x_i) / abs(f'(x_i))
  $]
#def([三维$delta$函数])[假设已定义一维Dirac函数$delta(x)$,那么$ delta(va(r))&=delta(x)delta(y)delta(z)\ &= 1 / (r^2sin theta)delta(r)delta(theta)delta(phi.alt)\ &=1 / rho delta(rho)delta(phi.alt)delta(z) $]
== 傅里叶变换
$ f(x)&=1 / sqrt(2pi) integral e^(i k x) g(k)dd(k)\ g(k)&=1 / sqrt(2pi) integral e^(-i k x) f(x)dd(x) $
#thm("Parseval")[平方可积函数的标积在傅里叶变化中保持不变$ integral_(-infinity)^(infinity)psi_1^*(x)psi_2(x)dd(x)=integral_(-infinity)^(infinity)phi.alt_1^*(k)phi.alt_2(k)dd(k) $]
== 积分
$ integral_(-infinity)^(+infinity) e^(-a^2x^2) dd(x)=sqrt(pi) / abs(a) $
$ integral_0^(+infinity)r^n e^(-r\/a)dd(r)=n! a^(n+1) $
= 态与波函数
#def("概率密度")[$ rho=psi^* psi $]
#def("概率流密度")[$ va(j)&=-(i hbar) / (2m)(psi^* grad psi-psi grad psi^*)\ &=1 / (2m) (psi^* p psi-psi p psi^*) $]
#thm("概率守恒")[概率(粒子数)守恒的微分式$ pdv(rho, t)+div va(j)=0 $]
#def([$delta$函数规格化])[对于全空间积分发散的波函数,可以要求$ integral psi^*_p' (x) psi_p (x)=delta(p'-p) $]
#pst[$braket(alpha, beta)=braket(beta, alpha)^*$]
#pst("positive definite metric")[$braket(alpha)>=0$]
= 算符
参考格里菲斯@griffiths_introduction_2005 以及樱井纯@sakurai_modern_2020.
== 基本假设
#def("伴随算符")[$A$的伴随算符#footnote[这里为了书写简便,算符均省略hat,注意区分算符,可观测量以及算符的矩阵表示]定义为$A^dagger$,有 $ A ket(psi)=bra(psi) A^dagger $]
#def("厄米算符")[称$A$为厄米算符当且仅当 $ A=A^dagger <==> braket(psi, A, phi)=(braket(phi, A, psi))^* \ "for arbitray" psi,phi $]
#def("投影算符")[对某表象中的基矢$ket(k)$,称$P_k$为投影算符,作用在任意$ket(psi)$上可得到$ket(psi)$在$ket(k)$方向上的部分$ P_k=ket(k)bra(k) $]
#thm("单位算符")[完备的情况下有$ I&=sum_n ketbra(k_n)\ I&=integral ketbra(x)dd(x) $]
#thm()[厄米算符的本征值总是实的]
#thm()[厄米算符对应不同本征值的本征态正交]
#def("平均值")[算符$A$的平均值定义为$ expval(A)_ket(psi)=expval(A, psi) $]
#thm()[厄米算符的平均值总是实的] <hermite-re>
#thm()[平均值总是实的的算符是厄米的]
#def("对易子")[算符$A$,$B$的对易子为$ [A,B]=A B-B A $]
#thm[如果两个厄米算符有共同的本征函数的集合,那么它们对易]
#def("反对易子")[算符$A$,$B$的反对易子定义为 $ {A,B}=A B+B A $]
#def("反厄米算符")[称$A$为反厄米算符当且仅当 $ A=-A^dagger $]
#thm()[反厄米算符的平均值总是虚的] <anti-hermite-im>
#def("偏差算符")[$ Delta A=A-expval(A) $]
#thm("不确定关系")[对任意$psi$有$ expval((Delta A)^2) expval((Delta B)^2)>=1 / 4 |expval([A,B])|^2 $]
#proof[将$ket(alpha)=Delta A ket(psi)$与$ket(beta)=Delta B ket(psi)$带入@schwarz-ineq 可得$ expval((Delta A)^2) expval((Delta B)^2)>=|expval(Delta A Delta B)|^2 $由于$ Delta A Delta B=1 / 2 [Delta A,Delta B]+1 / 2 {Delta A,Delta B}\ =1 / 2 [A,B]+1 / 2 {Delta A,Delta B} $使用@hermite-re
  以及@anti-hermite-im$ expval((Delta A)^2) expval((Delta B)^2)>=&\ 1 / 4 expval([A,B])^2&+1 / 4 expval({Delta A,Delta B})^2\ >=&1 / 4 expval([A,B])^2 $]
#coll("时间与能量的不确定度关系")[$ Delta E Delta t>=hbar / 2 $]
== 常见算符表示
$ va(p)=-i hbar grad $
$ va(p)^2=- hbar^2 div grad $
$ va(l)=va(r)cprod va(p) $
$ va(l)cprod va(l)=i hbar va(l) $
$ va(l)^2&=l_z^2+l_y^2+l_z^2 \ &=-hbar^2 / (sin theta)pdv(, theta)sin theta pdv(, theta)+1 / (sin^2 theta) l_z^2 $
$
  va(p_r)=1 / 2(vu(r)dprod va(p)+va(p)dprod vu(r))=-i hbar(pdv(, r)+1 / r) \ =- hbar^2 1 / r^2 pdv(, r, 2) r^2 pdv(, r)
$
$ va(p)^2=1 / r^2va(l)^2+va(p_r)^2 $
== 对易关系
$ [x_alpha,p_beta]=i hbar delta_(alpha beta) $
$ [l_alpha,x_beta]=epsilon_(alpha beta gamma)i hbar x_gamma $
$ [l_alpha,p_beta]=epsilon_(alpha beta gamma)i hbar p_gamma $
$ [l_alpha,l_beta]=epsilon_(alpha beta gamma)i hbar l_gamma $
$ [va(r),H]=(i hbar) / m va(p) $
== Schödinger方程
#pst("Schödinger Equation")[Schödinger方程是非相对论量子力学的基本方程.可以理解为系统状态的演化由哈密顿算符决定$ i hbar pdv(, t)ket(psi)=H ket(psi) $]
#def("哈密顿量")[哈密顿算符的本征值是哈密顿量$ H ket(psi)=E ket(psi) $]
#def("定态")[若$ket(psi(t))$是哈密顿量的本征态,则称其为定态.定态是体系的能量有确定值的状态.]
#thm[定态下,一切不显含时间的力学量的平均值和概率分布都不随时间变化]
== 角动量
球坐标表示下, 角动量的各个分量表示为
$
  l_x&=i hbar(sin phi.alt pdv(, theta)+cot theta cos phi.alt pdv(, phi.alt))\
  l_y&=i hbar(-cos phi.alt pdv(, theta)+cot theta sin phi.alt pdv(, phi.alt))\
  l_z&=- i hbar pdv(, phi.alt)
$

球谐函数$Y(theta,phi.alt)$是$l_z$与$va(l)^2$的共同本征态(球坐标下表示).
$
  Y(theta,phi.alt)&=Theta(xi)psi_m (phi.alt)\ va(l)^2 Y(theta,phi.alt)&=lambda hbar^2 Y(theta, phi.alt)\ psi_m (phi.alt)&=1 / sqrt(2pi) e^(i m phi.alt)
$
$Theta(xi)$是连带Legendre方程,其中$xi=cos theta$

当$lambda=l(l+1)$时,有连带Legendre多项式$P_l^m (xi)$作为解,根据归一化正交条件@a-legendre-orthog,可以定义:
$ Theta_(l m) (theta)=(-1)^m sqrt(2 / (2l+1) ((l+m)!) / ((l-m)!)) P_l^m (cos theta) $
满足 $ integral_0^pi Theta_(k m) (theta) Theta_(l m) (theta) sin theta dd(theta)=delta_(k l) $
最终
$ Y_(l m) (theta,phi.alt)\ =(-1)^m &sqrt((2l+1) / (4pi) ((l-m)!) / ((l+m)!)) P_l^m (cos theta) e^(i m phi.alt) $
球谐函数满足
$
  &va(l)^2 Y_(l m)=l(l+1)hbar^2 Y_(l m)\ &l_z Y_(l m)=m hbar Y_(l m)\ &l=0,1,2,dots\ &m=-l,-l+1,dots,l-1,l\ &integral_0^(2pi)dd(phi.alt) integral_0^pi sin theta dd(theta) Y_(l_1 m_1)^* Y_(l_2 m_2)=delta_(l_1 l_2)delta_(m_1 m_2)
$
== 算符的函数
#thm("Backer-Hausdorff")[对算符$A$,$B$,若$C:=[A,B]$满足$[C,A]=[C,B]=0$,则有$ e^(A+B)=e^A e^B e^(-1 / 2 C)=e^B e^A e^(1 / 2 C) $]
== 矩阵形式
#def("幺正矩阵")[称A为幺正矩阵,当且仅当$ A^dagger=A^(-1) $]
#thm("幺正变换")[对2套各自正交归一的基矢,存在幺正算符$U$使得$ ket(b_1)=U ket(a_1),dots,ket(b_n)=U ket(a_n) $]
#proof[构造$ U=sum_n ketbra(b_n, a_n) $注意到$ U^dagger U=sum_n sum_k ket(a_n)braket(b_n, b_k)bra(a_k)=I $从而$U$是幺正算符]

#exmp[在$l=1$的表象下, $l_z$的矩阵是什么?]
#sol[考虑$l=1$下共有3个本征态, 记为$ket(1)=ket(1\,-1),ket(2)=ket(1\,0),ket(3)=ket(1\,1)$
  那么$l_z$的矩阵表示应为$ mat(
    braket(1, l_z, 1), braket(1, l_z, 2), braket(1, l_z, 3); braket(2, l_z, 1), braket(2, l_z, 2), braket(2, l_z, 3); braket(3, l_z, 1), braket(3, l_z, 2), braket(3, l_z, 3)
  )=dmat(-hbar, 0, hbar) $]
#exmp[二态体系的哈密顿量$H=H_0+H'$,在$H_0$的表象中有$ H_0=dmat(E_1, E_2), H'=admat(H'_(1 2), H'_(2 1)) $证明$H=E_1 ketbra(1)+E_2 ketbra(2)+H'_(1 2)ketbra(1, 2)+H'_(2 1)ketbra(2, 1)$]
#thm("正交对角化")[$ A&=P D P^(-1) \ D&=dmat(lambda_1, dots, lambda_n)"," P=mat(v_1, dots, v_n) $]
== 不同表象中的表示
$ braket(p, x)&=1 / sqrt(2pi hbar)e^(-(i p x) / hbar)\ braket(x, p)&=1 / sqrt(2pi hbar)e^((i p x) / hbar) $
$ braket(p, H, psi)&=p^2 / (2m)braket(p, psi)+V(i hbar pdv(, p))braket(p, psi) $
= 简单势场中的本征问题
#def("简并")[如果对一个给定的能量$E$,只有一个线性独立的波函数存在,则称该能级是非简并的,否则 称它是简并的,其线性独立的波函数的个数称为它的简并度]
== 关于一维定态Schrödinger方程的解的结论
#thm("Wronski")[若势能$V(x)$在$-infinity<x<+infinity$上没有奇点,$psi_1 (x)$和$psi_2 (x)$都是一维定态Schrödinger方程的解,而且属于相同的能量,那么$ mdet(psi_1, psi_2; psi'_1, psi'_2)="constant" $]
#thm("共轭")[假定$V(x)$是实函数,那么若$psi$是解,$psi^*$也是解]
#thm("反射")[若$V(x)=V(-x)$,那么若$psi(x)$是解,$psi(-x)$也是解]
#thm("不简并")[一维束缚定态必是非简并态]
== 一维无限深方势阱
$ V(x)=cases(0 &"if" 0<x<a, infinity &"elsewhere") $
$
  E_n&=(pi^2hbar^2) / (2m a^2)n^2 "where" n=1,2,3,dots \ psi_n (x)&=cases(sqrt(2 / a)sin((n pi x) / a) &"if" 0<x<a, 0 &"elsewhere")
$
== 三维无限深方势阱
$ V(r)=cases(0 &"if" (x,y,z) in [0,a]cprod[0,b]cprod[0,c], infinity &"elsewhere") $
$
  psi_(n_1 n_2 n_3)&(x,y,z)=\ sqrt(8 / (a b c))&sin((n_1 pi x) / a)sin((n_2 pi y) / b)sin((n_3 pi z) / c) \ &E_(n_1 n_2 n_3)=(pi^2 hbar^2) / (2m) (n_1^2 / a^2+n_2^2 / b^2+n_3^2 / c^2)
$
== 一维有限深方势阱
$ V(x)=cases(0 &"if" abs(x)<a / 2, V_0 &"if" abs(x)>a / 2) $
势阱外的波函数为平面波
$
  psi(x)=cases(
    C e^(beta x) &"if" x< -a / 2,
    A sin(k x)+B cos(k x) &"if" abs(x) < a / 2,
    D e^(-beta x) &"if" x>a / 2,
  ) \ beta=sqrt(2m(V_0-E)) / hbar ","k=sqrt(2m E) / hbar
$
无量纲数 $xi=(k a) / 2$, $eta=(beta a) / 2$ 满足
$ eta^2+xi^2=(m V_0 a^2) / (2 hbar^2) $
/ 偶宇称态: $xi tan(xi)=eta$
基态宇称为偶
/ 奇宇称态: $-xi cot(xi)=eta$
在$V_0 a^2>=(pi^2 hbar^2) / (2m)$时才可能出现最低的奇宇称能级
$ E_n=(2hbar^2) / (m a^2)xi^2 $
== 一维有限高方势垒
$ V(x)=cases(V_0 &"if" 0<x<a, 0 &"elsewhere") $
取波函数$ psi(x)=cases(e^(i k x)+R e^(- i k x) &"if" x<0, S e^(i k x) &"if" x>0) $
透射系数为
$ T=|S|^2=(1+1 / (((4E) / V_0)(1-E / V_0))sinh^2(kappa a))^(-1)\ "where" kappa=sqrt(2m(V_0-E)) / hbar $
在 $kappa a>>1$的情况下,
$ T=(16E(V_0-E)) / V_0^2 e^(-(2a) / hbar sqrt(2m(V_0-E))) $
反射系数为
$ |R|^2+|S|^2=1 $
== 一维$delta$势垒
$ V(x)=gamma delta(x)\ -hbar^2 / (2m) dv(psi, x, 2)=(E-gamma delta(x)) psi $
在Schödinger方程的奇点$x=0$处$, psi''$不存在, $psi'$不连续,对Schödinger方程积分可得*跃变条件*
$ psi'(0^+)-psi'(0^-)=(2m gamma) / hbar^2 psi(0) $
$
  psi(x)=cases(e^(i k x)+R e^(-i k x) &"if" x<0, S e^(i k x) &"if" x>0) \
  "where"
  k=sqrt(2m E) / hbar
$
由连续性与跃变条件有
$
  S&=1 / (1+(i m gamma) / (hbar^2 k))\ R&=S-1=- (i m gamma) / (hbar^2 k) 1 / (1+(i m
  gamma) / (hbar^2
  k))
$
$ T&=|S|^2=1 / (1+(m gamma^2) / (2hbar^2 E))\ |R|^2&+|S|^2=1 $
特征长度为$L=hbar^2 / (m gamma)$,特征能量为$E=(m gamma^2) / hbar^2$
== 一维谐振子
$ V(x)=1 / 2 k x^2 $
#figure(
  grid(
    columns: 2,
    column-gutter: 5%,
    image("harmonic-oscillator-1.png"), image("harmonic-oscillator-2.png"),
  ),
  caption: [一维谐振子本征态],
)
=== 幂级数法
薛定谔方程表示为
$
  (-hbar^2 / (2m)dv(d, x, 2)+1 / 2 k x^2)psi=E psi \ ==> dv(
    psi, xi,
    2
  )+(lambda-xi^2) psi=0 \ "where" omega=sqrt(k / m), lambda=(2E) / (hbar omega), xi=x
  sqrt((m omega) / hbar)
$
解为
$
  E_n&=(n+1 / 2)hbar omega \ psi_n (x)&=((m omega) / (pi hbar))^(1 / 4) 1 / sqrt(
    2^n
    n!
  )H_n (xi) e^(-xi^2 / 2) \ "where"& H_n (x)=(-1)^n e^(x^2) dv(, x, n) e^(-x^2)
$
#thm("谐振子波函数的递推公式")[$ x psi_n=sqrt(hbar / (m omega))(sqrt(n / 2)psi_(n-1)+sqrt((n+1) / 2)psi_(n+1)) $]
=== 升降算符法
参考 _Modern Quantum Mechanics 3rd edition_@sakurai_modern_2020
$ H=p^2 / (2m)+(m omega^2x^2) / 2 $
定义3个算符
$
  a &=sqrt((m omega) / (2 hbar))(x+ (i p) / (m omega)) "annihilation operator"\
  a^dagger&=sqrt((m omega) / (2 hbar))(x- (i p) / (m omega)) "creation operator"\
  N &=a^dagger a
$
可以得到
$ &[a,a^dagger]=1 / (2hbar)(-i[x,p]+i[p,x])=1\ &a^dagger a=H / (hbar omega)-1 / 2 $
$ H=hbar omega(N+1 / 2) $
将$N$的本征值记为$n$,即$N ket(n)=n ket(n)$,则有
$ H ket(n)&=(n+1 / 2)hbar omega ket(n)\ E_n&=(n+1 / 2)hbar omega $
另外
$ &[N,a]=-a \ &[N,a^dagger]=a^dagger $
升降算符的名称来源于
$
  N a^dagger ket(n)&=([N,a^dagger]+a^dagger N) ket(n)=(n+1) a^dagger ket(n) \ N
  a ket(n) &=([N,a]+a N) ket(n)=(n-1) a ket(n)
$ <an-cr-op>
从而$a^dagger ket(n)$和$a ket(n)$也是$N$的本征态 从@an-cr-op 可发现$ a ket(n)=&c ket(n-1)==>
\ &braket(n, a^dagger a, n)=|c|^2=1=braket(n, N, n)=n $ <an-cr-csqure-n>
人们一般取$c$为实数且$c>0$,对$a^dagger$也如此操作,最后有$ a ket(n)&=sqrt(n)ket(n-1)\ a^dagger
ket(n) &=sqrt(n+1)ket(n+1) $
注意到@an-cr-csqure-n 中蕴含$n>=0$,即$N$为正定厄米算符,可证明$n$均为整数,且最小的本征值$n_0=0$. 从而谐振子基态能量为$ E_0=1 / 2 hbar omega $
为得到所有的本征态,从基态$ket(0)$出发,反复作用产生算符$a^dagger$,有$ ket(n)=1 / sqrt(n!)(a^dagger)^n
ket(0) $
若想得到本征态在坐标表象下的表示,如$psi_0 (x)=braket(x, 0)$,可以借助$a$的本征方程
$ a ket(0)=0 $
即解有关$psi_0 (x)$的微分方程
$ braket(x, sqrt((m omega) / (2 hbar))(x+ (i p) / (m omega)), 0)=0 $
解得归一化波函数$ psi_0 (x)=((m omega) / (pi hbar))^(1 / 4) e^(-(m omega) / (2hbar)x^2) $
对于一般的$n$,利用$a^dagger$可得
$
  braket(x, n)=&1 / sqrt(n!)braket(x, (a^dagger)^n, 0)\ =&1 / sqrt(2^n n!) ((m
    omega) / (pi hbar))^(1 / 4) \ &(sqrt((m omega) / hbar)x-sqrt(hbar / (m omega))dv(, x))^n
  e^(-(m omega) / (2hbar)x^2)
$
#exmp[证明一维谐振子的能量本征态$ket(n)$的$expval(x^2)$为$ expval(x^2)_ket(n)=(n+1 / 2) hbar / (m
  omega) $]
= 守恒量与对称性
== 守恒量
#thm("Ehrenfest")[若力学量$A$不显含时间,有$ dv(, t)expval(A)=frac(1, i hbar)expval([A,H]) $] <ehrenfest>
#proof[考虑力学量$A(t)$在任意$ket(psi(t))$上的演化,可得$ dv(, t) expval(A)=expval(
    pdv(
      A,
      t
    )
  )+1 / (i hbar)expval([A,H]) $此外$A$不显含时间,有$pdv(A, t)=0$.]
#thm[若力学量$A$不显含时间,且$[A,H]=0$,则$A$在任何$ket(psi(t))$下的平均值与概率分布均不变.]
#proof[平均值不变由@ehrenfest 说明,概率分布的证明如下

  取包含$A,H$在内的力学量完全集,将任何态$ket(psi)$用完全集的共同本征态${ket(psi_k)}$展开
  $ ket(psi(t))=sum_k a_k (t) ket(psi_k) $
  其中$a_k (t)=braket(psi_k, psi(t))$
  现在考虑概率的变化
  $
    dv(, t) abs(a_k (t))^2=dv(a_k^*, t)a_k + a_k^* dv(a_k, t)
  $由于$ dv(
    a_k^*,
    t
  )&=-1 / (i hbar)braket(psi, H, psi_k)=-E_k / (i hbar)a_k^* \ dv(a_k, t)&=E_k / (i
  hbar)a_k $因此$dv(, t) abs(a_k (t))^2=0$.]
#exmp[中心力场中的守恒量为${H,va(l)^2,l_z}$.]
#exmp[自由粒子的态可以用${p_x,p_y,p_z}$标记,对应能量的简并度一般是无穷大.]
#thm("Feynman-Hellmann")[若系统哈密顿量含有某参数$lambda$,$E_n$为哈密顿量的本征值,相应归一化本征态(束缚态)为$ket(psi_n)$,有$ pdv(
    E_n,
    lambda
  )=expval(pdv(H, lambda), psi_n) $]
#exmp[证明一维谐振子的能量本征态$ket(n)$的$expval(x^2)$为$ expval(x^2)_ket(n)=(n+1 / 2) hbar / (m
  omega) $]
#exmp[证明一维谐振子的能量本征态满足$ expval(T)_ket(n)=expval(V)_ket(n)=1 / 2 E_n $]
#thm("位力(virial)")[处于势场$V(va(r))$中的粒子,动能算符在定态上的平均值为$ expval(T)=1 / 2 expval(va(r) dprod grad V) $]
#coll[当势能为坐标的$n$次齐次函数时,有$ expval(T)=n / 2 expval(V) $]
== 力学量完全集
#def("CSCO")[彼此独立,互相对易的厄米算符的共同本征态如果能唯一确定体系的状态,那么这组力学量就称为*对易力学量完全集*(complete set of
  commuting
  observables).]
#def("CSCCO")[如果对易力学量完全集中包含哈密顿量,并且哈密顿量是守恒量(不显含时间),那么该完全集中所有力学量都是守恒量,这样的完全集称为*对易守恒量完全集*(complete
  set of commuting conserved observables).]
== Schödinger图像与Heisenberg图像 <heisgenberg-pic>
#def("Schödinger图像")[$ket(psi(t))$随时间演化,其变化遵守Schrödinger方程,力学量算符(不显含时间)与时间无关,这种描述方式称为Schrödinger图像.]
#def("Heisenberg图像")[$ket(psi)$不随时间变化,力学量算符$A(t)$随时间演化,这种描述方式称为Heisenberg图像#footnote[除了@heisgenberg-pic
    以外,其他部分均采用Schrödinger图像].]
#thm("Heisenberg方程")[算符$A(t)$随时间的变化为$ dv(, t)A(t)=1 / (i hbar)[A(t),H] $]
== 相互作用图像
相互作用图像介于Schrödinger图像和Heisenberg图像之间,在用微扰论来处理问题时有广泛的应用.

== 对称性变换
#def("对称性变换")[称满足以下条件的幺正算符$Q$为体系的对称性变换$ [Q,H]=0 $$Q$必须是幺正的,否则概率模不守恒]
#thm[对于幺正变换对称性,存在相应的守恒量.]
#def("无穷小变换")[对于连续变换,考虑$epsilon->0^+$$ Q=I+i epsilon F $其中$F$必须是厄米的.称这样的变换$Q$为无穷小变换.] <infinitesimal-trans>
#def("无穷小算符")[称@infinitesimal-trans 当中的$F$为变换$Q$的无穷小算符.$F$会给出一个守恒量.]
#def("空间反射变换")[对态和算符都可以分别定义空间反射变换$P$$ P psi(va(x))=psi(-va(x)) $$
    P F(va(x),va(p)) P^dagger=F(-va(x),-va(p))
  $]
#def("空间反射对称性")[若哈密顿量满足$[P,H]=0 <==> P H P^dagger=H$,那么系统具有空间反射对称性.]
#thm[具有空间反射对称性的系统宇称守恒.]
#def("空间平移对称性")[若哈密顿量满足$[D,H]=0 <==> D H D^dagger=H$,那么系统具有空间平移对称性.]
#thm[具有空间平移对称性的系统动量守恒.]
#def("空间转动对称性")[若哈密顿量满足$[R,H]=0 <==> R H R^dagger=H$,那么系统具有空间转动对称性.]
#thm[具有空间转动对称性的系统角动量守恒.]
#def("时间平移对称性")[若哈密顿量满足$[D,H]=0 <==> D H D^dagger=H$,那么系统具有时间平移对称性.]
#thm[具有时间平移对称性的系统哈密顿量不显含时间,能量守恒.即系统状态随时间的演化规律与时间零点的选取无关,具有时间均匀性.]
== 全同粒子体系与交换对称性
#def("全同粒子")[经典中,由于粒子的性质和状态可以连续变化,谈不上两个粒子真正全同.但实际上粒子是量子化的,属于同一类(内禀属性即静质量,电荷,自旋,磁矩,寿命,
  内部结构等相同)的粒子称为全同粒子.]
#def("交换算符")[$
    P_(i j)&psi(dots, q_i, dots, q_j, dots, t)\ &=psi(dots, q_j, dots, q_i, dots, t)
  $] <exchange-operator>
#thm[交换算符是厄米的.]
#thm[交换算符是幺正的.]
#pst("全同性假设")[全同粒子体系中,可观测量对任何两个粒子交换是不变的,即任意两个全同粒子的交换,都不改变体系的物理状态.] <identity-postulate>
#coll("全同粒子体系波函数的性质")[根据@exchange-operator 以及@identity-postulate,全同粒子体系的波函数$psi$满足$ P_(i j) psi&=C psi \ C&=plus.minus 1 $]
#thm("全同粒子的统计性不变")[全同粒子系的波函数交换对称性是不随时间变化的,即Bose统计或Fermi统计是不变的.]
#thm([$N$个全同玻色子体系的波函数])[$
    Psi_(n_1 dots n_N)^S (q_1,dots,q_N)&\ =sqrt((product_i n_i !) / N!)sum_P
    &P(psi_k_1 (q_1) dots psi_k_N (q_N))
  $]
#def("反对称化算符")[$
    cal(A)=sqrt(1 / N!)sum_P delta_P P
  $这里$P$代表$N$个粒子的一种排列,$delta_P$在$P$是经过奇数个对换得到时为$-1$,偶数个对换为$+1$]
#thm([$N$个全同费米子体系的波函数])[$
    Psi_(n_1 dots n_N)^A &(q_1,dots,q_N)\ =&sqrt(1 / N!) mdet(
      psi_k_1 (q_1), dots, psi_k_1 (q_N); dots.v, , dots.v; psi_k_N (q_1), dots, psi_k_N (q_N)
    ) \ =&cal(A) psi_k_1 (q_1) dots psi_k_N
    (q_N)
  $]
#image("whatparticle.png")
#thm("Pauli不相容原理")[不允许有两个及以上全同的费米子处于同一个单粒子态]
#exmp[对3个全同粒子组成的系统,如果可能的单粒子态有3种.那么Boltzmann统计(经典统计),Bose统计,Fermi统计下,系统的可能态数目分别为27,10,1.#footnote[一般来说,对于3个及3个以上的全同粒子体系,Bose统计与Fermi统计的可能态数目总是少于Boltzmann统计.因为后者包含有一些没有对称性或混杂对称性的状态.]]
== 二次量子化方法
对全同粒子编号本来就是多余的,粒子填布数表象描述全同粒子体系的量子态更为方便.

在同一势场中运动的全同粒子体系的态可以用单粒子态上的粒子占有数表示
$ ket(n_1 n_2 n_3 dots)=ket(n_1)ket(n_2)ket(n_3)dots $
即在$ket(psi_1),ket(psi_2),ket(psi_3),dots$上分别有$n_1,n_2,n_3,dots$个粒子.

= 中心力场中的本征问题
#thm("Sommerfeld量子化条件")[$ integral.cont p dd(q)=(n+1 / 2) $]
中心力场中势函数的特点:
- $V=V(r)$,具有转动对称性
- $[va(l),H]=0$,轨道角动量守恒
中心力场中的力学量完全集一般选为${H,va(l)^2,l_z}$
#thm("中心力场中运动粒子的哈密顿量")[$
    H&=p^2 / (2mu)+V(r)\ &=p_r^2 / (2mu)+va(l)^2 / (2 mu r^2)+V(r)\ &=-hbar^2 (pdv(, r, 2)+2 / r pdv(, r))+va(l)^2 / (2mu r^2)+V(r)
  $]
#thm("中心力场中能量本征方程")[一般将势函数分离变量为$ Psi(r, theta, phi.alt)=R(r)Y_(l m) (theta,phi.alt) $令$chi(r)=r R(r)$,有$ chi_l ''+((2mu) / hbar^2 (E-V)-(l(l+1)) / r^2)chi_l =0 $]
== 无限深球方势阱
$ V(r)=cases(0 &"if" r<a, infinity &"if" r>a) $
/ s态:
径向方程为$ chi_0 ''+((2mu) / hbar^2 (E-V))chi_0 =0 $
边界条件为$chi_0 (0)=chi_0 (a)=0$

在势阱内有$ E_(n_r 0)=(pi^2 hbar^2(n_r+1)^2) / (2mu a^2) "," n_r=0,1,2,dots $
归一化波函数为$ chi_(n_r 0)=sqrt(2 / a)sin ((n_r+1)pi r) / a $
/ 非s态:
径向方程为
$ R_l ''+2 / r R_l '+(k^2-(l(l+1)) / r^2)R=0\ "where" k=sqrt(2mu E) / hbar $
引入无量纲变量$rho=k r$有$ dv(R_l, rho, 2)+2 / rho dv(R_l, rho)+(1-(l(l+1)) / rho^2)R_l=0 $
由于在球方势阱内,这个球Bessel方程的解应取为$R_l (r)prop j_l (k r)$.

记$j_l (k a)$的根依次为$xi_(n_r l)$,那么能量本征值为$ E_(n_r l)&=hbar^2 / (2mu a^2) xi_(n_r l)\ n_r&=0,1,2,dots $
径向本征函数为$ R_(n_r l) (r)&=C_(n_r l)j_l (k_(n_r l) r)\ C_(n_r l)&=sqrt(-2 / a^3 (j_(l+1) (k_(n_r l)a)) / (j_(l-1)(k_(n_r l)a))) $
若取$a -> infinity$,相当于自由粒子,通常采用如下的$delta$归一化$ R_(k l)=sqrt(2 / pi)k j_l (k r) $
== 三维各向同性谐振子
$ V(r)=1 / 2 mu omega^2 r^2 $
能量本征值为$ E_N=(N+3 / 2)hbar omega\ N=2n_r+l\ n_r,l=0,1,2,dots $
简并度为$ f_N=1 / 2(N+1)(N+2) $
径向本征函数为$ R_(n_r l) (r)=&a^(l+3\/2)sqrt((2^(l+2-n_r)(2l+2n_r+1)!!) / (sqrt(pi)n_r !((2l+1)!!)^2))\ &r^l e^(-a^2r^2\/2)F(-n_r,l+3 / 2,a^2r^2) $
如果在直角坐标系中求解,这两套本征态通过幺正变换联系起来$ phi_(01m)=sum_(n_x n_y n_z)psi_(n_x n_y n_z) integral psi^*_(n_x n_y n_z) phi_(01m) dd(tau) $$
  mat(phi_(011); phi_(01-1); phi_(010))=mat(-1 / sqrt(2), -i / sqrt(2), 0; 1 / sqrt(2), -i / sqrt(2), 0; 0, 0, 1) mat(psi_(100); psi_(010); psi_(001))
$
== 氢原子
化为单体问题后有$ V(r)=-e^2 / r $
#def("Bohr半径")[$a=hbar^2 / (mu e^2)$]
能量本征值为$ E_n&=-(mu e^4) / (2 hbar^2) 1 / n^2=-e^2 / (2a)1 / n^2\ n&=n_r+l+1\ n_r&=0,1,2,dots $
径向本征函数为$ R_(n l) (r)=2 / (a^(3\/2)n^2(2l+1)!)&sqrt(((n+1)!) / (n-l-1)!)\ &e^(-xi\/2)xi^l F(-n_r,2l+2,xi)\ & "where" xi=(2r) / (n a) $

本征函数为$ psi_(n l m)=R_(n l) (r)Y_(l m)(theta, phi.alt) $

简并度为$ f_n=sum_(l=0)^(n-1) (2l+1)=n^2 $
=== 电流分布和磁矩
统计意义上,电子的电流密度(绕z轴的环电流密度)为$ va(j)&=(i e hbar) / (2mu) (psi^* grad psi-psi grad psi^*)\ &=-(e hbar m) / mu 1 / (r sin theta) abs(psi_(n l m))^2 vu(e_phi.alt) $
总的磁矩为$ va(M)=&-(e hbar m) / (2mu c) vu(z) integral abs(psi_(n l m))^2 dd(tau)\ =&-(e hbar m) / (2mu c)vu(z) $
#def("Bohr磁子")[$ mu_B=(e hbar) / (2mu c) $]
#def("g因子")[$ g=M_z / (m hbar)=-e / (2mu c) $]
=== 概率密度
#figure(image("hydrogen.png", width: 90%), caption: [氢原子波函数])
$
  R_(10)&=2 / a^(3\/2)e^(-r\/a) \ R_(20)&=1 / (sqrt(2)a^(3\/2))(1-r / (2a))e^(-r\/2a)\ R_(21)&=1 / (2sqrt(6)a^(3\/2))r / a e^(-r\/2a)\ R_(30)&=2 / (3sqrt(3)a^(3\/2))(1-(2r) / (3a)+2 / 27 r^2 / a^2)e^(-r\/3a)
$

=== 类氢离子
关于氢原子的结论,在类氢离子($isotope("He")^+,isotope("Li")^(++),dots$)上也适用,只需将核电荷数$+e$换成$+Z e$,约化质量换成相应的$mu$.其能级公式为
$ E_n=-(mu e^4) / (2 hbar^2) Z^2 / n^2=-e^2 / (2 a)Z^2 / n^2 $
= 角动量

北大曹庆宏老师的#link(
  "https://faculty.pku.edu.cn/caoqinghong/zh_CN/zdylm/11906/list/index.htm",
)[讲义草稿]非常值得阅读学习.

= 自旋

= 微扰论
== 非简并围绕论
== 简并微扰论

= 含时微扰与跃迁
== 含时体系的量子跃迁的微扰论
== 光的吸收与辐射的半经典理论

= 散射

#set text(
  lang: "en",
  region: "us",
)

#bibliography("main.bib", style: "american-physics-society")
