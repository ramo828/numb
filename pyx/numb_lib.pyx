import os.path                 # Lib
import os
#termuxBinPath = "/data/data/com.termux/files/usr/bin/"
bKeyDefault = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJNQUlOIiwiZXhwIjoxNjQwMjE0NjAxfQ.eNQhBoIjyiUy1ZUbaSvuGb6Gxf_668ZetfPOBV3WQNtlim9kgsP2nDM8ej2KCd5-ue1O8BnjnCZz_aP6LN70Rw"
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
    if(os.path.exists("bKey.data")):
        bFile = open("bKey.data","r")
        print("#####External key selected#####")
        bKey = bFile.read()
        return str(bKey)
    else:
        print("#####Default key selected#####")
        print(os.path.exists("bKey.data"))
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
