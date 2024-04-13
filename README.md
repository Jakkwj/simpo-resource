# 安装

```bash
python -m pip install -i https://mirrors.aliyun.com/pypi/simple/ install sphinx sphinx-autobuild sphinx_rtd_theme

```

# Documentation:

https://sludge.readthedocs.io/en/latest

# 本地运行

```bash
# 打开本地服务器

sphinx-autobuild source build/html

sphinx-autobuild source/ build/html

```

# gif 压缩

- https://docsmall.com/gif-compress

# 错误

- read the docs 编译时错误
  ```bash
  Theme error:
  no theme named 'sphinx_material' found (missing theme.conf?)
  ```
- 参考：[ReadTheDocs 搭建第一本电子书](https://zhuanlan.zhihu.com/p/388640347)
- 原因是 ReadTheDocs 的 python 环境没有对应的第三方库文件，需要在项目根目录执行如下命令生成 requirements.txt，这样 ReadTheDocs 会自动安装对应的插件依赖。
- 不要运行命令：`python -m pip freeze > requirements.txt`，会依赖很多不必要的库
- 然后手动写写入`sphinx-material`到`requirements.txt`
- 注意`.readthedocs.yaml`放在最上层目录
- `requirements`路径：`sludge_doc/source/requirements.txt`

# git 错误

- 推送错误: [refspec matches more than one"](https://confluence.atlassian.com/bitbucketserverkb/pushing-a-branch-to-bitbucket-fails-with-the-error-refspec-matches-more-than-one-1108091938.html)

# 注意

- 一个库无法更改 slug, 即已经建好的将无法更改 url: https://docs.readthedocs.io/en/stable/faq.html#how-do-i-change-my-project-slug-the-url-your-docs-are-served-at

# 参考

- [Configuration File V2](https://docs.readthedocs.io/en/stable/config-file/v2.html)
