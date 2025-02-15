#import "../note_zh.typ": *
#show: conf.with(
  title: "德语笔记",
  author: "杨哲涵",
)
= 名词,定冠词,代词
== 名词

德语名词可分为三类:
/ 强变化名词: 大部分阳性名词,全部中性名词
/ 弱变化名词: 一部分阳性名词
/ 阴性名词:

=== 强变化名词
/ 单数: 第二格 `-es` 或 `-s`
/ 复数: 第三格 `-n` 或 `-en`, 如果词尾是 `-s`, 则不变
=== 弱变化名词
/ 单数:

  - 第二格 `-en`, 以元音结尾 `-n`
  - 第三格 `-en`, 以元音结尾 `-n`
  - 第四格 `-en`, 以元音结尾 `-n`
/ 复数: 全部格 `-n` 或 `-en`
=== 阴性名词
/ 单数: 均不变格
/ 复数: 第三格 `-n`
== 代词
#figure(
  table(
    align: left,
    columns: 4,
    table.hline(),
    table.header([N.], [G.], [D.], [A.]),
    table.hline(),
    [ich], [mein], [mir], [mich],
    [du], [dein], [dir], [dich],
    [er], [sein], [ihm], [ihn],
    [sie], [ihr], [ihr], [sie],
    [es], [sein], [ihm], [es],
    [wir], [unser], [uns], [uns],
    [ihr], [euer], [euch], [euch],
    [sie], [ihr], [ihnen], [sie],
    [Sie], [Ihr], [Ihnen], [Sie],
    table.hline(),
  ),
  caption: "人称代词",
)

== 冠词
#figure(
  table(
    align: left,
    columns: 5,
    table.hline(),
    table.header([], [m], [n], [f], [pl]),
    table.hline(),
    [N.], [der], [das], [die], [die],
    [G.], [des], [des], [der], [der],
    [D.], [dem], [dem], [der], [den],
    [A.], [den], [das], [die], [die],
    table.hline(),
  ),
  caption: "定冠词",
)

#figure(
  table(
    align: left,
    columns: 5,
    table.hline(),
    table.header([], [m], [n], [f], [pl]),
    table.hline(),
    [N.], [ein], [ein], [eine], [],
    [G.], [eines], [eines], [einer], [],
    [D.], [einem], [einem], [einer], [],
    [A.], [einen], [ein], [eine], [],
    table.hline(),
  ),
  caption: "不定冠词",
)

#figure(
  table(
    align: left,
    columns: 6,
    table.hline(),
    table.header([], [], [m], [n], [f], [pl]),
    table.hline(),
    table.cell(rowspan: 4)[ich], [N.], [mein], [mein], [meine], [meine],
    [G.], [meines], [meines], [meiner], [meiner],
    [D.], [meinem], [meinem], [meiner], [meinen],
    [A.], [meinen], [mein], [meine], [meine],
    table.hline(),
    table.cell(rowspan: 4)[du], [N.], [dein], [dein], [deine], [deine],
    [G.], [deines], [deines], [deiner], [deiner],
    [D.], [deinem], [deinem], [deiner], [deinen],
    [A.], [deinen], [dein], [deine], [deine],
    table.hline(),
    table.cell(rowspan: 4)[er, es, man], [N.], [sein], [sein], [seine], [seine],
    [G.], [seines], [seines], [seiner], [seiner],
    [D.], [seinem], [seinem], [seiner], [seinen],
    [A.], [seinen], [sein], [seine], [seine],
    table.hline(),
    table.cell(rowspan: 4)[sie], [N.], [ihr], [ihr], [ihre], [ihre],
    [G.], [ihres], [ihres], [ihrer], [ihrer],
    [D.], [ihrem], [ihrem], [ihrer], [ihren],
    [A.], [ihren], [ihr], [ihre], [ihre],
    table.hline(),
    table.cell(rowspan: 4)[wir], [N.], [unser], [unser], [unsere], [unsere],
    [G.], [unseres], [unseres], [unserer], [unserer],
    [D.], [unserem], [unserem], [unserer], [unseren],
    [A.], [unseren], [unser], [unsere], [unsere],
    table.hline(),
  ),
  caption: "物主冠词",
)

= 形容词
#set heading(offset: 1)
#include "形容词.typ"
#set heading(offset: 0)
= 动词
#set heading(offset: 1)
#include "动词.typ"
#set heading(offset: 0)
#include "动词表.typ"
= 数词
#set heading(offset: 1)
#include "数词.typ"
#set heading(offset: 0)
= 阅读和翻译练习
#include "阅读和翻译练习.typ"
