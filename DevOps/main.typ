#import "../note_zh.typ": *
#show: conf.with(
  title: "DevOps笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= GitHub Actions
== 代码检出
默认的检出方式是浅克隆,即只包含最新提交,如果需要根据提交历史生成修改变更等,应当禁用浅克隆:
```yml
- uses: actions/checkout@v4
  with:
    fetch-depth: 0
```
== 自托管运行器
`~/.config/systemd/user/github-actions-runner.service`配置例子:
```
[Unit]
Description=GitHub Actions Runner Service
After=network-online.target

[Service]
ExecStart=%h/actions-runner/run.sh
WorkingDirectory=%h/actions-runner
Restart=on-failure
RestartSec=5
Environment="PATH=%h/.local/bin:/usr/local/bin:/usr/bin:/bin"

[Install]
WantedBy=default.target
```
== 参考
- #link("https://www.feldera.com/blog/the-pain-that-is-github-actions")[The Pain That is Github Actions]
