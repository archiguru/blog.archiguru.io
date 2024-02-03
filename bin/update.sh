#!/bin/bash
gh_user="archiguru"
gh_repo="archiguru"
repo_path="/Users/jonny/projects/$gh_repo"
# macOS 和 Linux 的路径不同，需要进行判断
if [ $(uname) = "Darwin" ]; then
	cd "$repo_path"
fi
# 添加所有文件到暂存区
git add . -A
# 获取当前时间戳
datetime=$(date +%Y%m%d%H%M%S.%N)
# 提交更新信息
git commit -m "Auto Update[$datetime]."
# 拉取远程代码
git pull
# 推送本地代码
git push
# 获取git执行结果并赋值给result变量
result=$?
# 如果result等于0（表示成功）
if [ $result -eq 0 ]; then
	# 输出成功信息
	echo "Git 更新成功！"
# 如果result不等于0（表示失败）
else
	# 输出失败信息并显示错误码
	echo "Git 更新失败：$result."
fi

# 退出出脚本并返回0状态码（表示正常结束）
exit 0
