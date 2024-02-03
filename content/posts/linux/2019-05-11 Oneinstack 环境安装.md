---
title: "Oneinstack 环境安装"
subtitle: "一键PHP/JAVA安装脚本工具 Oneinstack"
author: "Jonny.Chang"
date: 2019-05-11
lastmod: 2020-05-28
authorLink: "https://github.com/archiguru"
description: "OneinStack是一键PHP/JAVA安装脚本工具，包含lnmp,lamp,lnmpa,ltmp,lnmh, MySQL,PostgreSQL,MongoDB等."
tags: ["OneinStack", "Linux", "环境"]
categories: ["Linux"]
hiddenFromHomePage: false
fontawesome: true
linkToMarkdown: true
rssFullText: true
draft: false
lightgallery: true
---

**OneinStack** 是另一个非常优秀的 LNMP 一键安装脚本，这与 LNMP 功能类似，只不过 LNMP.org 的 LNMP 一键脚本一年才更新一次，PHP 7 和 Let’s Encrypt 证书只有等到 LNMP 1.4 出来后才能使用，而 OneinStack 早就可以使用了。

<!--more-->

## OneinStack 下载安装与升级

- 准备:

```shell
# CentOS
yum -y install wget screen
# Ubuntu
apt-get -y install wget screen
```

screen 是为了防止链接断开而导致安装失败的问题
常用命令:

```shell

```

- 下载安装:
  解压即可使用，推荐在 `~` 目录下。

```shell
cd ~ && wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz
tar xzf oneinstack-full.tar.gz
cd ~ && rm -rf oneinstack-full.tar.gz
```

- 升级:

```shell
cd ~ && rm -rf oneinstack
重复安装步骤即可
```

- 其他配置

## 如何使用 OneinStack

### 参考链接

- 自动安装: https://oneinstack.com/auto/
- 交互安装: https://oneinstack.com/install/
- 常见问题: https://oneinstack.com/faq/

### 自用安装命令

先简单安装一个 Nginx ， 初始化环境，也当作测试使用。

```shell
# 如果网路出现中断，可以执行命令`screen -R ones`重新连接安装窗口
screen -S ones
# 这里选择的是安装 openresty
cd ~/oneinstack && ./install.sh --nginx_option 3
# 如果 Nginx 安装成功，执行下面安装所有环境
# 需要注意修改 --dbrootpwd 参数 默认是 oneinstack
cd ~ && ./oneinstack/install.sh --apache_option 1 --apache_mpm_option 1 --apache_mode_option 1 --php_option 8 --phpcache_option 1 --php_extensions imagick,fileinfo,redis,memcached,mongodb  --pureftpd  --redis  --memcached --tomcat_option 1 --jdk_option 1 --phpmyadmin  --db_option 1 --dbinstallmethod 2 --dbrootpwd oneinstack --reboot

```

### 环境变量

将下方环境变量放入 `.zshrc` 中，执行 `source ~/.zshrc`

```shell
export JAVA_HOME=/usr/java/jdk-11.0.7
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:/usr/local/php/bin:/usr/local/apache/bin:/usr/local/mysql/bin:/usr/local/openresty/nginx/sbin:$PATH
```
