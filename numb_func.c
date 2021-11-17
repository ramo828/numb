#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "lib/numb.h"

char* upc = "sudo apt-get update";
char* termuxCommand = "termux-setup-storage";
char* upAllApps = "pkg install git make python wget termux* *-repo -y";
char* upGrade = "apt-get upgrade -y && apt-get dist-upgrade -y && pkg update -y";
char* exec = "mv *.data /data/data/com.termux/files/usr/bin/";
char bKeyBegin[255] = "Bearer ";


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
void version() {
	printf("\n Version %s-%s\n",__VERSION_APP__,__TIME__);
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

