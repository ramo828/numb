#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "lib/numb.h"

//Short Comand
char* vShort = "-v";
char* uShort = "-u";
char* hShort = "-h";
char* gShort = "-d";
char* kShort = "-k";
char* reInstallShort = "-re";
// Long command
char* vCommand = "--version";
char* upCommand = "--update";
char* hCommand = "--help";
char* kCommand = "--key";
char* gCommand = "--display";
char* reInstallExec = "--reinstall";
// Message
char* hMessage = "\t Created by Mammadli Ramiz\n\t Version: 1.5.2\n \t Programı çaliştırmaq uçün: \"numb\" \n\t Programı yeniləmək üçün: \"numb --update və ya -u\"\n\t Yardım almaq üçün: \"numb --help və ya -h\"\n\t Key yükləmək üçün: \"numb --key key və ya numb -k key\"\n\t Grafik mod: \"numb --display true və ya numb -d true\"\n\t Versiyaya baxmaq uçün: \"numb --version və ya -v\"\n";
// Execute Command
char* pyc = "python /data/data/com.termux/files/usr/bin/numb.py";
// Main
int main(int argc, char *argv[]) {
	if( argc == 2 ) {
	      	if(!strcmp(upCommand,argv[1]) | !strcmp(uShort,argv[1])){
                              	update();
		}
		else if(!strcmp(hCommand,argv[1]) | !strcmp(hShort,argv[1])){
                              printf("%s",hMessage);
		}
		else if(!strcmp(kCommand,argv[1]) | !strcmp(kShort,argv[1]) ){
                        printf("Xətalı giriş.\nNümunə: (main --key key)");
	        }
		else if(!strcmp(vCommand,argv[1]) | !strcmp(vShort,argv[1]) ) {
			version();
		}
	       	else if(!strcmp(gCommand,argv[1]) | !strcmp(gShort,argv[1]) ) {
			printf("\nXətalı əmr\n -d true\n --display true\n");
		}
		else if(!strcmp(reInstallExec,argv[1]) | !strcmp(reInstallShort,argv[1]) ) {
                        reInstall();
                } 
		else {
		printf("Bilinməyən əmr!\n");
		}

   	}
   	else if( argc > 2 ) {
    		if(!strcmp("--key",argv[1])){
			printf("KEY: %s", argv[2]);
			writeKey(argv[2]);
		}
	else if( argc > 2 ) {
    		if(!strcmp(gCommand,argv[1]) | !strcmp(gShort,argv[1])){
			if(!strcmp(argv[2],"true")){
				printf("\nHələlik bu funksiya aktiv deyil");
			}
		}

  	}

  	}
   	else {
      		system(pyc);
   	}
	return 0;
}


