# Docker APP NodeJs

本案例意为使用配置文件，参数化的构建多层docker image，并启动docker container。

三个文件夹`resources`，`docker-base`，`docker-app`，需要放置于项目根目录。

ps1: centos7系统下的`yum install docker`的docker版本过低，
需要[如此](https://docs.docker.com/install/linux/docker-ce/centos/)安装docker。

ps2: 务必使用`.dockerignore`，例：剔除`node_modules`等不必要文件

ps3: 案例使用nodejs

## 结构

1. `docker-base`:

    1. `Dockerfile`: 安装依赖包等变化较少的步骤放置于此，例：
        
        - python: 'pip install requirements.txt'... 
        - nodejs: 'npm install', 'yarn'...
        - java: 'copy jars'...

2. `docker-app`:

    1. `Dockerfile`: 编译项目等变化较多的步骤放置于此，例：
        
        - nodejs: 'npm build', 'yarn build'...
        
    2. `docker-compoes`: 启动容器
    
## 步骤

1. 设置好config：`resources/docker.env`
2. `cd docker-base`
3. `bash setup.sh`
4. `cd ../docker-app`
5. `bash setup.sh`
6. `bash start.sh`
