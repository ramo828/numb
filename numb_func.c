#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "lib/numb.h"

char* upc = "sudo apt-get update";
char* termuxCommand = "termux-setup-storage";
char* upAllApps = "yes | pkg install git make python wget termux* *-repo -y";
char* upGrade = "yes | apt-get upgrade -y && apt-get dist-upgrade -y && pkg update -y";
char* exec = "mv *.data /data/data/com.termux/files/usr/bin/";
char* reInstallExec = "curl https://raw.githubusercontent.com/ramo828/numb/main/setup.sh | dash - ";
char bKeyBegin[255] = "Bearer ";
char configPath[255] = ".config/";
char* path;
char* rmListFiles[100] = {
"rm /data/data/com.termux/files/usr/bin/numb",
"rm /data/data/com.termux/files/usr/bin/numb.py",
"rm /data/data/com.termux/files/usr/bin/bKey.data",
"rm -rf .config",
"rm -rf /data/data/com.termux/files/usr/bin/build",
"rm -rf /data/data/com.termux/files/usr/bin/pyx",
"rm -rf .pyxbld"};

// Bilirəm daha qısa kod ilı bu işi həll etmək olardı ancaq tənbəllik elədim :)

void update() {
		system(termuxCommand);
		sleep(1);
	      	system(upc);
                sleep(1);
                system(upAllApps);
                sleep(1);
                system(upGrade);
                sleep(1);
                printf("\nGüncəllənmə tamamlandı!\n");
}

void removeApp(){
	char ansver;
	printf("\n\t\tProgram silinəcək! Əminsiniz?\n\n\t--------------\t[y][n] --------------\n\t\t\t>> ");
	scanf("%c",&ansver);
	if(ansver == 'y'){
		for(int i = 0; i<=6; i++){
			printf("%s\n",rmListFiles[i]);
			system(rmListFiles[i]);
		}
		printf("\n\t[Silindi]\n");
	}
	else if(ansver == 'n')
		printf("\n\t[İmtina edildi]\n");
	else
		printf("\n\t[Bilinməyən cavab]\n");
}


void mkDir(char *dir){
	struct stat st = {0};
	if (stat(dir, &st) == -1) {
               mkdir(dir, 0700);
        }

}

char* getDir() {
   char cwd[PATH_MAX];
   if (getcwd(cwd, sizeof(cwd)) != NULL) {
       path=cwd;
       return path;
 } else {
       perror("getcwd() error");
       return "";
      }

}

void version() {
	printf("Version %s-%s\n",__VERSION_APP__,__TIME__);
	#if __ANDROID__
	printf(" Cihaz Android\n");
	#elif __linux__
	printf(" Cihaz Linux\n");
	#elif __WIN32
	printf(" Cihaz Windows 32bit\n");
	#elif __WIN64
        printf(" Cihaz Windows 64bit\n");
	#elif __CYGWIN__
        printf(" Cihaz Windows CYGWIN\n");
	#elif __UNIX__
        printf(" Cihaz Unix\n");
	#else
	printf(" Taninmayan cihaz\n");
	#endif
}
void writeKey(char* key) {
	FILE *keyFile = fopen("bKey.data","w");
	fprintf(keyFile, "%s",strcat(bKeyBegin,key));
	fclose(keyFile);
	system(exec);
}


void writeConfig(char* config, char* value) {
        FILE *confFile = fopen(strcat(configPath,config),"w");
        fprintf(confFile, "%s",value);
        fclose(confFile);
}


void reInstall(){
	removeApp();
	system(reInstallExec);
}

// Trinity
void  author(){
	char *bilgi[] = {"\tMüəllif: Ramiz Məmmədli",
			"\tFacebook: http://fb.me/no.name666828",
			"\tInstagram: Ramiz828",
			"\tGithub: Ramo828",
			"\tWhatsapp: (+994) 55 830 27 66",
			"\tE-mail: illegalism666@gmail.com"};
	int length = sizeof(bilgi) / sizeof(*bilgi) - 1;
	for(int i= 0; i<=length; i++){
			printf("%s\n",bilgi[i]);
			}
}

void phone(){
	char *bilgi[] = {"getprop ro.product.vendor.model",
			"getprop ro.product.vendor.brand",
			"getprop ro.product.vendor.device",
			"getprop ro.product.build.date",
			"getprop ro.product.build.fingerprint",
			"getprop ro.product.build.version.release",
			"getprop ro.product.cpu.abi",
			"getprop ro.product.locale",
			"getprop ro.product.locale.language",
			"getprop ro.product.locale.region"};
        int length = sizeof(bilgi) / sizeof(*bilgi) - 1;
	for(int i= 0; i<=length; i++){
			system("echo \"--------------------------\"");
                        system(bilgi[i]);
                        }

}

void code() {
	char *bilgi[] = {"python --version",
			"gcc --version",
			"bash --version"
			};
	int length = sizeof(bilgi) / sizeof(*bilgi) - 1;
        for(int i= 0; i<=length; i++){
                        system("echo \"--------------------------\"");
                        system(bilgi[i]);
                        }


}
// Trinity
