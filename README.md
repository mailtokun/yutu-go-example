# yutu-go-example
这是一个 Golang 的例子, 此App将会被玉兔 GitOps 引擎被部署到 Docker 中.
## 两个关键点
### 关键点1: Makefile
在根目录提供一个Makefile. 并且包含 build 和 run 两个`target`
- build `target`
  用于编译本项目,包括安装相关的依赖项.
- run `target`
  用于在Docker中启动本项目.
### 关键点2: Dockerfile
在根目录提供一个Dockerfile
