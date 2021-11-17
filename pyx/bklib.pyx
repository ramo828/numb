#__________                        _________________  ______________________
#\______   \_____    _____   ____ /   _____/\_____  \ \_   _____/\__    ___/
# |       _/\__  \  /     \ /  _ \\_____  \  /   |   \ |    __)    |    |   
# |    |   \ / __ \|  Y Y  (  <_> )        \/    |    \|     \     |    |   
# |____|_  /(____  /__|_|  /\____/_______  /\_______  /\___  /     |____|   
#        \/      \/      \/              \/         \/     \/             
import requests                # Lib
import json                    # Lib
import time as tm              # Lib
import base64 as b64           # Lib
import os.path                 # Lib

termuxBinPath = "/data/data/com.termux/files/usr/bin/"

def keyReadFile():
    if(os.path.exists(termuxBinPath+"bKey.data")):
        bFile = open(termuxBinPath+"bKey.data","r")
        print("#####External key selected#####")
        bKey = bFile.read()
        return str(bKey)
    else:
        print("#####Default key selected#####")
        print(os.path.exists(termuxBinPath+"bKey.data"))
        bKey = bKeyDefault
        return str(bKey)

author_logo = """

    ██████╗  █████╗ ███╗   ███╗ ██████╗ ███████╗ ██████╗ ███████╗████████╗
    ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
    ██████╔╝███████║██╔████╔██║██║   ██║███████╗██║   ██║█████╗     ██║   
    ██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║╚════██║██║   ██║██╔══╝     ██║   
    ██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝███████║╚██████╔╝██║        ██║   
    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝        ╚═╝                                                                       
"""
category = dict();             # Luget yarat
url = "https://public-api.azerconnect.az/msbkcposappreservation/api/freemsisdn-nomre/search";
begin = 0                      # Baslangic prefix
end = 5;                       # Son prefix
err = 0;                       # Xeta
path = "/sdcard/work/";        # Export edilecek qovluq
fileName = "Ramo_SOFT_allContacts.vcf"   # Export edilecek kintakt fayli
contactName = "Metros";        # Default Kontaktlarin adi
dataTwo = "";                  # Data 2
dataThree = "";                # Data 3
count = 0;                     # Saygac
max = 1000*10;                 # Maksimum ne qeder gosterilsin
page = 0;                      # Sehife 0
prefixSel = ["55","99"];       # Prefix secimi
prefixValue = 0;               # Default deyer 0
number = "xxxxx"               # Null data protected
categoryKey = "sadə";          # Sade Nomreler
#------------------055----------------------------
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
categoryKey099 = "bürünc"     # Buruc nomreler
bKeyDefault = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjM2NDY2OTYxfQ.0orKOSoJP8xNQC87jW39px0yhVFtd8ouSDB47DEHa4vT7IRRH0r35D3yGdN6iUCcPLjMvKTFaLbWW7ObwRZxIQ"
bKey = ""
#-------------------------------------------------
headers = {'content-type': 'application/json',          # Content type json
'Accept':'application/json, text/plain, */*',           # Accept type json
'Accept-Encoding':'gzip, deflate, br',                  # Encoding gzip compressed data
'Accept-Language':'tr-TR,tr;q=0.9,az-TR;q=0.8,az;q=0.7,en-US;q=0.6,en;q=0.5',
'Authorization':keyReadFile(),
'Connection':'keep-alive'}
cryptography = """QEBAQEBAQEBAQEBAQEBAQEBAQEBAQChDKU1hbW1hZGxpQFJhbWl6QEBAQEBAQEBAQEBAQEBAQEBAQEBAQAo="""

#-------------------------------------------------
#-------------------------------------------
dataVcard = [
 "BEGIN:VCARD\n"
,"N:","FN:"
,"TEL;TYPE=WORK,MSG:"
,"EMAIL;TYPE=INTERNET:\n"
,"END:VCARD\n"]

w = open(path+fileName,"w")
print(b64.b64decode(cryptography))
print(author_logo)
#-------------------------------------------

#-------------------------------------------------




print("""
##################################################
--------------------------------------------------
\tCreated by Mammadli Ramiz
--------------------------------------------------
##################################################
""")
#-------------------------------------------------
print(""""
--------------------------------------------------
Nömrə kombinasiyasını daxil edin və boş xanalari x ilə tamamlayın.
Məs: 83027xx
--------------------------------------------------
""")

while (len(number) <7):
    if(err > 0):
        print("""
        ------------------------------
        Nömrə düzgün qeyd edilməyib
        ------------------------------
        """)    
    err=err+1;
    number = str(input(">> "))                                      # Sual 1 
prefixValue = int(input("Prefix: (0 - 55; 1 - 99: "));              # Sual 2 055 yoxsa 099?
if(prefixSel[prefixValue] == "55"):
    print("""-------------------------------------\n
    \tKategoriya seç
    \n0 - Sadə\n1 - Xüsusi1\n2 - Xüsusi2\n
    -------------------------------------""")
    cat = int(input(">> "));                                        # Sual 3
    if(cat == 0):
        categoryKey = "sadə"
    elif(cat == 1):
        categoryKey = "xüsusi1"
    elif(cat == 2):
        categoryKey = "xüsusi2"
    else:
        print("""
        ----------------
        Xətalı seçim
        ----------------
        """)
elif(prefixSel[prefixValue] == "99"):
     print("""-------------------------------------\n
    \tKategoriya seç
    \n0 - Sadə\n1 - Bürünc\n2 - Gümüş\n3 - Qızıl\n4 - Platin
    -------------------------------------""")
     cat = int(input(">> "))                                        #Sual 4
     
     if(cat == 0):
        categoryKey = "sadə099"
     elif(cat == 1):
        categoryKey = "bürünc"
     elif(cat == 2):
        categoryKey = "gümüş"
     elif(cat == 3):
        categoryKey = "qızıl"
     elif(cat == 4):
        categoryKey = "platin"
     else:
        print("""
        ------------------
        Xətalı seçim
        -------------------
        """)
else:
        print("""
        -------------------
        Xətalı seçim
        -------------------
        """)
reverseValue = 0;                                                                 # 055 nomrələr seçildikdə kontakta 099
if(prefixValue == 0):                                                             # nömrələri əlavə et
    reverseValue = 1                                                              #
else:                                                                             #
    reverseValue = 0 

intervalMsg = """\n
\t ----Operator aralığını daxil edin----
\t 1) Azərcell  (050)
\t 2) Azərcell  (051)
\t 3) Bakcell   (0{})
\t 4) NarMobile (070)
\t 5) NarMobile (077)
\t 0) Hamısı
\t (Nümunə: 1:3) (Azərcell-dən Bakcell-ə qədər)
""".format(prefixSel[reverseValue])
print(intervalMsg);
rawData = str(input(">> "))
noRawData = ""
if(not rawData.isdigit()):
    noRawData = rawData.split(":")
    begin = int(noRawData[0])-1
    end = int(noRawData[1])
elif(int(rawData) == 0):
    begin = 0
    end = 5
else:
    print("Xəta baş verdi")

#-------------------------------------------------                                                             #
prefix = ["+99450","+99451","+994"+prefixSel[reverseValue],"+99470","+99477"]     # dogru

tm.sleep(1)
print("\n\tMəlumatlar serverdən alınır")
tm.sleep(1)
print("\n\tMəlumatlar işlənir")
tm.sleep(1)

r = requests.get(url, params={"prefix":prefixSel[prefixValue],"msisdn":number,"categoryId":category[categoryKey],"showReserved":"true","size":max,"page":page}, headers=headers)
data = json.loads(r.text);
for i in data:
    dataTwo = (i["freeMsisdnList"])
for pre in range(begin, end):
    for i2 in dataTwo:
        dataFour = str(i2["msisdn"]);
        w.write(dataVcard[0]
		+dataVcard[1]+contactName+"_"+str(count)+"\n"	
		+dataVcard[2]+contactName+"_"+str(count)+"\n"
		+dataVcard[3]+prefix[pre]+dataFour[2:9]+"\n"
		+dataVcard[4]
		+dataVcard[5])
        count=count+1
print("\n\tKontakt Hazırlanır")
tm.sleep(1)
print("\n\tKontaktlar Hazırdır")

print("""
\n
------------------------------------------
Kontaktların sayı: """+ str(count)+"""
------------------------------------------
""")
print("""
Tapılan nomrə sayı: """+ str(count/end)+"""
-----------------------------------------
""")
 #
 #    ██████╗  █████╗ ███╗   ███╗ ██████╗ ███████╗ ██████╗ ███████╗████████╗
 #    ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
 #    ██████╔╝███████║██╔████╔██║██║   ██║███████╗██║   ██║█████╗     ██║   
 #    ██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║╚════██║██║   ██║██╔══╝     ██║   
 #    ██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝███████║╚██████╔╝██║        ██║   
 #    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝        ╚═╝   
 #                                                                          
 #
