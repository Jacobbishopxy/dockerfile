# Centos7 初设设置

## 更新系统
1. 修改DNS
    ```
    vi /etc/resolv.conf
    ```
    例：
    ```
    search 114.114.114.114
    nameserver 192.168.0.10
    ```
2. 更新
    ```
    yum check-update
    yum upgrade
    yum clean all
    yum install nano wget curl net-tools lsof bash-completion tmux
    ```

## 用户设置
1. Backup /etc/sudoers file, run:
    `sudo cp /etc/sudoers /root/sudoers.bak`
2. Edit the /etc/sudoers file on CentOS:
    `sudo visudo`
3. Modify
    ```
    ## Allow root to run any commands anywhere 
    root ALL=(ALL) ALL
    docker ALL=(ALL) ALL 

    ## Allows people in group wheel to run all commands 
    %wheel ALL=(ALL) ALL 
    jacob ALL=(ALL) NOPASSWD:ALL 
    ```

## 创建用户并授权
1. 创建docker用户
`useradd -d /home/docker -m docker`

2. 给docker用户设置密码
`passwd docker`（输入两次密码）

3. \[已设忽略]给/etc/sudoers文件添加写权限
`chmod -v u+w /etc/sudoers`

4. \[已设忽略]给docker用户授root权限，编辑/etc/sudoers 
    `vi /etc/sudoers`
    ```
    ## Allow root to run any commands anywhere
    root ALL=(ALL) ALL
    docker ALL=(ALL) ALL  ##添加这一行
    ```

5. \[已设忽略]取消/etc/sudoers文件写权限
`chmod -v u-w /etc/sudoers` （删除sudoers写权限）
