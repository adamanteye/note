#import "../../../note_zh.typ": *
#show: conf.with(
  title: "DevOps笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= Cloudflare
== Tunnel
CF Tunnel可以方便地在中国地区搭建服务.

比如:
```yml
services:
  nginx:
    image: nginx:1.27.5-alpine
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - /srv/:/srv/:ro
    restart: unless-stopped
    networks:
      - tunnel-net

  cloudflared:
    image: cloudflare/cloudflared:latest
    restart: unless-stopped
    command: [ "tunnel", "--no-autoupdate", "run", "--token", "your-token" ]
    depends_on:
      - nginx
    networks:
      - tunnel-net

networks:
  tunnel-net:
```
注意在面板中为服务`http://nginx:80`配置相应的域名.
== Workers and Wrangler
更新wrangler版本时注意查看
#link("https://developers.cloudflare.com/workers/configuration/compatibility-flags/")[Compatibility flags]以了解是否出现兼容性问题.
= GitHub Security
== Dependabot
- #link("https://docs.github.com/zh/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates")[配置 Dependabot 版本更新 - GitHub 文档]
- #link("https://docs.github.com/zh/code-security/dependabot/working-with-dependabot/dependabot-options-reference")[Dependabot 选项参考 - GitHub 文档]
= GitHub Actions
- #link("https://docs.github.com/zh/actions/writing-workflows/workflow-syntax-for-github-actions#onschedule")[GitHub Actions 的工作流语法 - GitHub 文档]
== 代码检出
默认的检出方式是浅克隆,即只包含最新提交,如果需要根据提交历史生成修改变更等,应当禁用浅克隆:
```yml
- uses: actions/checkout@v4
  with:
    fetch-depth: 0
```
== 自托管运行器
`systemd`系统服务例子:
```
# /etc/systemd/system/github-actions-runner.service
[Unit]
Description=GitHub Actions Runner Service
After=network-online.target

[Service]
ExecStart=/home/ci-user/actions-runner/run.sh
WorkingDirectory=/home/ci-user/actions-runner
Restart=on-failure
RestartSec=5
User=ci-user
Group=ci-user
Environment="PATH=/home/ci-user/.local/bin:/usr/local/bin:/usr/bin:/bin"
Environment="all_proxy=http://[::1]:10801"

[Install]
WantedBy=multi-user.target
```
== 复用工作流
- #link("https://docs.github.com/zh/actions/sharing-automations/reusing-workflows")[复用工作流 - GitHub 文档]
== 其他参考
- #link("https://www.feldera.com/blog/the-pain-that-is-github-actions")[The Pain That is Github Actions]
