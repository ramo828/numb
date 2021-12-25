import numb_lib as nl
import json
import requests
import os.path
import math
from tqdm import tqdm
import os
import time as tm
category = dict()
categoryKey = "sadə";          # Sade Nomreleri
category["sadə"] = "1429263300716842758";               # Sade key
category["xüsusi1"] = "1579692503636523114";            # Xususi1 key
category["xüsusi2"] = "1579692547752973099";            # Xususi2 key
categoryKey055 = "sadə"        # 099 sade nomreler
#------------------099----------------------------
category["sadə099"] = "1574940031138475856";            # Sade key
category["bürünc"] = "1582551518546595643";             # Burunc key
category["gümüş"] = "1582551485948558941";              # Gumus key
category["qızıl"] = "1582551461421619154";              # Qizil key
category["platin"] = "1582551437850968791";             # Platin key
categoryKey099 = "bürünc"                               # Buruc nomreler
# key = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjQxOTQyNzg0fQ._jbQSTx6dboyyS7Lr1ZDY3cnTW3AlZoEVPQQ5BlS7eeKLmmPTR07JfgzaXGh6Ov2mNYacUXjFEF6lnuv9Juc8Q"
key = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjQyMTE4MjA2fQ.HUJrHKJc2bonr7njVz0IJzvfMSqvICl777yh_SbGh_AxcHUmNAi0lPa0IkpN5TwXhRpxbXQVQBa4T4Dxt5EpBg"
headers = {'content-type': 'application/json, text/plain, */*',          # Content type json
'Accept':'application/json, text/plain, */*',                            # Accept type json
'Accept-Encoding':'gzip, deflate, br',                                   # Encoding gzip compressed data
'Accept-Language':'tr-TR,tr;q=0.9,az-TR;q=0.8,az;q=0.7,en-US;q=0.6,en;q=0.5',
'Authorization':key,
'Connection':'keep-alive'}
url = "https://public-api.azerconnect.az/msbkcposappreservation/api/freemsisdn-nomre/search";

stopFlag = True
nameFile = ""
new = ""
tip = 1
sharp = ""

choise = int(input("\n\t0 - Yükləmə modu\n\t1 - Analiz modu\n>> "))
tip = int(input("\n\t0 - Köhnə data \n\t1 - Yeni data\n >> "))
number = nl.quest1()                                    # Nomreni daxil edin
nl.AI_Select()                                          # Kategoriyalari daxil edin
prefixValue = nl.getPrCt(0)                             # Prefix melumatlarini al
categoryKey = nl.getPrCt(1)                             # Kategoriya keyini al  
prefix = nl.prefixDef()                                 # Prefix deyiskeni

def File(file,appendMode):
    try:
        f = open(file,appendMode)
    except FileNotFoundError:
        raise FileNotFoundError("Fayl tapılmadı")
    return f


def calcData():
    f = File("old.numb","r")
    f1 = File("new.numb","r")
    dataNew = f1.readlines()
    dataOld = f.readlines()
    count = 0
    found = ""
    for d in tqdm(dataOld):
        if(d not in dataNew):
            count=count+1
            found =found+"\t"+d
    print("Tapıldı: "+str(count))
    tm.sleep(5)
    print("\nNomreler: "+"\n"+found)
    f = File("founded.numb","w")
    f.write(found)

def loadTotal():
    totalNumb = ""
    r = requests.get(url, params={"prefix":prefix,"msisdn":number,"categoryId":category[categoryKey],"showReserved":"true","language":"AZ"}, headers=headers)
    totalJSON = json.loads(r.text);
    for tData in totalJSON:
        totalNumb = (tData["totalElements"])
    return totalNumb

            

def dlData():
    global sharp,new
    if(tip == 0):
        nameFile = "old.numb"
    elif(tip == 1):
        nameFile = "new.numb"
    else:
        raise NameError("Seçim mövcud deyil")    
    f = File(nameFile,"w")
    totalElements = math.ceil(loadTotal()/2000)                 # Sehife sayi
    rawTotalElement = loadTotal()                               # Nomre sayi
    for cevir in range(totalElements):                          # Tapilan sehifede nomreleri liste yukle
        sharp=sharp+"#"
        if(cevir+1%40 == 0):
            sharp=sharp+"\n"
        os.system("clear")
        print("Biraz gozleyin...\n")
        print("Sehife sayi: "+str(totalElements)+"\nNomre sayi: "+str(rawTotalElement))
        print(sharp)
        new +=nl.loadData(cevir)                                   # Tapilan sehifedeki umumi nomreler
    f.write(new)
    f.close()
if(choise == 0):
    dlData()
elif(choise == 1):
    calcData()
else:
    raise NameError("Xətalı seçim")
