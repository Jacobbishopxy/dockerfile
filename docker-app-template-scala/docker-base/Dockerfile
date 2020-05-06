# Author: Jacob Bishop

ARG     FUND_IMAGE
ARG     FUND_IMAGE_VERSION

# 以centos为基础镜像
FROM    $FUND_IMAGE:$FUND_IMAGE_VERSION

# 从网上下载 jdk 包
RUN	    yum install -y wget
RUN	    wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
RUN	    tar zxf jdk-8u131-linux-x64.tar.gz
RUN	    mv jdk1.8.0_131 java8

# 设置centos的环境变量
ENV     JAVA_HOME /java8
ENV     CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV     PATH $PATH:$JAVA_HOME/bin

# 设置字符集，防止乱码
ENV     LANG en_US.utf8
ENV     LC_ALL en_US.utf8

# 设置时区
RUN     rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装telnet/ifconfig（用于调测网络使用）
RUN     yum install telnet net-tools -y
