#import "../../note_zh.typ": *
#show: conf.with(
  title: "DevOps笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 概念
== 开发
- #link("https://12factor.net/")[The Twelve-Factor App]
== 部署
/ 水平伸缩: 提高副本数量
/ 垂直伸缩: 提高单实例资源
/ Canary Deployment: 只向部分用户推送新版,渐进更新
/ Infrastructure as Code: 基础设施即代码(IsC)
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
Grafana是开源的数据可视化平台,用于创建仪表盘,展示来自各种数据源的指标.结合数据收集代理Telegraf与高性能的时序数据库#link("https://www.tisonkun.org/2024/06/05/influxdb-to-sql/")[InfluxDB],可以完成数据的采集,存储,查询展示的流程.

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

Let's Encrypt并不支持签发多级通配符证书,这是出于防止滥用的考虑.
= Podman
推荐crun作为运行时.

编辑`/etc/containers/registries.conf`以添加镜像站:
```toml
unqualified-search-registries = ["docker.io"]
[[registry]]
location = "docker.io"
[[registry.mirror]]
location = "docker.thudep.com"
```
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
=== 可复现构建
可复现构建的源头是保证上游的一致不变,在镜像打包的语义下,上游不仅仅是指开发者作为上游,从发行版安装的软件也是上游.

对于发行版,使用对应快照来锁定版本.

*Debian发行版*:
仅仅依赖稳定版冻结软件包版本是不可靠的,因为还有可能从debian-security接受更新.
```sh
sed -i 's|http://deb.debian.org/debian-security|http://snapshot.debian.org/archive/debian-security/20250717T060459Z|g' /etc/apt/sources.list.d/debian.sources
sed -i 's|http://deb.debian.org/debian|http://snapshot.debian.org/archive/debian/20250718T082802Z|g' /etc/apt/sources.list.d/debian.sources
echo "Acquire::Check-Valid-Until false;" >> /etc/apt/apt.conf.d/no-check-valid-until
```
== 运行容器
交互式运行容器,设置代理,挂载本地路径:
```sh
docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:master
```

`docker compose down && docker compose up -d`与`docker compose restart`存在差别,推荐始终使用前一种.
- 后者不会更新环境变量
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
而如果镜像站没有任何鉴权,那么在`daemon.json`里面配置的镜像站就可以在默认拉取DockerHub时生效了.
= Kubernetes
#link("https://cloudplatform.googleblog.com/2015/01/what-makes-a-container-cluster.html")[Kubernetes]是源自Google的内部工具Borg,现在成为了企业级容器和集群调度的工具.

Kubernetes提供的能力有:
- 服务发现和负载均衡
- 存储编排
- 自动部署和回滚
- 水平扩展
#figure(image("components-of-kubernetes.svg", width: 100%), caption: "Components of Kubernetes")
/ Pod: 一组容器,被作为一个单元放置在相同节点上.例如一个数据库容器与后端服务容器,它们可以组成一个Pod.
/ Label: 每个Pod都有若干键值对,一个键值对就是一个Label.可以通过Label来选中一组Pod.
/ Scaling: 根据Label以及期望的Pod数量,Kubernetes中的Replication Controller可以缩放Pod.

参考:
- #link("https://kubernetes.io/zh-cn/docs/concepts/architecture/")[Kubernetes 架构 | Kubernetes]
- #link("https://kubernetes.io/zh-cn/docs/tutorials/hello-minikube/")[Hello Minikube | Kubernetes]
- _B. Burns, E. Villalba, D. Strebel, and L. Evenson, Kubernetes best practices: blueprints for building successful applications on Kubernetes, Second edition. Sebastopol, CA: O'Reilly Media, Inc, 2023._
== Etcd
- #link("https://en.wikipedia.org/wiki/Container_Linux#ETCD")[Etcd - Wikipedia]
== 节点
节点(Node)可以是物理机或虚拟机,每个节点至少运行:
- kubelet
- 容器运行时

节点必须有不同的主机名.
== Pod
每个Pod在集群范围内,都会分配到独立的`IP`,例如`10.x.x.x`.集群内的访问是不需要NAT的.

在同一Pod内的所有容器都可以在`localhost`上访问彼此的端口,代价是降低了容器间的隔离性,不同容器的端口可能冲突.

以上性质与Docker不同.
== 容器
Kubernetes支持的容器运行时为containerd与CRI-O,以及兼容CRI的任何实现.
== Gateway
2023年末,Kubernetes发布了Gateway API,它旨在成为Kubernetes中暴露服务的新标准,替代Ingress.
== 卷
/ PersistentVolume:
  访问模式分为:
  / ReadWriteOnce: 被一个Node以读写方式挂载,并且允许该Node上的多个Pod读写该卷.
  / ReadOnlyMany: 被多个Node以只读方式挂载.
  / ReadWriteMany: 被多个Node以读写模式挂载.

StorageClass是集群管理员提前配置的,例如阿里云ACK集群上通过csi-provisioner提供不同类型的StorageClass.开发人员声明PersistentVolumeClaim,并且配置对应的StorageClassName后即可动态从中创建PersistentVolume.
== 网络
#figure(image("kube-networking-5.svg", width: 100%), caption: link(
  "https://www.stackrox.io/blog/kubernetes-networking-demystified/",
)[Kubernetes Networking Demystified])
Flannel是流行的Kubernetes容器网络插件,通过VXLAN创建Overlay网络.
= Kubernetes部署
- #link(
    "https://www.reddit.com/r/kubernetes/comments/1kd5a5e/whatre_people_using_as_selfhotedonprem_k8/",
  )[What're people using as self-hoted/on-prem K8 distributions in 2025? : r/kubernetes]
== k3s
必须安装iptables,只有nft是不够的.

默认的kubeconfig文件位于`/etc/rancher/k3s/k3s.yaml`.

Registry配置位于`/etc/rancher/k3s/registries.yaml`.
```yaml
mirrors:
  docker.io:
    endpoint:
      - https://mirror.ccs.tencentyun.com
```

为了配置server的`tls-san`等参数,修改`/etc/rancher/k3s/config.yaml`:
```yaml
tls-san:
  - "10.0.0.1"
  - "k3s.adamanteye.cc"
cluster-cidr: "10.16.0.0/12"
service-cidr: "10.32.0.0/12"
```
agent上不用做配置.
== Flux
Flux提供了可选组件,需要通过`--components-extra=image-reflector-controller,image-automation-controller`安装.如果第一次未安装,附加该选项后再次bootstrap.
- #link(
    "https://docs.gitlab.com/user/clusters/agent/getting_started/#next-steps",
  )[Connecting a Kubernetes cluster to GitLab]
- #link("https://spacelift.io/blog/fluxcd")[What is Flux CD & How Does It Work | Tutorial]
- #link(
    "https://www.youtube.com/watch?v=2CCZ8fcLyGk",
  )[Building with FluxCD and Kubernetes | GitOps Principles Explained in Action - YouTube]
= Kubernetes管理
== kubectl
最常用的操作
- `kubectl top` 使用情况
  - `1m` 代表 1 millicore
- `kubectl get` 列出资源
- `kubectl describe` 显示资源详细信息
- `kubectl logs` 打印Pod中容器的日志
- `kubectl exec` 在Pod中的容器上执行命令

检查`kubectl`是否能与集群通信:
```sh
kubectl cluster-info
```
查看集群配置
```sh
kubectl config view
```
- #link("https://lyz-code.github.io/blue-book/devops/kubectl/kubectl_commands/")[Kubectl Commands - The Blue Book]
== Flux
查看Kustomizations:
```sh
kubectl get kustomizations.kustomize.toolkit.fluxcd.io -A
```
或
```sh
flux get kustomizations
```
= GitOps
Weaveworks推广了GitOps的概念.GitOps旨在通过声明式的配置文件维持集群.

常用的拉取-应用更改的工具有Flux和ArgoCD.

`kustomization.yaml`告诉了Kubernetes从哪里组装`yaml`文件,运行以下命令查看组装的结果:
```sh
kubectl kustomize .
```
常见的`kustomazation.yaml`为:
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- bar.yaml
- foo/
```
= 邮件
/ MUA: 邮件用户代理(Mail User Agent)是通常所说的邮件客户端,常见的MUA有`mutt`,`thunderbird`等.
/ MTA: 邮件传输代理(Mail Transfer Agent)是邮件中继,专门用于接收已提交邮件并进行转发.
/ MDA: 邮件投递代理(Mail Delivery Agent)负责接收来自MTA的电子邮件并放进收件人的信箱中.收件人通过IMAP(S)同步邮箱状态.
邮件投递的要点是,当用户Alice(例如outlook)向用户Bob(例如gmail)发送邮件时,Alice不会直接向Bob的MTA投递,而始终首先发到自己的MTA.
== 反垃圾邮件
#link("https://www.cloudflare.com/learning/email-security/dmarc-dkim-spf/")[What are DMARC, DKIM, and SPF? | Cloudflare]介绍了提高MTA可信任性的方法.
= 跨域
= 服务
== Git
Git可视化页面,以便在无CI/CD,用户管理,Issues等需求的情况下使用.

- #link("https://hub.docker.com/r/mlan/gitweb")[mlan/gitweb - Docker Image | Docker Hub]
- #link("https://gitolite.com/gitolite/")[Gitolite]
== nginx
=== 参数
/ `client_max_body_size 1000M;`: 调整大小,以满足反向代理registry的Docker镜像上传的需求,否则`413 Request Entity Too Large`.
== GitLab
通过Docker部署GitLab
```yml
services:
  gitlab:
    image: gitlab/gitlab-ce:18.2.1-ce.0
    container_name: gitlab
    restart: unless-stopped
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        # Add any other gitlab.rb configuration here, each on its own line
        external_url 'https://gitlab.example.com'
        letsencrypt['enabled'] = false
        nginx['listen_https'] = false
        nginx['listen_port'] = 81
        registry_external_url 'https://registry.example.com'
        registry_nginx['listen_https'] = false
        registry_nginx['listen_port'] = 82
    ports:
      - '22:22'
    volumes:
      - '/srv/gitlab/config:/etc/gitlab'
      - '/srv/gitlab/logs:/var/log/gitlab'
      - '/srv/gitlab/data:/var/opt/gitlab'
```
此外一并配置反向代理.
== GitLab Runner
```yaml
services:
  gitlab-runner:
    image: gitlab/gitlab-runner
    container_name: gitlab-runner
    restart: unless-stopped
    volumes:
      - /cache:/srv/gitlab-runner/cache
      - /var/run/docker.sock:/var/run/docker.sock
      - ./config.toml:/etc/gitlab-runner/config.toml
```
注意GitLab的文档提到了多种配置Docker Executor的办法,最简单的是挂载socks:
```toml
[[runners]]
  executor = "docker"
  [runners.cache]
    MaxUploadedArchiveSize = 0
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
  [runners.docker]
    tls_verify = false
    image = "docker:28.3.2"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache", "/var/run/docker.sock:/var/run/docker.sock"]
    shm_size = 0
    network_mtu = 0
```
