#__________                        _________________  ______________________
#\______   \_____    _____   ____ /   _____/\_____  \ \_   _____/\__    ___/
# |       _/\__  \  /     \ /  _ \\_____  \  /   |   \ |    __)    |    |   
# |    |   \ / __ \|  Y Y  (  <_> )        \/    |    \|     \     |    |   
# |____|_  /(____  /__|_|  /\____/_______  /\_______  /\___  /     |____|   
#        \/      \/      \/              \/         \/     \/             
############################################################################
import requests                # Lib
import json                    # Lib
import time as tm              # Lib
import numb_lib as nl
import os
import warnings
############################################################################
contactName = "Metros";        # Default Kontaktlarin adi
dataTwo = "";                  # Data 2
dataThree = "";                # Data 3
count = 0;                     # Saygac
prefixValue = 0;               # Default deyer 0
end = 0
warnings.filterwarnings("ignore")
new_data = ""
##############################################################################
################################AZERCELL######################################
def aRun():
    global new_data
    global count
    prefixAz = nl.getAzPrefix()
    nl.numb_run(number)
    new_data = nl.sum_data()
    for pre in range(nl.getAzBegin(),nl.getAzEnd()):
        for n in new_data.split("\n"):
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
    nl.AI_Select()                                          # Kategoriyalari daxil edin
    prefixValue = nl.getPrCt(0)                             # Prefix melumatlarini al
    categoryKey = nl.getPrCt(1)                             # Kategoriya keyini al  
    nl.numLimit()                                           # Nomre alagini daxil et
    begin = nl.getIndex(0)                                  # Nomre baslangic (araliq)
    end = nl.getIndex(1)                                    # Nomre son (araliq)
    reverseValue = nl.getIndex(2)                           # Nomreleri deyisdir. (099 secilende 055, 055 secilende 099 elave et)
    prefix = nl.prefixDef()                                 # Prefix deyiskeni
    r = nl.conBakcell()                                     # Request data
    data = json.loads(r.text);                              # Json load data 1
    for i in data:                                          # Json datasini parcala
        dataTwo = (i["freeMsisdnList"])                     # Json List freeMsisdnList ayir
    for pre in range(begin, end):                           # Nomre araligi 0-5
        for i2 in dataTwo:                                  # freeMsisdnList listdeki melumatlari ayir
            dataFour = str(i2["msisdn"]);                   # Load data 2
            nl.vcardWrite(w,                                # Vcard skelet
            contactName,                                    # Kontakt adi
            prefix,                                         # Prefix
            pre,                                            # Prefix Araligi
            dataFour,                                       # Yekun data
            count)                                          # Kontaktin ad ardicilligi
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
#	print("""Çalışacağınız operator: \n
#       \t0 - Bakcell\n
#       \t1 - Azərcell\n
#	""")

operator = 0 #int(input(">> "))
if(operator == 0):
    print("\n\tBAKCELL\n")
    number = nl.quest1()                                    # Nomreni daxil edin
    bRun()
    nl.banBegin()
    nl.banEnd(count,end)
elif(operator == 1):
   azEnd = nl.getAzEnd()
   print(azEnd)
   print("\n\tAZƏRCELL\n")
   number = nl.quest1()                                    # Nomreni daxil edin
   aRun()
   nl.banBegin()
   nl.banEnd(count,azEnd)
else:
   print("Bilinməyən əmr!")


##############################################################################
print(nl.readConfig(nl.getFP(0))+nl.getFP(1))
##############################################################################
