StaticPage 静态页面自动化工具
==========

A quick Template for quikly creating a static page project.Based on grunt.

一套快速生成简单静态页模板的工具


````
git clone https://github.com/foru17/StaticPage.git
````
####安装Npm依赖包


````
npm install
````

安装完毕之后，你将得到如下的文件结构

####文件结构

````
newProject/
|
|-----assets //dev模式下css、js、images等集合
|           |-css
|           |-js
|           |-images
|
|-----build //最终的项目所有文件线    上版本（不包含dev时包含的配置文件等）
|       |-assets //上线时的css、js、images等
|           |-css
|               |-min.style.css //最终生成的为压缩版本的css
|           |-js
|               |-min.v.js //最终生成的为压缩版本的js
|               |-other.js //其他样式表
|           |-images
|
|       |-favicon.ico //静态页的ico
|       |-index.html
|       |-README.md //附上MD文档
|       |-此处根据项目需求，引入不用文件
|
|-----css //样式表开发目录
|   |-sass //推荐使用Sass样式表
|       |- _481up.scss
|       |- _768up.scss
|       |- _base.scss
|       |- _mixins.scss
|       |- _reset.scss  //此处可用normalize.css样式，也可以根据项目需求自定义
|       |- style.scss //此处为Sass基础文件 ，在此处根据需求@import 样式
|   |-style.css //Sass编译处理生成的样式表为style.css，也可直接编辑此样式表
|   |-style.css.map //若使用Sass --pre 版本，可使用sourcemap功能
|
|-----js //JavaScript相关
|   |-base.js //基础样式在这里，最终压缩为min.v.js
|
|----- .node_modules / //npm安装
|   |-base.js //基础样式在这里，最终压缩为min.v.js
|
|-----.gitignore //默认使用git，配置好gitignore文件
|-----Gruntfiles.js //grunt配置文件 建议先阅读配置
|-----package.json //grunt依赖包配置文件
````

####初始化

git clone下来后，可以将`StaticPage`文件夹修改成项目的文件名，建议初始化时可执行一次。

````
grunt bundle
````

####grunt配置

######CSS编译&&压缩

对于`Sass`可自动编译和纠错，使用`cssmin`对文件进行压缩，可有效减少文件大小

######JS文件

使用`concat`根据自己的需求对js进行压缩（一般简单静态页面使用一个`base.js`即可），默认使用`uglify`对js文件进行压缩，在最终的min.v.js文件前面加上时间戳（可以根据需求删除）。

######打包&&发布

使用`grunt bundle`可自动生成不包含开发时的杂乱文件压缩包，文件名为`项目名称-生成时间.zip`的压缩包。压缩包内为文件夹`build`内所有文件。

执行`grunt bundle`实际上为依次执行'clean:pre', 'copy:main','cssmin','copy:archive', 'clean:post','compress'等命令，首先将先前`build`文件夹中的内容清空，然后生成、复制、压缩最新的代码。

####说明

此工具适合简单静态页项目，可根据自己项目需求配置



