FROM ubuntu

LABEL version="1.0" maintainer="Maciej Michalski <maciej.michalsk@gmail.com>"

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:nginx/stable &&\
  apt-get install -y byobu curl git htop man unzip vim wget git nano && \
  rm -rf /var/lib/apt/lists/*

ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

ENV HOME /root

WORKDIR /root

CMD ["bash"]

EXPOSE 80
EXPOSE 443
