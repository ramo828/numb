#! /bin/bash
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0;38m'
NOCOLOR='\033[0m' 
termuxDir="/data/data/com.termux/files/usr/bin"
binFile="numb"
bKey="eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjQ4OTk1NDIyfQ.JajnmTqjOg7clq8Mkv6FsK3Sa4Q4AYzT8Q0kddOEznIBy8mguAOuuDbWCavKdgineRJRSPAIPhvMGbXCZDfmLw"
url="https://github.com/ramo828"
slash="/"
comFile="numb.git"

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
mkdir myPro
cd myPro
#--------------------------------------------------------------
sleep 1
yes | pkg upgrade
sleep 1;
echo 'Xəta baş verərsə kodu yenidən çalışdırın'
yes | pkg install curl clang zip python git make libxslt
sleep 3
pip install lxml
pip install requests
pip install Cython
pip install --upgrade pip setuptools
pip install bs4
pip install --upgrade pip
pip install tqdm
clear
git clone $url$slash$comFile
cd numb
echo "${GREEN}"
touch setup.py
echo "#############################################################"
echo "from setuptools import setup" >> setup.py
echo "from Cython.Build import cythonize" >> setup.py
echo "setup(" >> setup.py
echo "    ext_modules = cythonize(\"pyx/bklib.pyx\")," >> setup.py
echo "    compiler_directives={'language_level' : 3}" >> setup.py
echo ")"  >> setup.py
#### Python Lib
echo "setup(" >> setup.py
echo "    ext_modules = cythonize(\"pyx/numb_lib.pyx\")," >> setup.py
echo "    compiler_directives={'language_level' : 3}" >> setup.py
echo ")"  >> setup.py
echo "setup(" >> setup.py
echo "    ext_modules = cythonize(\"pyx/statistic.pyx\")," >> setup.py
echo "    compiler_directives={'language_level' : 3}" >> setup.py
echo ")"  >> setup.py

touch numb.py
echo "#############################################################"
echo "#RamoSoft" >> numb.py
echo "import pyximport; pyximport.install()" >> numb.py
echo "import pyx.bklib" >> numb.py

touch statistic.py
echo "#############################################################"
echo "#RamoSoft" >> statistic.py
echo "import pyximport; pyximport.install()" >> statistic.py
echo "import pyx.statistic" >> statistic.py
#python setup.py build_ext --inplace

make andro_cmp_ins
mv *.deb ~/
chmod +x $termuxDir$slash$binFile
cd ~/
mkdir -p /sdcard/work
echo "${GREEN}"
rm myPro -rf
numb -k $bKey
numb --update
numb --contactName Metros
numb -a author
numb --version
numb --help
