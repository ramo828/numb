import requests
from bs4 import BeautifulSoup as soup
import time as tm
import warnings
import os
warnings.filterwarnings("ignore")
ssl = False

gozleme = 1/50;                                        # Data alma zamani
h = {"accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
     "accept-encoding":"gzip, deflate, br",
     "accept-language":"tr-TR,tr;q=0.9,az-TR;q=0.8,az;q=0.7,en-US;q=0.6,en;q=0.5",
     "cache-control":"max-age=0",
     "content-length":"65",
     "content-type":"application/x-www-form-urlencoded",
     "dnt":"1",
     "user-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36"
           }

print("Created by Mammadli Ramiz")
tm.sleep(1)
os.system("clear")

number = input("Nomre >> ")
uzunluq = len(number)
if uzunluq > 7:
   print("Xeta")
   exit(1)
elif uzunluq <7:
   print("Xeta")
   exit(1)


def extractData(number,page):
   url = "https://azercellim.com/az/search/"
   num = [number[0],                                     # Split part1                                  
   number[1],number[2],                                  # Split part2 
   number[3],number[4],                                  # Split part3
   number[5],number[6]]                                  # Split part4
   prefix = ["90","50","51","10"]                        # Prefix var
   p = {
   "num1":num[0],                                        # Number Splitter 1
   "num2":num[1],                                        # Number Splitter 2
   "num3":num[2],                                        # Number Splitter 3
   "num4":num[3],                                        # Number Splitter 4
   "num5":num[4],                                        # Number Splitter 5
   "num6":num[5],                                        # Number Splitter 6
   "num7":num[6],                                        # Number Splitter 7
   "prefix":prefix[0],                                   # Prefix
   "send_search":"1"}                                    # Page
   
   r = requests.post(url+str(page),data=p,verify=ssl,headers=h)    # Request Send
   source = soup(r.content,"lxml")
   find = source.findAll("div", attrs={"class":"phonenumber"})
   return find

def soupData(find):
   rawData = ""
   for findData in find:
      rawData=rawData +"\n"+str(findData.text).replace("\n","")
   return rawData

stopFlag = True
count_num = 1
new_data = ""
loading_bar = ""
dot = ""
dot_count = 0
while(stopFlag):
   tm.sleep(gozleme)
   find = extractData(number,count_num)
   sp = soupData(find)
   if(len(sp) == 0):
      if(count_num == 1 and len(sp) == 0):
         print("Melumat yoxdur")
      print("Səhifə sayı: "+str(count_num-1))
      stopFlag = False
   else:
      if(dot_count != 3):
         dot=dot+"."
      else:
         dot_count = 0
         dot = ""
      loading_bar=loading_bar+"#"
      if(count_num%25 == 0):
         loading_bar=loading_bar+"\n"
      os.system("clear")
      print("Biraz gözləyin"+dot)
      print(loading_bar)
      new_data=new_data+str(sp)
   dot_count = dot_count +1
   count_num=count_num+1

print(new_data)



