#import "../../../note_zh.typ": *
#show: conf.with(
  title: "Bash编程笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)

使用Bash严格模式,参考#link("http://redsymbol.net/articles/unofficial-bash-strict-mode/")[Bash Strict Mode]:
```sh
set -euo pipefail
```

Bash使用`int64`.
#link("https://askubuntu.com/questions/385528/how-to-increment-a-variable-in-bash")[how-to-increment-a-variable-in-bash]介绍了Bash当中定义整数以及迭代的办法.

`awk`可以进行浮点数计算:
```sh
awk "BEGIN {printf \"%.2f\n\", 1000 / 3600}"
```

`echo`可以输出二进制数据:
```sh
echo -e -n "\x48\x65\x6c\x6c\x6f" > hello.txt
```

`cut`可以用来提取文本中的字段:
```sh
echo "john,21" | cut -d "," -f 1
```

#link("https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel")[Get the source diretory of a bash script]:

```sh
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
```
