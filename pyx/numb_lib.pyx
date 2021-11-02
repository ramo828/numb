import os.path                 # Lib
import os
termuxBinPath = "/data/data/com.termux/files/usr/bin/"
bKeyDefault = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjM4NDg2MTM1fQ.4W_-TRqw8Yn8LHnwaS5Ql7IF2KciytBaD0tVHe7j3rq6ZXrN2neYfTcQu-IpHmt1swE1QaF4oAkWgpA4wmQCpw"
dirs = os.getcwd()+"/.config/"                           # Oldugun qovluq
ddir = "/sdcard/work/"
def readConfig(conf):
    if(os.path.exists(dirs+conf)):
        config = open(dirs+conf,"r")
        configData = config.read()
        print("OUTPUT: "+configData)
        return configData
    else:
        configData = ddir
        print("OUTPUT: "+configData)
        return configData

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

def logo():
    logo_author= """

        ██████╗  █████╗ ███╗   ███╗ ██████╗ ███████╗ ██████╗ ███████╗████████╗
        ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
        ██████╔╝███████║██╔████╔██║██║   ██║███████╗██║   ██║█████╗     ██║   
        ██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║╚════██║██║   ██║██╔══╝     ██║   
        ██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝███████║╚██████╔╝██║        ██║   
        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝        ╚═╝                                                                       
    """
    return logo_author
