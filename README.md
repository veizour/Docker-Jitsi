# Docker-Jitsi

From https://jitsi.org/downloads/

First install the Jitsi repository key onto your system:
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
Create a sources.list.d file with the repository:
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
Update your package list:
sudo apt-get -y update
Install the full suite:
sudo apt-get -y install jitsi-meet
or only the packages you need like for example:

sudo apt-get -y install jitsi-videobridge
sudo apt-get -y install jicofo
sudo apt-get -y install jigasi
