#!/bin/bash
read -p "请输入 GitHub 用户名: " username
read -p "请输入 GitHub 仓库名: " repository
latest_version=$(echo $(curl -s "https://api.github.com/repos/$username/$repository/releases/latest") | grep -o '"tag_name": ".*"' | cut -d'"' -f4)
# 输出最新版本号
echo "$repository 最新版本号为: $latest_version"
return $latest_version
