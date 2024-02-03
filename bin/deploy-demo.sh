#!/bin/bash

log_info() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") [INFO] $1"
}
success_exit() {
    echo "{'success':true, 'message':'SUCCESS'}"
    exit 0
}

CUR_USER="Jonny.Chong"
log_info ${CUR_USER}
log_info "开始更新项目..."
date=$(date "+%Y%m%d%H%M%S")
log_info ${date}
log_info "更新子模块："
git submodule foreach git pull origin main
log_info "更新当前项目："
git pull origin main:main
log_info "删除旧项目："
rm -rf ./public
log_info "删除成功！"
log_info "开始编译项目："
hugo --buildFuture
log_info "编译完成！"
log_info "删除 git 相关文件："
rm -rf public/resume/.git
rm -rf public/resume/.gitignore
# git rm --cached 'public/resume'
log_info "开始推送项目："
git add -A
git commit -m "${CUR_USER}更新于${date}."
git push -u origin main
log_info "推送成功！"
log_info "请等待3～5分钟后查看部署结果 😄"
success_exit
