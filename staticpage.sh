#! bin/bash
#自动进行项目初始操作的自动化脚本，可重复执行
#Author:@foru17

#首先安装依赖包
if [ -e package.json];then
echo '执行npm install，安装依赖包......'
npm install && read -p "请输入你的项目名称' pname
