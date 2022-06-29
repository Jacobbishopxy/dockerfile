# Author: Jacob Bishop
#
# Nginx with logging auto separation

FROM  nginx:1.23

# logging folder
RUN   mkdir log

# install logrotate
RUN   apt-get update && apt-get -y install logrotate

# set timezone
ENV   TZ=Asia/Shanghai
RUN   ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

