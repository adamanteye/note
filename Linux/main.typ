#import "../note_zh.typ": *
#show: conf.with(
  title: "Linux 使用笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)

= 软件包构建

== man

#link("https://git.sr.ht/~sircmpwn/scdoc")[scdoc]自定义了与Markdown相近的语法,可以用来生成man手册页.
```sh
scdoc < ls.1.scd > ls.1
gzip ls.1
```
