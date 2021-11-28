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
char* oShort = "-o";
char* rmShort = "-rm";
char* reInstallShort = "-re";
// Long command
char* vCommand = "--version";
char* upCommand = "--update";
char* hCommand = "--help";
char* kCommand = "--key";
char* oCommand = "--output";
char* gCommand = "--display";
char* rmCommand = "--remove";
char* reInstallCommand = "--reinstall";
// Message
char* hm[100] = {"\n\t###Created by Mammadli Ramiz###\n",
			"\tHaqqında [numb --help]\n",
			"\tProgramın versiyası [numb --versiya]\n",
			"\tKey yükləmə [numb --key (key)]\n",
			"\tYeniləmə [numb --reinstall]\n",
			"\tƏlavə paketləri yeniləmə [numb --update]\n",
			"\tProgramı Silmə [--remove]\n",
			"\tGrafik mod [--dispay (true)]\n",
			"\tÇıxarış [--output (qovluq)]\n",  //Gelecekde
			"",  //Elave
			"",  //Funksiyalar
			""}; //Ucun
// Execute Command
char* pyc = "python /data/data/com.termux/files/usr/bin/numb.py";
// Main
int main(int argc, char *argv[]) {
	if( argc == 2 ) {
	      	if(!strcmp(upCommand,argv[1]) | !strcmp(uShort,argv[1])){
                              	update();
		}
		else if(!strcmp(hCommand,argv[1]) | !strcmp(hShort,argv[1])){
                              printf("%s %s %s %s %s %s %s %s %s",hm[0],hm[1],hm[2],hm[3],hm[4],hm[5],hm[6],hm[7],hm[8]);
		}
		else if(!strcmp(rmCommand,argv[1]) | !strcmp(rmShort,argv[1])){
                              removeApp();
                }

		else if(!strcmp(kCommand,argv[1]) | !strcmp(kShort,argv[1]) ){
                        printf("\nXətalı giriş.\nNümunə: (main --key key)\n");
	        }
		else if(!strcmp(vCommand,argv[1]) | !strcmp(vShort,argv[1]) ) {
			version();
		}
	       	else if(!strcmp(gCommand,argv[1]) | !strcmp(gShort,argv[1]) ) {
			printf("\nXətalı əmr\n -d true\n --display true\n");
		}
		else if(!strcmp(reInstallCommand,argv[1]) | !strcmp(reInstallShort,argv[1]) ) {
                        reInstall();
                } 
		else if(!strcmp(oCommand,argv[1]) | !strcmp(oShort,argv[1])){
                        printf("\nXətalı daxil etmə\nnumb--output /sdcard/work/\n");
                }
		else {
		printf("\nBilinməyən əmr!\n");
		}

   	}
   	else if( argc > 2 ) {
    		if(!strcmp(kCommand,argv[1]) | !strcmp(kShort,argv[1])){
			printf("KEY: %s", argv[2]);
			writeKey(argv[2]);
		}
	else if( argc > 2 ) {
                if(!strcmp(oCommand,argv[1]) | !strcmp(oShort,argv[1])){
                        printf("\nQovluq: %s\n", argv[2]);
                        mkDir(".config");
			writeConfig("default.dir",argv[2]);
                }
	}
	else if( argc > 2 ) {
    		if(!strcmp(gCommand,argv[1]) | !strcmp(gShort,argv[1])){
			if(!strcmp(argv[2],"true")){
				printf("\nHələlik bu funksiya aktiv deyil\n");
			}
		}

  	}

  	}
   	else {
      		system(pyc);
   	}
	return 0;
}


