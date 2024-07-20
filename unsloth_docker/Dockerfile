# 使用指定的基础镜像
FROM harbor.lins.lab/library/moe_test:v1.0

# 安装 Python 3.9 和 virtualenv 工具
RUN apt-get update && \
    apt-get install -y python3.9 python3.9-dev python3.9-distutils python3.9-venv && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.9

# 安装 virtualenv
RUN python3.9 -m pip install virtualenv
Run pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
