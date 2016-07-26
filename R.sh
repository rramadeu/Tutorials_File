#/bin/bash
# Autor: Carlos R. Macedonio
# Objetivo: Criar uma pasta de armazenamento comum a toda a sala Roland
# Obs.: execute como root
# Update: 25/jul/2016
#
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y 
apt-get install -y language-pack-gnome-pt language-pack-pt-base
apt-get install -y ntp ntp-doc synaptic gdebi gdebi-core
apt-get install -y ubuntu-restricted-extras
apt-get install -y joe html2text
apt-get install -y libavcodec-extra
apt-get install -y icedtea-8-plugin openjdk-8-jre
apt-get install -y openjdk-8-jdk
apt-get remove gnome-screensaver -y
apt-get install libxml2-dev
apt-get install libcurl4-openssl
apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra -y
apt-get install bleachbit vlc -y
apt-get install p7zip p7zip-full p7zip-rar adobe-flashplugin ethtool -y
# INSTALAR R
#
echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
apt-get update
apt-get install r-base r-base-dev -y
$ install R-Studio
#wget https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
gdebi -n rstudio-0.99.903-amd64.deb
#rm rstudio-0.99.903-amd64.deb
