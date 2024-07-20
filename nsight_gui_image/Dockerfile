# 基础镜像 
FROM harbor.lins.lab/library/moe_test:v1.0
# 更新APT源为中国科学技术大学的镜像源，并安装必要的系统依赖
RUN sed -i "s/archive.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && \
    # 更新包列表并升级已安装的包
    apt-get update && \     
    apt-get install -y firewalld dbus netcat-openbsd && \     
    apt-get clean && \     
    rm -rf /var/lib/apt/lists/*
 # 启动firewalld服务 
# 创建必要的目录
RUN mkdir -p /run/dbus /run/systemd
# 启用dbus和firewalld服务
RUN systemctl enable dbus && systemctl enable firewalld

# 设置firewalld服务 
# 复制入口点脚本
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 设置容器入口命令，以便启动dbus和firewalld
CMD ["/usr/local/bin/entrypoint.sh"]