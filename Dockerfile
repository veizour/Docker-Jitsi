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

RUN apt-get update
RUN add-apt-repository ppa:ondrej/php
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mc tmux wget systemd
RUN apt install openjdk-8-jre-headless -y
RUN apt install nginx -y

#First install the Jitsi repository key onto your system:
RUN wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -

#Create a sources.list.d file with the repository:
RUN sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"

#Install the full suite:
RUN apt-get install jitsi-meet -y

RUN /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

#or only the packages you need like for example:
#RUN apt-get -y install jitsi-videobridge
#RUN apt-get -y install jicofo
#RUN apt-get -y install jigasi

# Expose Ports
EXPOSE 80 443 10000 20000

# The www directory and proxy config location
VOLUME ["/config", "/logs"]
