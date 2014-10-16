#
# Ubuntu Dockerfile
#
# https://github.com/jhvaranda/ubuntu
#

# Pull base image.
FROM ubuntu:trusty

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y unattended-upgrades && \
  apt-get autoclean -y && \
  apt-get clean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Add Unattended configuration
ADD unattended/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
ADD unattended/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

ENV http_proxy  
ENV https_proxy  
