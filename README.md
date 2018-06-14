# Note

### 查看

1. 查看当前运行的容器

    `docker ps`
    
1. 查看全部容器
    
    `docker ps -a`
    
1. 查看全部容器的id和信息
    
    `docker ps -a -q`
    
1. 查看全部容器占用的空间
    
    `docker ps -as`
    
1. 查看一个正在运行容器进程，支持 ps 命令参数
    
    `docker top`
    
1. 查看容器的示例id

    `sudo docker inspect -f  '{{.Id}}' [id]`
    
1. 检查镜像或者容器的参数，默认返回 JSON 格式
    
    `docker inspect`
    
1. 返回 ubuntu:14.04  镜像的 docker 版本

    `docker inspect --format '{{.DockerVersion}}' ubuntu:14.04`
    
    `docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ubuntu:14.04`

### 容器同步命令

1. 保存对容器的修改
    
    `docker commit`
    
1. 保存某个容器成为一个镜像

    `docker commit -a "user" -m "commit info" [CONTAINER] [imageName]:[imageTag]`
    
1. 推送一个容器到中心仓库

    `docker login --username=[userName] --password=[pwd] [registryURL]`
    
1. 登录后查看 docker info

    `docker tag [imageID] [remoteURL]:[imageTag]`
    
    `docker push [remoteURL]:[imageTag]`

1. 拉取提交的容器

    `docker pull [remoteURL]:[imageTag]`

1. 对比容器的改动

    `docker diff`
    
1. 附加到一个运行的容器上
    
    `docker attach`

### 创建删除容器

1. 创建一个容器命名为 test 使用镜像daocloud.io/library/ubuntu

    `docker create -it --name test daocloud.io/library/ubuntu`
    
1. 创建并启动一个容器 名为 test 使用镜像daocloud.io/library/ubuntu

    `docker run --name test daocloud.io/library/ubuntu`
    
1. 删除一个容器

    `docker rm [容器id]`

1. 删除所有容器

    `docker stop $(docker ps -a -q)`
    
    `docker rm $(docker ps -a -q)`
    
1. 根据Dockerfile 构建

    `docker build -t [image_name] [Dockerfile_path]`

### docker容器随系统自启

`docker run --restart=always`

* no – 默认值，如果容器挂掉不自动重启
* on-failure – 当容器以非 0 码退出时重启容器,同时可接受一个可选的最大重启次数参数 (e.g. on-failure:10).
* always – 不管退出码是多少都要重启

### 容器资源限制参数

1. 限制内存最大使用

    `-m 1024m --memory-swap=1024m`

1. 限制容器使用CPU

    `--cpuset-cpus="0,1"`

### 容器操作命令

1. 把一个正在运行的容器保存为镜像
    
    `docker commit <CONTAIN-ID> <IMAGE-NAME>`

1. 启动停止容器等操作

    `docker start|stop|restart [id]`
    
1. 暂停|恢复 某一容器的所有进程

    `docker pause|unpause [id]`
    
1. 杀死一个或多个指定容器进程

    `docker kill -s KILL [id]`

1. 停止全部运行的容器

    `docker stop $(docker ps -q)`

1. 杀掉全部运行的容器

    `docker kill -s KILL $(docker ps -q)`

1. 交互式进入容器

    `sudo docker exec -it {{containerName or containerID}} bash`
    
    `sudo docker exec -i {{containerName or containerID}} bash`
    
    `sudo docker exec -t {{containerName or containerID}} bash`
    
    `sudo docker exec -d {{containerName or containerID}} bash`

    * 只用 -i 参数，由于没有分配伪终端，看起来像pipe执行一样。但是执行结果、命令返回值都可以正确获取
    * 只用 -t 参数，则可以看到一个 console 窗口，但是执行命令会发现由于没有获得stdin的输出，无法看到命令执行情况
    * 使用 -it 时，则和我们平常操作 console 界面类似，而且也不会像attach方式因为退出，导致整个容器退出
    * 使用 -d 参数，在后台执行一个进程。如果一个命令需要长时间进程，会很快返回

1. Docker attach
    
    Docker attach可以attach到一个已经运行的容器的stdin，然后进行命令执行的动作

    `docker attach {{containerName or containerID}}`

    需要注意的是，如果从这个stdin中exit，会导致容器的停止
    
1. 查看容器的root用户密码

    `docker logs <容器名orID> 2>&1 | grep '^User: ' | tail -n1`

    因为Docker容器启动时的root用户的密码是随机分配的。所以，通过这种方式就可以得到容器的root用户的密码
    
1. 容器于宿主拷贝文件

    `docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-`
    
    `docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH`
    
1. 本地文件上传到对应容器的目录

    `docker cp local.sh [CONTAINERid]:[TagPath]`

    此命令为高版本docker才有，当然1.11+肯定包含
    
1. 运行一个新容器，同时为它命名、端口映射、文件夹映射

    以redmine镜像为例

    `docker run --name redmine -p 9003:80 -p 9023:22 -d -v /var/redmine/files:/redmine/files -v /var/redmine/mysql:/var/lib/mysql sameersbn/redmine`

1. 一个容器连接到另一个容器

    `docker run -i -t --name sonar -d -link mmysql:db  tpires/sonar-server sonar`

### 导入导出容器

1. 支持远程文件 .tar, .tar.gz, .tgz, .bzip, .tar.xz, .txz

    `docker import`
1. 导出
    
    `docker export [id] >~/Downloads/ubuntu_nexus.tar`

    导出后导入（exported-imported)）的容器会丢失所有的提交历史，无法回滚。

### 镜像操作

1. 远程镜像

    `docker login`

    `docker search`
    
1. 搜索处收藏数不小于 3 ，并且能够自动化构建的  django 镜像，并且完整显示镜像描述

    `docker search -s 3 --automated --no-trunc django`
    
    `docker pull`
    
1. 拉取ubuntu最新的镜像

    `docker pull ubuntu:latest`
    
1. 服务器拉取个人动态，可选择时间区间
    
    `docker events`
    
1. 拉取个人从 2015/07/20 到 2015/08/08 的个人动态

    `docker events --since="20150720" --until="20150808"`

### 镜像同步操作

1. 标记本地镜像，将其归入某一仓库
    
    `docker tag`
    
1. 将 ID 为 5db5f84x1261 的容器标记为 mine/lnmp:0.2 镜像

    `docker tag 5db5f84x1261 mine/lnmp:0.2`
    
1. 将镜像推送至远程仓库，默认为 Docker Hub

    `docker push`

### 本地镜像

1. 列出本地所有镜像
    
    `docker images`
    
1. 本地镜像名为 ubuntu 的所有镜像

    `docker images ubuntu`
    
1. 查看指定镜像的创建历史

    `docker history [id]`
    
1. 本地移除一个或多个指定的镜像

    `docker rmi`
    
1. 移除本地全部镜像

    `docker rmi $(docker images -a -q)`
    
1. 指定镜像保存成 tar 归档文件， docker load 的逆操作

    `docker save`
    
1. 将镜像 ubuntu:14.04 保存为 ubuntu14.04.tar 文件

    `docker save -o ubuntu14.04.tar ubuntu:14.04`
    
1. 从 tar 镜像归档中载入镜像， docker save 的逆操作
    
    `docker load`
    
    上面命令的意思是将 ubuntu14.04.tar 文件载入镜像中
    
    `docker load -i ubuntu14.04.tar`
    
    `docker load < /home/save.tar`
    
1. 构建自己的镜像

    `docker build -t <镜像名> <Dockerfile路径>`
    
    `docker build -t xx/gitlab .`

    保存后再加载（saved-loaded）的镜像不会丢失提交历史和层，可以回滚
    
### 重新查看container的stdout

1. 启动top命令，后台运行
    
    `$ ID=$(sudo docker run -d ubuntu /usr/bin/top -b)`
    
1. 获取正在running的container的输出

    `$ sudo docker attach $ID`

    ```
    top - 02:05:52 up  3:05,  0 users,  load average: 0.01, 0.02, 0.05
    Tasks:  1 total,  1 running,  0 sleeping,  0 stopped,  0 zombie
    Cpu(s):  0.1%us,  0.2%sy,  0.0%ni, 99.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
    Mem:    373572k total,  355560k used,    18012k free,    27872k buffers
    Swap:  786428k total,        0k used,  786428k free,  221740k cached
    ^C$
    ```
$ sudo docker stop $ID

### docker run

1. 后台运行(-d)、并暴露端口

    `docker run -d -p 127.0.0.1:33301:22 centos6-ssh`

1. run 命令详解

    ```
    -a, --attach=[]            Attach to STDIN, STDOUT or STDERR 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项
    --add-host=[]              Add a custom host-to-IP mapping (host:ip)
    --blkio-weight=0            Block IO (relative weight), between 10 and 1000
    -c, --cpu-shares=0          CPU shares (relative weight)
    --cap-add=[]                Add Linux capabilities
    --cap-drop=[]              Drop Linux capabilities
    --cgroup-parent=            Optional parent cgroup for the container
    --cidfile=                  Write the container ID to the file
    --cpu-period=0              Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota=0              Limit the CPU CFS quota
    --cpuset-cpus=              CPUs in which to allow execution (0-3, 0,1) 绑定容器到指定CPU运行
    --cpuset-mems=              MEMs in which to allow execution (0-3, 0,1) 绑定容器到指定MEM运行
    -d, --detach=false          Run container in background and print container ID 后台运行容器，并返回容器ID
    --device=[]                Add a host device to the container
    --dns=[]                    Set custom DNS servers 指定容器使用的DNS服务器，默认和宿主一致
    --dns-search=[]            Set custom DNS search domains 指定容器DNS搜索域名，默认和宿主一致
    -e, --env=[]                Set environment variables 设置环境变量
    --entrypoint=              Overwrite the default ENTRYPOINT of the image
    --env-file=[]              Read in a file of environment variables 从指定文件读入环境变量
    --expose=[]                Expose a port or a range of ports
    -h, --hostname=            Container host name 指定容器的hostname
    --help=false                Print usage
    -i, --interactive=false    Keep STDIN open even if not attached 以交互模式运行容器，通常与 -t 同时使用
    --ipc=                      IPC namespace to use
    -l, --label=[]              Set meta data on a container
    --label-file=[]            Read in a line delimited file of labels
    --link=[]                  Add link to another container
    --log-driver=              Logging driver for container
    --log-opt=[]                Log driver options
    --lxc-conf=[]              Add custom lxc options
    -m, --memory=              Memory limit
    --mac-address=              Container MAC address (e.g. 92:d0:c6:0a:29:33)
    --memory-swap=              Total memory (memory + swap), '-1' to disable swap
    --name=                    Assign a name to the container 为容器指定一个名称
    --net=bridge                Set the Network mode for the container  指定容器的网络连接类型，支持 bridge/host/none/container:<name|id> 四种类型
    --oom-kill-disable=false    Disable OOM Killer
    -P, --publish-all=false    Publish all exposed ports to random ports
    -p, --publish=[]            Publish a container's port(s) to the host
    --pid=                      PID namespace to use
    --privileged=false          Give extended privileges to this container
    --read-only=false          Mount the container's root filesystem as read only
    --restart=no                Restart policy to apply when a container exits
    --rm=false                  Automatically remove the container when it exits
    --security-opt=[]          Security Options
    --sig-proxy=true            Proxy received signals to the process
    -t, --tty=false            Allocate a pseudo-TTY 为容器重新分配一个伪输入终端，通常与 -i 同时使用
    -u, --user=                Username or UID (format: <name|uid>[:<group|gid>])
    --ulimit=[]                Ulimit options
    --uts=                      UTS namespace to use
    -v, --volume=[]            Bind mount a volume
    --volumes-from=[]          Mount volumes from the specified container(s)
    -w, --workdir=              Working directory inside the container
    ```
