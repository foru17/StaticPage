#! bin/bash
#自动进行项目初始操作的自动化脚本，可重复执行
#Author:@foru17
#url: http://luolei.org
#定义项目变量
#自定义远程GIT
function gitchange(){
    #首先删除已有的GIT remote branch
    git remote rm origin
    #添加自己的remote
    echo "请添加你的GIT远程仓库地址:(例 git@git.yourserver.com:/home/git/project.git)"
    read -p "git remote add origin " gitremote
    git remote add origin $gitremote
    devbuild
}


#进行编译安装

function devbuild(){
    echo "安装NPM依赖包?是否执行(y,N)?: "
    while true;do
    read -p "npm install  : " yn
    case $yn in
        [Yy]* ) npm install ;break;;
        [Nn]* ) exit;;
        * ) echo "请回答y或者N: " ;;
        esac
    done

    echo "恭喜你部署成功你的新项目:\""$chinesename"\""
    echo "执行相应的grunt <task> 命令可以进行不同的操作"
    echo "详细可参考 README.md 文档"
}


function diyproject(){
#首先安装依赖包

echo
echo "修改在package.json中的项目名称(注意:只允许英文和数字禁止空格):"
read -p "name: " projectname && sed -i '' 's/StaticPage/'$projectname'/g' package.json
#打包文件名词
echo "请输入你的项目文件夹名（中英文均+文件系统允许符号）:"
read -p "archive_name :" chinesename && sed -i '' 's/StaticPage项目名称/'$chinesename'/g' Gruntfile.js


while true;do
read -p "是否添加自己的GIT远程仓库(输入(y/N): " yn
case $yn in
    [Yy]* ) gitchange ;break;;
    [Nn]* ) devbuild ;break;;
    * ) echo "请回答y或者N: ";;
    esac
done



}

#欢迎页面 如果有package.json则执行项目内操作
foldername=${PWD##*/}
if [  -a package.json ];
then
    #cd .. && read -p "请给你的文件夹重命名:" rename && mv StaticPage $rename && cd $rename && sh go.sh
    echo "欢迎使用\"StaticPage\"静态页面自动化工具"
    echo "该项目文档在Github https://github.com/foru17/StaticPage "
    echo
    diyproject
else
    while true;do
        read -p '首先请git clone本项目，是否要执行(y/N)?: ' yn
    case $yn in
        [Yy]* ) git clone https://github.com/foru17/StaticPage.git && read -p "请给你的文件夹重命名:" rename &&mv StaticPage $rename && cd $rename &&sh go.sh ; break;;
        [Nn]* ) exit ;;
        * ) echo "请回答y或者N: " ;;
        esac
    done
fi
