import numb_lib as nl



import json
import requests
import os.path
import math
from tqdm import tqdm
import os
import time as tm

key = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjQxOTQyNzg0fQ._jbQSTx6dboyyS7Lr1ZDY3cnTW3AlZoEVPQQ5BlS7eeKLmmPTR07JfgzaXGh6Ov2mNYacUXjFEF6lnuv9Juc8Q"
headers = {'content-type': 'application/json, text/plain, */*',          # Content type json
'Accept':'application/json, text/plain, */*',                            # Accept type json
'Accept-Encoding':'gzip, deflate, br',                                   # Encoding gzip compressed data
'Accept-Language':'tr-TR,tr;q=0.9,az-TR;q=0.8,az;q=0.7,en-US;q=0.6,en;q=0.5',
'Authorization':key,
'Connection':'keep-alive'}
url = "https://public-api.azerconnect.az/msbkcposappreservation/api/freemsisdn-nomre/search";

stopFlag = True
number = "574xxx4"
nameFile = ""
new = ""
tip = 1
choise = 0
sharp = ""

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
    r = requests.get(url, params={"prefix":"55","msisdn":number,"categoryId":"1429263300716842758","showReserved":"true","language":"AZ"}, headers=headers)
    totalJSON = json.loads(r.text);
    for tData in totalJSON:
        totalNumb = (tData["totalElements"])
    return totalNumb

def loadData(page):
    r = requests.get(url, params={"prefix":"55","msisdn":number,"categoryId":"1429263300716842758","showReserved":"true","language":"AZ","page":page,"size":"2000"}, headers=headers)
    dataFour = ""
    dataTwo = ""
    data = json.loads(r.text);
    for i in data:
        dataTwo = (i["freeMsisdnList"])
    for i2 in dataTwo:
        dataFour = dataFour+str(i2["msisdn"])+"\n"
    return dataFour
            

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
        new +=loadData(cevir)                                   # Tapilan sehifedeki umumi nomreler
    f.write(new)
    f.close()
if(choise == 0):
    dlData()
elif(choise == 1):
    calcData()
else:
    raise NameError("Xətalı seçim")
