FROM ubuntu:18.04

# Dependencias
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install git -y \
	qt5-default \
	nano \
	net-tools \
	iputils-ping \
	sudo \
	wget \
	python3-pip \
	alien \
	xvfb \
	&& apt-get clean
RUN pip3 install gdown
RUN cd /home && mkdir labview-install && cd labview-install \ 
	&& gdown --id 1Md4w7Mj6LBPk39HKzoPMRvjV71JLtSgc
RUN tar -xvzf lv2021-runtime.tgz && ./INSTALL
RUN cd /home && git clone https://github.com/roboime/SSL_AI.git && cd SSL_AI && git checkout larc2021_fixBugsMerge && git pull \
	&& cd .. && chmod -R 777 SSL_AI
EXPOSE 20011/udp

