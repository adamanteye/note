#import "../../note_zh.typ": *
#show: conf.with(
  title: "DevOps笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= CI/CD
== GitHub Security
=== Dependabot
- #link("https://docs.github.com/zh/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates")[配置 Dependabot 版本更新 - GitHub 文档]
- #link("https://docs.github.com/zh/code-security/dependabot/working-with-dependabot/dependabot-options-reference")[Dependabot 选项参考 - GitHub 文档]
== GitHub Actions
- #link("https://docs.github.com/zh/actions/writing-workflows/workflow-syntax-for-github-actions#onschedule")[GitHub Actions 的工作流语法 - GitHub 文档]
=== 代码检出
默认的检出方式是浅克隆,即只包含最新提交,如果需要根据提交历史生成修改变更等,应当禁用浅克隆:
```yml
- uses: actions/checkout@v4
  with:
    fetch-depth: 0
```
=== Self-hosted Runner
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
允许在Self-hosted Runner上运行容器内的作业,前提是容器内安装有对应的软件.例如
#link("https://github.com/cloudflare/wrangler-action")[cloudflare/wrangler-action]需要`npm`以及`node`.
=== 复用工作流
- #link("https://docs.github.com/zh/actions/sharing-automations/reusing-workflows")[复用工作流 - GitHub 文档]
=== 其他参考
- #link("https://www.feldera.com/blog/the-pain-that-is-github-actions")[The Pain That is Github Actions]
= 自动化测试
== 单元测试
/ 原则:
- Protection against regressions
- Resistance to refactoring
- Fast feedback
- Maintainbility
= 网络基础设施
== Cloudflare
=== Tunnel
CF Tunnel可以方便地在中国地区搭建服务,例如:
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
=== Workers and Wrangler
更新wrangler版本时注意查看
#link("https://developers.cloudflare.com/workers/configuration/compatibility-flags/")[Compatibility flags]以了解是否出现兼容性问题.
= 监控与日志
Grafana是开源的数据可视化平台,用于创建仪表盘,展示来自各种数据源的指标.结合数据收集代理Telegraf与高性能的时序数据库InfluxDB,可以完成数据的采集,存储,查询展示的流程.

首先配置Telegraf采集数据,例如采集CPU负载:
```toml
[agent]
collection_jitter = "20s"
debug = false
hostname = "heloise"
interval = "20s"

# Read metrics about cpu usage
[[inputs.cpu]]
## Whether to report per-cpu stats or not
percpu = false
## Whether to report total system cpu stats or not
totalcpu = true
## Comment this line if you want the raw CPU time metrics
fielddrop = ["time_*"]
```
连接到InfluxDB:
```toml
[[outputs.influxdb_v2]]
## The URLs of the InfluxDB cluster nodes.
##
## Multiple URLs can be specified for a single cluster, only ONE of the
## urls will be written to each interval.
##   ex: urls = ["https://us-west-2-1.aws.cloud2.influxdata.com"]
urls = ["http://influxdb2:8086"]

## Local address to bind when connecting to the server
## If empty or not set, the local address is automatically chosen.
# local_address = ""

## Token for authentication.
token = ""

## Organization is the name of the organization you wish to write to.
organization = ""

## Destination bucket to write into.
bucket = ""
```
最终在Grafana中添加数据源,配置仪表盘.
