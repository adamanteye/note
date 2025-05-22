#import "../../../note_zh.typ": *
#show: conf.with(
  title: "射线源导论作业",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= LEC-3
== 重复Richardson-Dushman的推导过程
Richardson定律为$ J=A T^2 e^(- W / (k T)) $
其中$J$是热发射电流密度,$A$为常数系数,$T$为温度,$k$为玻尔兹曼常数,$W$为材料的功函数.

首先考虑作为费米子的电子的分布规律
$ f_("FD") (E)=1 / (e^((E-E_F)\/(k T))-1) $
其中费米能级
$ E_F=hbar^2 / (2 m_0)((3 pi^2 N) / V)^(2\/3) $
在发生热发射时, $E-E_F>>k T$, Fermi-Dirac分布退化为Boltzmann分布
$ f_"FD" (E) approx f_("B") (E)=e^(-(E-E_F)\/(k T)) $
为了得到热发射电流密度与温度的关系,需要考虑不同速度电子的能量分布,使用自由电子气模型.考虑长宽高分别为$L_x,L_y,L_z$的矩形空间,波函数形式为
$ Psi(x, y, z)=sin(k_x x)sin(k_y y)sin(k_z z) "where" k_alpha L_alpha=pi n_alpha $
在波矢空间($k$空间)中,满足$-N_x <= n_x <= N_x,-N_y <= n_y <= N_y,-N_z <= n_z <= N_z$的$k_x,k_y,k_z$组成的体积为$ V_k=(2pi N_x) / L_x (2pi N_y) / L_y (2pi N_z) / L_z=(2pi)^3 / V N_x N_y N_z $
另外,考虑电子的自旋,1个波矢对应2个电子能态,则$-N_x <= n_x <= N_x,-N_y <= n_y <= N_y,-N_z <= n_z <= N_z$内的电子能态数目为$ S_k=2N_x N_y N_z $
从而$k$空间中,电子能态密度为$ g(k)=1 / (V_k\/S_k)=(2V) / (2pi)^3 $
利用波矢$k$与动量$p$之间的关系$ p=hbar k $
在$va(p)$空间体积元内的电子能态数目为$ dd(S)=(2V) / h^3 dd(p_x)dd(p_y)dd(p_z) $
得到上面的式子后,可以将其与能量建立关系,在非相对论近似下,电子动能可以是$ E=1 / 2m(v_x^2+v_y^2+v_z^2) $
对于速度空间元,对应的电子数目为
$ dd(N)&=f(E)dd(S)\ &=(2m^3) / h^3 e^(E_F\/(k T)) e^(-m(v_x^2+v_y^2+v_z^2)\/(2k T))dd(v_x)dd(v_y)dd(v_z) $
从而速度空间元内的电流密度(只有$z$方向能发射)
$ dd(J)&=e v_z dd(N)\ &=e v_z (2m^3) / h^3 e^(E_F\/(k T)) e^(-m(v_x^2+v_y^2+v_z^2)\/(2k T))dd(v_x)dd(v_y)dd(v_z) $
对$v_x,v_y,v_z$积分后可得总电流密度$J$,其中$v_(z 0)=sqrt(2(E_F+W) / m)$
$
  J&=integral_(-infinity)^(+infinity) dd(v_x) integral_(-infinity)^(+infinity) dd(v_y) integral_(v_(z 0))^(+infinity) dd(v_z) e v_z (2m^3) / h^3 e^(E_F\/(k T)) e^(-m(v_x^2+v_y^2+v_z^2)\/(2k T))dd(v_x)dd(v_y)dd(v_z)\ &=(4pi e m k^2) / h^3 T^2 e^(-W / (k T))\ &= A T^2 e^(-W / (k T))
$
== 如果对热阴极电流密度的稳定性要求优于1%,对其温度稳定性和功函数的变化分别有什么要求?
考虑电流密度对温度与功函数的依赖关系
$ pdv(J, T)=A e^(-W / (k T)) (2T+W / k) $
由于$W / k$远大于$T$,可以近似为
$ dd(J) approx A W / k e^(-W / (k T)) dd(T) $
$ dd(J) / J=W / k 1 / T^2 dd(T) $
类似地有
$ dd(J) / J=-1 / (k T) dd(W) $
在稳定性优于1%的要求下,有
$ abs(dd(T) / T)<=0.01 k / W $
$ abs(dd(W))<=0.01 k T $
== 画出100-2000摄氏度下$isotope("Cu")$, $isotope("Ag")$, $isotope("Au")$, $isotope("W")$, $isotope("La")isotope(B)_6$的电流密度随温度的变化曲线
#grid(
  column-gutter: 2em,
  columns: 2,
  [
    ```py
    import matplotlib.pyplot as plt
    import numpy as np

    materials = ["Cu", "Ag", "Au", "W", "LaB6"]
    work_functions = [4.7, 4.26, 5.1, 4.55, 2.7]
    temp_start = 100
    temp_end = 2000
    temp_step = 1
    temps = np.arange(temp_start, temp_end, temp_step)
    k = 1.38e-23
    e = 1.6e-19
    a = 1.202e6

    for i in range(len(materials)):
        currents = []
        for temp in temps:
            currents.append(a * temp**2 * np.exp(-work_functions[i] * e / (k * temp)))
        currents = np.array(currents) * 1e3
        plt.plot(temps, currents, label=materials[i])

    plt.xlabel("Temperature (K)")
    plt.ylabel("Log of J (mA/m^2)")
    plt.yscale("log")
    plt.legend()
    plt.show()
    ```
  ],
  figure(image("current_vs_temp.png"), caption: ""),
)
