# 基础镜像 
FROM harbor.lins.lab/library/moe_test:v2.0

RUN cd /tmp && \
    ## docker运行在linux_x86_64上面，并且我们使用的是CLI-only，所以得到下面的网址
    wget https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/2024_4/NsightSystems-linux-cli-public-2024.4.1.61-3431596.deb && \
    apt-get install -y ./NsightSystems-linux-cli-public-2024.4.1.61-3431596.deb && \
    apt-get update && \
    apt-get install -y strace && \
    rm -rf /tmp/*

# 安装必要的工具
RUN apt-get update && apt-get install -y procps
