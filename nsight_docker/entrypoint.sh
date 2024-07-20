#!/bin/bash
set -e

# 启动 dbus 服务
sudo service dbus start

# 启动 firewalld 服务
sudo service firewalld start

# 打开端口 22 和 45555
sudo firewall-cmd --permanent --add-port=22/tcp
sudo firewall-cmd --permanent --add-port=45555/tcp

# 重新加载防火墙配置
sudo firewall-cmd --reload

# 保持容器运行
tail -f /dev/null
