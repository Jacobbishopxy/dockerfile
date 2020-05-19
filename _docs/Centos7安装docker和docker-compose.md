# Centos7 安装docker和docker-compose

## 1. Docker
**由Repository安装**

1). 添加repository
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

2). 安装最新docker
```
sudo yum install docker-ce docker-ce-cli containerd.io
```

3). \[可选]安装指定版本docker
```
yum list docker-ce --showduplicates | sort -r
```
根据上面列出的版本修改下方的`<VERSION_STRING>`
```
sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
```
4). 启动docker服务
```
sudo systemctl start dockerd
```
设置开机启动
```
sudo systemctl enable docker.service
```
5). 更新docker
```
sudo yum install docker-ce docker-ce-cli containerd.io
```
## 2. Docker-compose

1). 安装最新文档版
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

2). 设置文件权限
```
sudo chmod +x /usr/local/bin/docker-compose
```

3). 删除
```
sudo rm /usr/local/bin/docker-compose
```
