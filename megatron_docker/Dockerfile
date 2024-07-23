#  这里我就不重新build 镜像，而是拉取我自己build好的镜像
FROM harbor.lins.lab/library/moe_test:v2.0

RUN apt-get update && apt-get install -y libaio-dev && \
    apt-get -y install python-dev

# 克隆 CUTLASS 库到指定目录
RUN git clone https://github.com/NVIDIA/cutlass.git /opt/cutlass

# 设置 CUTLASS_PATH 环境变量
ENV CUTLASS_PATH=/opt/cutlass

COPY pip_requirements.txt /tmp/pip_requirements.txt
RUN pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple &&\
    pip install -r /tmp/pip_requirements.txt



# # Install Miniconda
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
#     && bash ~/miniconda.sh -b -p $HOME/miniconda \
#     && rm ~/miniconda.sh \
#     && echo "export PATH=$HOME/miniconda/bin:$PATH" >> ~/.bashrc \
#     && /bin/bash -c "source ~/.bashrc" \
#     && conda init bash

# # Update conda
# RUN conda update -n base -c defaults conda -y

# # Create a new Conda environment with the specified packages
# RUN conda create -n myenv python=3.8 -y 

