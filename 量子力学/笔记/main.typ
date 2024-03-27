#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "zh",
  region: "cn",
)
#let title = [量子力学笔记]
#set document(title: [#title])
#set heading(numbering: "1.")
#show link: underline
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))
#import "@preview/physica:0.9.2": *
#set math.equation(numbering: "(1)", number-align: bottom + right, supplement: [式.])

#align(center, text(17pt)[
  *#title*
])

#show: rest => columns(2, rest)

= 数学速查
== Levi-Civita symbol
参考#link("https://zh.wikipedia.org/wiki/%E5%88%97%E7%B6%AD-%E5%A5%87%E7%B6%AD%E5%A1%94%E7%AC%A6%E8%99%9F")[中文维基页面]
$ epsilon_(i j k)epsilon_(l m n)=mdet(
  delta_(i l), delta_(i m), delta_(i n);delta_(j l), delta_(j m), delta_(j n);delta_(k l), delta_(k m), delta_(k n)) $ <levi-det>
@levi-det 对于一般的$n$也成立
$ sum_(i=1)^3 epsilon_(i j k) epsilon_(i m n)=delta_(j m) delta_(k n)-delta_(j n)delta_(k m) $
$ (va(A)cprod va(B))_k=sum_(i j) epsilon_(k i j) A_i B_j $
== 球坐标系
$ grad=vu(r)pdv(,r)+1/r vu(theta)pdv(,theta)+1/(r sin theta)vu(phi.alt)pdv(,phi.alt) $
$ div va(u)=1/r^2 pdv(,r)(r^2 u_r)+1/(r sin theta)pdv(,theta)(sin theta u_theta)\ +1/(r sin theta)pdv(,phi.alt)u_phi.alt $
== 爱因斯坦求和约定
采用爱因斯坦求和约定,可以让式子更加简洁
$ (vb(A)cprod vb(B))^k=epsilon^(k i j)A_i B_j $
== 泊松括号
$ [A,B C]=B[A,C]+[A,B]C $
$ [A B,C]=A[B,C]+[A,C]B $
= 算符
/ 厄米伴随: $A$的厄米伴随定义为$A^dagger$
$ A ket(psi)=bra(psi) A^dagger $
/ 厄米算符: 称$A$为厄米算符当且仅当
$ A=A^dagger <==> braket(psi, A, phi)=(braket(phi, A, psi))^* \ "for arbitray" psi,phi $
== 常见算符表示
$ va(p)=-i hbar grad $
$ va(p)^2=- hbar^2 div grad $
$ va(l)=va(r)cprod va(p) $
$ va(l)cprod va(l)=i hbar va(l) $
$ va(l)^2=l_z^2+l_y^2+l_z^2 $
$ va(p_r)=1/2(vu(r)dprod va(p)+va(p)dprod vu(r))=-i hbar(pdv(,r)+1/r) \ =- hbar^2 1/r^2 pdv(,r,2) r^2 pdv(,r) $
$ va(p)^2=1/r^2va(l)^2+va(p_r)^2 $
== 对易关系
$ [x_alpha,p_beta]=i hbar delta_(alpha beta) $
$ [l_alpha,x_beta]=epsilon_(alpha beta gamma)i hbar x_gamma $
$ [l_alpha,p_beta]=epsilon_(alpha beta gamma)i hbar p_gamma $
$ [l_alpha,l_beta]=epsilon_(alpha beta gamma)i hbar l_gamma $
$ [va(r),H]=(i hbar)/m va(p) $
== 不同表象的转换
$ braket(p, x)=1/sqrt(2pi hbar)e^(-i (p x)/hbar) $
== 平均值定理
$ expval(A)_ket(psi)=expval(A, psi) $
= Schödinger方程
/ 含时方程: 系统的演化由哈密顿算符决定
$ i hbar pdv(, t)ket(psi)=H ket(psi) $
/ 定态方程: 哈密顿算符是能量算符
$ H ket(psi)=E ket(psi) $
/ Ehrenfest's Theorem: $ dv(, t)expval(A_ket(psi))=frac(1, i hbar)expval([A,H])_ket(psi) $
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
/ 幂级数法:
薛定谔方程表示为
$ (-hbar^2/(2m)dv(d, x, 2)+1/2 k x^2)psi=E psi \ ==> dv(psi, xi,
2)+(lambda-xi^2) psi=0 \ "where" omega=sqrt(k/m), lambda=(2E)/(hbar omega), xi=x
sqrt((m omega)/hbar)=alpha x $
解为
$ E_n&=(n+1/2)hbar omega \ psi_n&=((m omega)/(pi hbar))^(1/4) 1/sqrt(2^n
n!)H_n(psi) e^(-psi^2/2) \ "where"& H_n(x)=(-1)^n e^(x^2) dv(, x, n) e^(-x^2) $
/ 升降算符法: 参考 _Modern Quantum Mechanics 3rd edition_(Sakurai)
$ H=p^2/(2m)+(m omega^2x^2)/2 $
定义3个厄米算符
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
a ket(n) &=([N,a]+a N) ket(n)=(n-1) a ket(n) $
$a^dagger ket(n)$和$a ket(n)$也是$N$的本征态