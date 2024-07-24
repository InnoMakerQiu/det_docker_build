#  这里我就不重新build 镜像，而是拉取我自己build好的镜像
FROM harbor.lins.lab/library/moe_test:v2.0

RUN apt-get update && apt-get install -y libaio-dev && \
    apt-get -y install python-dev python3-dev

# 克隆 CUTLASS 库到指定目录
RUN git clone https://github.com/NVIDIA/cutlass.git /opt/cutlass

# 设置 CUTLASS_PATH 环境变量
ENV CUTLASS_PATH=/opt/cutlass

COPY pip_requirements.txt /tmp/pip_requirements.txt
RUN pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple &&\
    pip install -r /tmp/pip_requirements.txt

# 克隆并安装 APEX
RUN git clone https://github.com/NVIDIA/apex /workspace/apex && \
    cd /workspace/apex && \
    pip install packaging && \
    pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" ./ && \
    cd /workspace && \
    rm -rf /workspace/apex

RUN pip install ntlk

# 克隆并安装 TransformerEngine
# RUN git clone --branch stable --recursive https://github.com/NVIDIA/TransformerEngine.git /workspace/TransformerEngine && \
#   cd /workspace/TransformerEngine && \
#   export NVTE_FRAMEWORK=pytorch && \
#   pip install . && \

# 复制 TransformerEngine 目录到 Docker 镜像中
# COPY TransformerEngine /workspace/TransformerEngine

# 设置工作目录
# WORKDIR /workspace/TransformerEngine

# 设置框架环境变量（可选）
# ENV NVTE_FRAMEWORK=pytorch

# 安装 TransformerEngine
# RUN pip install .
