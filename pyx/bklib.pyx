#__________                        _________________  ______________________
#\______   \_____    _____   ____ /   _____/\_____  \ \_   _____/\__    ___/
# |       _/\__  \  /     \ /  _ \\_____  \  /   |   \ |    __)    |    |   
# |    |   \ / __ \|  Y Y  (  <_> )        \/    |    \|     \     |    |   
# |____|_  /(____  /__|_|  /\____/_______  /\_______  /\___  /     |____|   
#        \/      \/      \/              \/         \/     \/             
############################################################################
from cProfile import run                                     # Lib
import requests                                              # Lib
import json                                                  # Lib
import time as tm                                            # Lib
import numb_lib as nl                                        # LocalLib
import os                                                    # Lib
import warnings                                              # Lib
from tqdm import tqdm                                        # Lib
import math                                                  # Lib
from datetime import datetime                                # Lib

############################################################################
contactName = ""
if len(nl.readConfig("contact.name")) > 0:
    contactName = nl.readConfig("contact.name") 
else:
    contactName = "Metros"
dataTwo = "";                                               # Data 2
count = 0;                                                  # Saygac
prefixValue = 0;                                            # Default deyer 0
end = 0
warnings.filterwarnings("ignore")
new_data = ""
try:
    status = int(nl.readConfig("user.status"))
except ValueError:
    status = 0
##############################################################################
################################AZERCELL######################################
def aRun():
    global new_data
    global count
    prefixAz = nl.getAzPrefix()
    nl.numb_run(number)
    new_data = nl.sum_data()
    for pre in range(nl.getAzBegin(),nl.getAzEnd()):
        for n in tqdm(new_data.split("\n")):
            dataFour = n
            nl.vcardWrite(w,                                # Vcard skelet
            contactName,                                    # Kontakt adi
            prefixAz,                                       # Prefix
            pre,                                            # Prefix Araligi
            dataFour,                                       # Yekun data
            count)                                          # Kontaktin ad ardicilligi
            count=count+1


##############################################################################
#################################BAKCELL######################################
def bRun():
    global count
    global end
    global dataTwo
    
    nl.AI_Select()                                          # Kategoriyalari daxil edin
    #prefixValue = nl.getPrCt(0)                             # Prefix melumatlarini al
    nl.numLimit()                                           # Nomre alagini daxil et
    begin = nl.getIndex(0)                                  # Nomre baslangic (araliq)
    end = nl.getIndex(1)                                    # Nomre son (araliq)
    #reverseValue = nl.getIndex(2)                           # Nomreleri deyisdir. (099 secilende 055, 055 secilende 099 elave et)
    prefix = nl.prefixDef()                                 # Prefix deyiskeni
    categoryKey = nl.getPrCt(1)                             # Kategoriya keyini al  
    lim = nl.loadTotal(categoryKey)/2000
    totalElements = math.ceil(lim)                          # Sehife sayi
    rawTotalElement = nl.loadTotal(categoryKey)             # Nomre sayi

    print("t"+str(totalElements))
    for allNumber in range(totalElements):
        os.system("clear")
        print("Biraz gozleyin...\n")
        print("Sehife sayi: "+str(totalElements)+"\nNomre sayi: "+str(rawTotalElement))
        dataTwo +=nl.loadData(allNumber)
        for dataTree in tqdm(dataTwo.split("\n")):
            # nl.vcardWrite(w,contactName,prefix,pre,dataTree,count)
            nl.fileWrite(w,dataTree+"\n")
            count=count+1


##############################################################################
##############################APP_RUN#########################################
author_logo = nl.logo()                                 # Muellif logosu
w = nl.fileControl()                                    # config file control
print("""
    ##################################################
    --------------------------------------------------
    \tCreated by Mammadli Ramiz
    --------------------------------------------------
    ##################################################
    """)
if(status == 1):
    print("\n\t-----------ProMod-----------\n")
    print("""
           Çalışacağınız operator: \n
            \t0 - Bakcell\n
            \t1 - Azərcell\n
	    """)

    operator = int(input(">> "))
else:
    operator = 0

day = ["Ba","Cb","Dc","Ed","Fe","Gf","Hg","Jh","Kj","Lk",
        "Ml","Nm","On","Po","Qp","Rq","Sr","Ts","Ut","Vu"
        "Yx","Zy","0z","1y","2x","3v","4u","5t","6s","7r","8q"]

hour = ["%$","!@","~$","@&","+?","><","*&","#%","!#","&!",
        "Ra","Mi","ZB","Er","iL","An","kA","rA","sh","eK",
        "iA","zE","Rb","CN"]
minute = [
    	"aZ","bW","cX","dY","eV","fU","gT","hS","jR","Qk",
        "Pl","mI","nH","oG","pJ","qK","rL","sO","tN","uM",
        "vF","xE","yD","zC","wB","&A","%B","$C","@D","!E",
        "~F","?G",",H",">I","<J","00","08","07","04","03",
        "20","14","19","70","74","01","02","09","10","11",
        "12","99","88","77","66","55","44","33","22","11"
]

dtm  = datetime.now()
dday = dtm.day
dhour = dtm.hour
dminute = dtm.minute
passw = day[dday]+hour[dhour]+minute[dminute]
runS = False
global runS
if nl.readConfig("data.key") == 'busted':
    runS = True
else:
    print("Key'i daxil edin: ")
    key = input(">> ")
    if(key == passw):
        runS = True
if(runS):
    if(len(nl.readConfig("data.key")) < 5):
        print("Key təsdiq edilib")
    else:
	#os.system("mkdir .config")
        os.system("numb busted")
    print("Key doğru daxil edilib\n\n")

    if(operator == 0):
        print("\n\tBAKCELL\n")
        number = nl.quest1()                                    # Nomreni daxil edin
        bRun()
        nl.banBegin()
        nl.banEnd(count,1)
    elif(operator == 1):
        azEnd = nl.getAzEnd()
        print(azEnd)
        print("\n\tAZƏRCELL\n")
        number = nl.quest1()                                    # Nomreni daxil edin
        aRun()
        nl.banBegin()
        nl.banEnd(count,azEnd)
else:
        print("Key xetalıdır")

##############################################################################
print(nl.readConfig(nl.getFP(0))+nl.getFP(1))
##############################################################################
