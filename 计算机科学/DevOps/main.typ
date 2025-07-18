#import "../../note_zh.typ": *
#show: conf.with(
  title: "DevOps笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 概念
/ 水平伸缩: 提高副本数量
/ 垂直伸缩: 提高单实例资源
= CI/CD
== GitHub Security
=== Dependabot
- #link(
    "https://docs.github.com/zh/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates",
  )[配置 Dependabot 版本更新 - GitHub 文档]
- #link(
    "https://docs.github.com/zh/code-security/dependabot/working-with-dependabot/dependabot-options-reference",
  )[Dependabot 选项参考 - GitHub 文档]
== GitHub Actions
- #link(
    "https://docs.github.com/zh/actions/writing-workflows/workflow-syntax-for-github-actions#onschedule",
  )[GitHub Actions 的工作流语法 - GitHub 文档]
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
= 证书签发
== acme.sh
通过Cloudflare提供的API创建TXT记录以签发证书:
```sh
./acme.sh --issue --dns dns_cf -d thudep.com -d '*.thudep.com'
```
完成签发后,安装到指定位置:
```sh
./acme.sh --install-cert -d 'thudep.com' --fullchain-file /srv/cert/all.thudep.com.pem --key-file /srv/cert/all.thudep.com.key
```
这里拿到的证书是同样适用于二级域名的:
```
X509v3 Subject Alternative Name:
  DNS:thudep.com, DNS:*.thudep.com
```
可以通过查看PEM文件验证之:
```sh
openssl x509 -in <cert> -text -noout
```
此外,注意检查`acme.sh`是否创建了crontab.
= Docker
== 构建镜像
从含`Dockerfile`的路径构建镜像:
```sh
docker buildx build --tag nvchecker:latest .
```
=== 最小化打包
使用alpine镜像,并且从alpine安装软件包时使用`--no-cache`选项:
```sh
apk add --no-cache bash
# 等价于
apk update && apk add bash && rm -rf /var/cache/apk/*
```
如果使用debian镜像,类似的减少体积的方式是
```sh
apt-get update && \
apt-get install -y --no-install-recommends bash && \
rm -rf /var/lib/apt/lists/*
```
=== 可重复构建
== 运行容器
交互式运行容器,设置代理,挂载本地路径:
```sh
docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:master
```
== 清理
删除所有未使用镜像(不止dangling):
```sh
docker image prune -a
```
== 配置网络
在中国,免不了需要配置各种代理,为docker daemon配置代理可以通过编写`/etc/docker/daemon.json`实现:
```json
{
  "proxies": {
    "http-proxy": "http://[::1]:10801",
    "https-proxy": "http://[::1]:10801"
  }
}
```
如果要为docker container配置代理,可以使用`--add-host`配置容器与宿主机网络的映射,例如:
```sh
docker run -it --rm --add-host=host.docker.internal:host-gateway --name typst ghcr.io/adamanteye/typst:latest
```
进入容器后查看`/etc/hosts`,发现域名已经解析到宿主机地址:
```
172.17.0.1 host.docker.internal
```
在宿主机上,可以监听`172.17.0.1`这个地址并提供代理.而在容器中指定相应的环境变量:
```sh
export http_proxy='http://host.docker.internal:10801'
```
== 托管镜像
托管镜像站时注意,如果开启了htpasswd鉴权,那么试图通过该镜像站拉取镜像将不再成功,因为`docker pull`并不会使用`docker login https://docker.thudep.com`时保存的凭据.相反,需要指定源:
```sh
docker pull docker.thudep.com/library/nginx:alpine
```
而如果没有任何鉴权,那么在`daemon.json`里面配置的镜像站就可以在默认拉取DockerHub时生效了.
= 邮件
/ MUA: 邮件用户代理(Mail User Agent)是通常所说的邮件客户端,常见的MUA有`mutt`,`thunderbird`等.
/ MTA: 邮件传输代理(Mail Transfer Agent)是邮件中继,专门用于接收已提交邮件并进行转发.
/ MDA: 邮件投递代理(Mail Delivery Agent)负责接收来自MTA的电子邮件并放进收件人的信箱中.收件人通过IMAP(S)同步邮箱状态.
邮件投递的要点是,当用户Alice(例如outlook)向用户Bob(例如gmail)发送邮件时,Alice不会直接向Bob的MTA投递,而始终首先发到自己的MTA.
== 反垃圾邮件
#link("https://www.cloudflare.com/learning/email-security/dmarc-dkim-spf/")[What are DMARC, DKIM, and SPF? | Cloudflare]介绍了提高MTA可信任性的方法.
= 跨域
