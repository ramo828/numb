from datetime import datetime

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
print(passw)