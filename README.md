```bash
# 打开本地服务器
sphinx-autobuild source build/html

```

# 错误
- read the docs 编译时错误
  ```bash
  Theme error:
  no theme named 'sphinx_material' found (missing theme.conf?)
  ```
- 参考：[ReadTheDocs搭建第一本电子书](https://zhuanlan.zhihu.com/p/388640347)
- 原因是ReadTheDocs的python环境没有对应的第三方库文件，需要在项目根目录执行如下命令生成requirements.txt，这样ReadTheDocs会自动安装对应的插件依赖。
- 运行命令：``python -m pip freeze > requirements.txt``
- 然后手动写写入``sphinx-material==0.0.35``到``requirements.txt``
