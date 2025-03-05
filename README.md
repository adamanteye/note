# Adamanteye's Note

![build](https://github.com/adamanteye/note/actions/workflows/build.yml/badge.svg)

笔记和作业集合.

除了我自己的内容, 也有朋友的贡献.

其他课程项目:

- [adamanteye/rusty_query: 2024 年秋季学期数据库系统概论大作业](https://github.com/adamanteye/rusty_query)
- [adamanteye/veloquent-core: 2024 年软件工程即时通讯系统大作业后端](https://github.com/adamanteye/veloquent-core)
- [adamanteye/mkl25-keyer: 2024 年数字电路与嵌入式系统大作业](https://github.com/adamanteye/mkl25-keyer)
- [adamanteye/cordle: 2023 年夏计算机程序设计基础（20740102）Wordle 大作业](https://github.com/adamanteye/cordle)
- [adamanteye/dsa: 2023 年数据结构与算法](https://github.com/adamanteye/dsa)

没填完的坑 (以后再写叭):

- [adamanteye/csapp-lab: CS:APP Labs](https://github.com/adamanteye/csapp-lab)

## 编译要求

- 软件包
  - ~~`xelatex`: `XeTeX 3.141592653-2.6-0.999995 (TeX Live 2023)`~~
  - `typst`: `typst 0.13.0 (8dce676d)`
- ~~LaTex 模板~~
  - ~~[THUCOURSEWORK：清华大学课程作业模板](https://github.com/zhaofeng-shu33/THU-coursework-template)~~
- 字体
  - [LXGW WenKai TC](https://github.com/lxgw/LxgwWenkaiTC)
  - [Source Han Serif Region Specific Subset OTFs Simplified Chinese (简体中文)](https://github.com/adobe-fonts/source-han-serif/releases/tag/2.002R)
  - [lxgw/LxgwBright-Code: A merged font of Monaspace Argon and LXGW WenKai.](https://github.com/lxgw/LxgwBright-Code)
- Typst 库
  - [physica](https://github.com/Leedehai/typst-physics)
  - [ctheorems](https://github.com/sahasatvik/typst-theorems)
  - [cetz](https://github.com/cetz-package/cetz)
  - [unify](https://github.com/ChHecker/unify)
  - [codly](https://github.com/Dherse/codly)
  - [codly-languages](https://github.com/swaits/typst-collection)

## 最小化静态资源

使用 [343dev/optimizt: CLI image optimization tool](https://github.com/343dev/optimizt) 有损压缩图片:

```sh
optimizt .
```

## 删除不再使用的静态资源

参考[从存储库删除敏感数据](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository).
