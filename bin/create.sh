#!/bin/bash
read -p " 😉 请输入文章名称:" name
cd content/
echo " 📋 可双击以下路径粘贴 📋"
tree -df */
cd ..
read -p " 🛫 请输入路径(默认 posts ): 👉 " path
path=$(echo $path | sed 's/ *$//g')

if [ -z "$path" ]; then
	path="posts"
	echo " 😈 使用默认路径: $path"
fi
art_path="$(pwd)/content/${path}/${name}.md"
hugo new "${path}/${name}.md" >/dev/null
echo
echo " 🤠 复制以使用 vim 打开: 🤠"
echo "    vim $art_path"
echo
menu=("  📝 使用 vim 打开" "  📝 使用 VSCode 打开" "  🔚 退出")
select fav in "${menu[@]}"; do
	case $fav in
	"  📝 使用 vim 打开")
		vim $art_path
		exit 0
		;;
	"  📝 使用 VSCode 打开")
		echo "  😞 暂未支持, 文件位置: $art_path"
		echo
		exit 0
		;;
	"  🔚 退出")
		echo "  😍 您可随时编辑: $art_path"
		echo
		exit 0
		break
		;;
	esac
done
exit 0
