FROM phusion/baseimage:0.11
MAINTAINER veizour

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME            /root
ENV LC_ALL          C.UTF-8
ENV LANG            en_US.UTF-8
ENV LANGUAGE        en_US.UTF-8
ENV TERM xterm


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home


RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mc tmux wget

#First install the Jitsi repository key onto your system:
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -

#Create a sources.list.d file with the repository:
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"

#Update your package list:
sudo apt-get -y update

#Install the full suite:
sudo apt-get -y install jitsi-meet

#or only the packages you need like for example:
#sudo apt-get -y install jitsi-videobridge
#sudo apt-get -y install jicofo
#sudo apt-get -y install jigasi
