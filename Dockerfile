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
	alien \
	xvfb \
	&& apt-get clean
RUN cd /home && mkdir labview-install && cd labview-install \ 
	&& wget https://download.ni.com/support/softlib/labview/labview_runtime/2021%20SP1/lv2021SP1runtime-engine-linux.iso \
	&& mkdir /mnt/iso && mount -o loop lv2021SP1runtime-engine-linux.iso /mnt/iso && cd /mnt/iso && ./INSTALL
RUN cd /home && git clone https://github.com/roboime/SSL_AI.git && cd SSL_AI && git checkout larc2021_fixBugsMerge && git pull \
	&& cd .. && chmod -R 777 SSL_AI
EXPOSE 20011/udp

