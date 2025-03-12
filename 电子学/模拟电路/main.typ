#import "../../note_zh.typ": *
#show: conf.with(
  title: "模拟电路笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 半导体
== 本征半导体
常用的半导体材料有Si, Ge.
本征半导体是单晶体.
导体导电时的载流子为电子, 而本征半导体的电子和空穴均导电,电流是两种电流之和.

本征半导体载流子的浓度是环境温度的函数:
$ n_i=p_i=K_1 T^(3 / 2)exp(-E_"GO"/(2k T)) $
/ $E_"GO"$: 热力学零度时破坏共价键需要的能量,称为*禁带宽度*.
  - 硅:$E_"GO"=qty("1.21","eV")$
  - 锗:$E_"GO"=qty("0.785","eV")$
== N型半导体
在硅中掺入五价元素,多出一个电子.
N型半导体靠自由电子导电
== P型半导体
在硅中掺入三价元素.
P型半导体靠空穴导电.
== PN结
/ 正向接法: 正极接P端.外电场将载流子推向空间电荷区,削弱内电场,扩散加剧.形成正向电流, PN结导通
/ 反向接法: 正极接N端,外电场使空间电荷区变宽,加剧漂移,形成反向电流.

PN结的电流方程:
$ i=I_S (e^((e u) / (k T))-1) = I_S (e^(u / U_T)-1) $
常温下$U_T=qty("26","mV")$,称为温度的电压当量.

加反向电压,在$u$超过$U_"BR"$后会发生反向击穿,都可能对PN结造成永久损坏:
/ 奇纳击穿: 高掺杂,所以耗尽层窄,反向电压在耗尽层形成很强的电场,破坏共价键,产生电子空穴对.
/ 雪崩击穿: 耗尽层的电场使得少子加快漂移速度,不断撞出价电子,载流子雪崩式倍增.

PN结的电容是势垒电容与扩散电容之和:
$ C_j=C_b+C_d $
面积小的,结电容在$qty("1","pF")$左右,面积大的在数百$unit("pF")$.对于高频信号才需考虑结电容的影响.
== 二极管
二极管是用外壳和电极引线封装的PN结.
P区引出的电极是阳极, N区引出的电极是阴极.

温度每上升10度,二极管反向电流增大约一倍.
== 晶体三极管
也称#link("https://zh.wikipedia.org/zh-cn/%E5%8F%8C%E6%9E%81%E6%80%A7%E6%99%B6%E4%BD%93%E7%AE%A1")[双极性晶体管(bipolar transistor)],全称双极性结型晶体管(bipolar junction transistor, BJT),俗称三极管.
=== 主要参数
/ 最大整流电流$I_F$: 长期运行时允许通过的最大正向平均电流,如超过会因结温过高而烧坏
/ 最高反向工作电压$U_R$: 外加最大的反向电压,超过时二极管可能因为反向击穿而损坏,通常$U_R$为$U_"BR"$的一半
/ 反向电流$I_R$: 二极管未发生击穿时的反向电流,对温度非常敏感,越小说明二极管的单向导电性越好.
/ 最高工作频率$f_M$: 上限截止频率,超过后因为结电容的作用,二极管将不再体现单向导电性
= 运算放大器
= 行话
== Rail to Rail
由电源单元提供的电源线称为电源轨,从电源线的最大电压(VCC)到其最小电压(GND或最小负电压，VEE)的整个范围称为轨对轨.
参考:
- #link("https://www.zhihu.com/question/517783284/answer/2724209674")[1.8V、3.3V、5V、12V等常用电压等级是如何确立的？ - 知乎]
