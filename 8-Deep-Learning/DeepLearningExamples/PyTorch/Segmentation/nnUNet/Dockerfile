ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:21.02-py3
FROM ${FROM_IMAGE_NAME} 

ADD ./triton/requirements.txt /
RUN pip install --disable-pip-version-check -r /requirements.txt
RUN apt-get update && apt-get install -y libb64-dev libb64-0d

ADD ./requirements.txt /
RUN pip install --upgrade pip
RUN pip install --disable-pip-version-check -r /requirements.txt
RUN pip install monai==0.7.0 --no-dependencies
RUN pip install numpy --upgrade
RUN pip install nvidia-pyindex==1.0.9
RUN pip install nvidia-dlprof==1.2.0
RUN pip install nvidia_dlprof_pytorch_nvtx==1.2.0
RUN pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/ nvidia-dali-cuda110==1.5.0

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -qq awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws

WORKDIR /workspace/nnunet_pyt
ADD . /workspace/nnunet_pyt 
