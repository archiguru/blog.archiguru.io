---
title: "Aliyun Cli"
subtitle: ""

date: 2023-12-06T23:09:55+08:00
lastmod: 2023-12-06T23:09:55+08:00

author: "Jonny.Chang"
authorLink: "https://archiguru.io"
description: "架构师|Java 爱好者|GitHub|ArchiGuru|这里是 ArchiGuru 博客，欢迎访问！"
tags: ["所有博客"]
categories: ["所有博客"]

fontawesome: true
linkToMarkdown: true
rssFullText: true
draft: false
hiddenFromHomePage: false
hiddenFromSearch: false
lightgallery: true

toc:
  enable: true

math:
  enable: true
lightgallery: false

featuredImage: ""
featuredImagePreview: ""
license: "https://archiguru.io/LICENSE"
---
阿里云 aliyun-cli 使用说明

<!--more-->

```
aliyun --help

阿里云CLI命令行工具 3.0.188

Usage: aliyun <product> <operation> [--parameter1 value1 --parameter2 value2 ...]

Flags:

|Flags| 使用说明|
|:-----|:-------|
|--mode               |使用 `--mode {AK|StsToken|RamRoleArn|EcsRamRole|RsaKeyPair|RamRoleArnWithRoleName}` 指定认证方式 |
|--profile,-p         |使用 `--profile <profileName>` 指定操作的配置集 |
|--language           |使用 `--language [en|zh]` 来指定语言 |
|--region             |使用 `--region <regionId>` 来指定访问大区 |
|--config-path        |使用 `--config-path` 指定配置文件路径 |
|--access-key-id      |使用 `--access-key-id <AccessKeyId>` 指定AccessKeyId |
|--access-key-secret  |使用 `--access-key-secret <AccessKeySecret>` 指定AccessKeySecret |
|--sts-token          |使用 `--sts-token <StsToken>` 指定StsToken |
|--sts-region         |使用 `--sts-region <StsRegion>` 指定StsRegion |
|--ram-role-name      |使用 `--ram-role-name <RamRoleName>` 指定RamRoleName |
|--ram-role-arn       |使用 `--ram-role-arn <RamRoleArn>` 指定RamRoleArn |
|--role-session-name  |使用 `--role-session-name <RoleSessionName>` 指定RoleSessionName |
|--private-key        |使用 `--private-key <PrivateKey>` 指定RSA私钥 |
|--key-pair-name      |使用 `--key-pair-name <KeyPairName>` 指定KeyPairName |
|--read-timeout       |使用 `--read-timeout <seconds>` 指定I/O超时时间(秒) |
|--connect-timeout    |使用 `--connect-timeout <seconds>` 指定请求连接超时时间(秒) |
|--retry-count        |使用 `--retry-count <count>` 指定重试次数 |
|--skip-secure-verify |使用 `--skip-secure-verify` 跳过https的证书校验 [不推荐使用] |
|--expired-seconds    |使用 `--expired-seconds <seconds>` 指定凭证过期时间 |
|--process-command    |使用 `--process-command <ProcessCommand>` 指定外部程序运行命令 |
|--secure             |使用 `--secure` 开关强制使用https方式调用 |
|--force              |添加 `--force` 开关可跳过API与参数的合法性检查 |
|--endpoint           |使用 `--endpoint <endpoint>` 来指定接入点地址 |
|--version            |使用 `--version <YYYY-MM-DD>` 来指定访问的API版本 |
|--header             |使用 `--header X-foo=bar` 来添加特定的HTTP头, 可多次添加 |
|--body               |使用 `--body $(cat foo.json)` 来指定在RESTful调用中的HTTP包体 |
|--pager              |使用 `--pager` 在访问分页的API时合并结果分页 |
|--output,-o          |使用 `--output cols=Field1,Field1 [rows=jmesPath]` 使用表格方式打印输出 |
|--waiter             |使用 `--waiter expr=<jmesPath> to=<value>` 来轮询调用OpenAPI，直到返回期望的值 |
|--dryrun             |使用 `--dryrun` 在执行校验后打印请求包体，跳过实际运行 |
|--quiet,-q           |使用 `--quiet` 关闭正常输出 |
|--method             |使用 `--method {GET|POST}` 来指定 RPC 请求的 Method |
|--help               |打印帮助信息 |


示例: `aliyun ecs DescribeRegions`

产品:
| 产品名称 | 产品说明 |
|:--------|:--------|

|actiontrail        | 操作审计|
|adb                | 分析型数据库MySQL版|
|adcp               | 分布式云容器平台|
|aegis              | 服务器安全（安骑士）|
|agency             | agency|
|alb                | 应用型负载均衡|
|alidns             | 云解析DNS|
|alikafka           | 消息队列 Kafka|
|arms               | 业务实时监控服务 ARMS|
|batchcompute       | 批量计算|
|bssopenapi         | bssopenapi|
|cas                | 证书服务|
|cbn                | 云企业网|
|ccc                | 云呼叫中心|
|cdn                | CDN|                       
|cds                | cds|
|chatbot            | 云小蜜|
|cloudapi           | API 网关|
|cloudauth          | 实人认证|
|cloudfw            | 云防火墙|
|cloudphoto         | 智能云相册|
|cloudsso           | 访问控制 云SSO|
|cloudwf            | 云AP|
|cms                | 云监控|
|computenest        | 计算巢服务|
|computenestsupplier| 计算巢-服务商侧|
|config             | 配置审计|
|cr                 | 容器镜像服务|
|cs                 | 容器服务|
|csb                | 云服务总线 CSB|
|dcdn               | 全站加速|
|ddoscoo            | 新BGP高防IP|
|ddospro            | DDoS高防IP|
|dds                | 云数据库 MongoDB 版|
|devops             | 云效2020|
|dm                 | 邮件推送|
|dms-enterprise     | 数据管理|
|domain             | 域名|
|domain-intl        | 域名|
|drds               | 分布式关系型数据库服务 DRDS|
|dts                | 数据传输|
|eci                | Elastic Container Instances|
|ecs                | 云服务器 ECS|
|edas               | 企业级分布式应用服务EDAS|
|ehpc               | 弹性高性能计算|
|eipanycast         | 任播弹性公网IP|
|elasticsearch      | elasticsearch|
|emr                | E-MapReduce|
|ens                | 边缘节点服务|
|ess                | 弹性伸缩|
|eventbridge        | 事件总线|
|facebody           | 视觉智能开放平台|
|fc-open            | 函数计算|
|fnf                | FunctionFlow|
|ga                 | 全球加速|
|goodstech          | 视觉智能开放平台|
|gpdb               | 分析型数据库PostgreSQL版|
|green              | 内容安全|
|hbase              | 云数据库 HBase|
|hpc                | 高性能计算 HPC|
|httpdns            | HTTPDNS|
|imageaudit         | 视觉智能开放平台|
|imageenhan         | 视觉智能开放平台|
|imagerecog         | 视觉智能开放平台|
|imageseg           | 视觉智能开放平台|
|ims                | 访问控制 身份管理|
|iot                | 物联网套件|
|itaas              | 云投屏|
|jaq                | 移动安全|
|kms                | 密钥管理服务|
|ledgerdb           | 可信账本数据库|
|live               | 视频直播|
|mse                | 微服务引擎|
|mts                | 媒体处理|
|nas                | 文件存储|
|nlb                | 网络型负载均衡|
|objectdet          | 视觉智能开放平台|
|oceanbasepro       | 云数据库 OceanBase 版|
|ocr                | 视觉智能开放平台|
|ons                | 消息队列 MQ|
|oos                | 运维编排服务|
|ots                | 表格存储|
|petadata           | HybridDB for MySQL|
|polardb            | 云数据库 PolarDB 版|
|privatelink        | 私网连接|
|push               | 移动推送|
|pvtz               | PrivateZone|
|qualitycheck       | 智能对话分析服务|
|quotas             | 配额中心|
|r-kvstore          | 云数据库 Redis 版|
|ram                | 访问控制|
|rds                | 云数据库RDS版|
|resourcecenter     | 资源中心|
|resourcemanager    | 资源管理|
|rocketmq           | 消息队列 RocketMQ 5.0版|
|ros                | 资源编排|
|sae                | 轻量级分布式应用服务|
|sales              ||
|sas                | 云安全中心|
|sas-api            | 态势感知|
|scdn               | 安全加速 SCDN|
|servicemesh        | 服务网格|
|slb                | 负载均衡|
|sls                | 日志服务|
|smc                | 服务器迁移中心|
|sts                | 访问控制|
|tag                | 标签|
|vod                | 视频点播|
|vpc                | 专有网络VPC|
|vpcpeer            | VPC对等连接|
|waf-openapi        | Web应用防火墙|
|yundun-bastionhost | 堡垒机|
```

