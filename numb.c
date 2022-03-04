#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>

#include "lib/numb.h"
int LinuxVar = 1;
int AndroidVar = 0;
int Target = 0;
//Short Comand
char* vShort = "-v";
char* uShort = "-u";
char* hShort = "-h";
char* gShort = "-d";
char* kShort = "-k";
char* oShort = "-o";
char* aShort = "-a";
char* rmShort = "-rm";
char* stsShort = "-sts";
char* reInstallShort = "-re";
char* cnShort = "-cn";
char* botShort = "-bot";
char* statShort = "-stat";
// Long command
char* statCommand = "--statistic";
char* vCommand = "--version";
char* upCommand = "--update";
char* hCommand = "--help";
char* kCommand = "--key";
char* oCommand = "--output";
char* abCommand = "--about";
char* gCommand = "--display";
char* rmCommand = "--remove";
char* stsCommand = "--status";
char* reInstallCommand = "--reinstall";
char* trinityCommand[] = {"phone","code","author"};
char* cnCommand = "--contactName";
char* robotCommand = "--robot";
// Message
char* hm[100] = {"\n\t### Created by Mammadli Ramiz ###\n\n",
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
char* pyc[] = {"python /data/data/com.termux/files/usr/bin/numb.py", // 0
		"python /usr/local/bin/numb.py"};                    // 1
char* pyst[] = {"python /data/data/com.termux/files/usr/bin/statistic.py",
		"python /usr/local/bin/statistic.py"};
// Main
int main(int argc, char *argv[]) {
	// variables to store the date and time components
    	int hours, minutes, seconds, day, month, year;
 
    	// `time_t` is an arithmetic time type
    	time_t now;
 
    	// Obtain current time
    	// `time()` returns the current time of the system as a `time_t` value
    	time(&now);

	struct tm *local = localtime(&now);
 
   	hours = local->tm_hour;         // get hours since midnight (0-23)
    	minutes = local->tm_min;        // get minutes passed after the hour (0-59)
    	seconds = local->tm_sec;        // get seconds passed after a minute (0-59)
 
    	day = local->tm_mday;            // get day of month (1 to 31)
    	month = local->tm_mon + 1;      // get month of year (0 to 11)
    	year = local->tm_year + 1900;   // get year since 1900
 


		#if __ANDROID__
                printf("\n-----------OS: Android-----------\n");
                Target = AndroidVar;
                #elif __linux__
                printf("\n-----------OS: Linux-----------\n");
                mkDir(".config");
                writeConfig("default.dir",get_homedir());
                Target = LinuxVar;
                #elif __UNIX__
                printf("\n-----------Unix secildi-----------\n");
                #endif


	if( argc == 2 ) {
	      	if(!strcmp(upCommand,argv[1]) | !strcmp(uShort,argv[1])){
                              	update();
		}
		else if(!strcmp(statCommand,argv[1]) | !strcmp(statShort,argv[1])){
				system(pyst[Target]);
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
		else if(!strcmp(abCommand,argv[1]) | !strcmp(aShort,argv[1])){
                        printf("\nXətalı əmr!\nnumb --about [phone] ,[code], [author]");
                }  
		else if(!strcmp(oCommand,argv[1]) | !strcmp(oShort,argv[1])){
                        printf("\nXətalı daxil etmə\nnumb--output /sdcard/work/\n");
                }
		else if(!strcmp(stsCommand,argv[1]) | !strcmp(stsShort,argv[1]))		{
			printf("\nAxşam axşam bu ne xətadı :)");
		}
		else if(!strcmp(cnCommand,argv[1]) | !strcmp(cnShort,argv[1])){
                        printf("\nXətalı əmr!\n numb --contactName ad");
                }
		 else if(!strcmp(robotCommand,argv[1]) | !strcmp(botShort,argv[1])){
			if(Target == 1){
                        printf("\nBot Çalısdırılır...");
			system("java -jar /usr/local/bin/robo.jar");
		}
			else {
				printf("\nMobil cihaz dəstəklənmir\n");
			}
                }

		else {
		printf("\nBilinməyən əmr!\n");
		}

   	}
   	else if( argc > 2 ) {




		if(!strcmp(robotCommand,argv[1]) | !strcmp(botShort,argv[1])){
			if(Target == 0)
                                printf("\nMobil cihaz dəstəklənmir\n"); 
			else {
			if(!strcmp("min",argv[2])){
				printf("Mesaj 2 seçildi\n");
				if(Target == 1){
                        	printf("\nBot Çalısdırılır...");
                        	system("java -jar /usr/local/bin/robo.jar min");
                		}
			}
			else if(!strcmp("099",argv[2])){
				printf("Mesaj 099 seçildi\n");
				if(Target == 1){
                        	printf("\nBot Çalısdırılır...");
                        	system("java -jar /usr/local/bin/robo.jar 099");
                		}
			}
			}   
		
		}

    		if(!strcmp(kCommand,argv[1]) | !strcmp(kShort,argv[1])){
			printf("KEY: %s\n", argv[2]);
			writeKey(argv[2]);
		}
                if(!strcmp(oCommand,argv[1]) | !strcmp(oShort,argv[1])){
                        printf("\nQovluq: %s\n", argv[2]);
                        mkDir(".config");
			writeConfig("default.dir",argv[2]);
		}
    		if(!strcmp(gCommand,argv[1]) | !strcmp(gShort,argv[1])){
			if(!strcmp(argv[2],"true")){
				printf("\nHələlik bu funksiya aktiv deyil\n");
			}
		}
		if(!strcmp(abCommand,argv[1]) | !strcmp(aShort,argv[1])){
		        int length = sizeof(trinityCommand) / sizeof(*trinityCommand) - 1;
			for(int i=0; i<=length; i++)
				if(!strcmp(argv[2],trinityCommand[i])){
					if(i == 0)
						phone();
					else if(i == 1)
						code();
					else if(i == 2)
						author();
					else
						printf("Error");
				}
		}
	
		if(!strcmp(stsCommand,argv[1]) | !strcmp(stsShort,argv[1])){
			if(!strcmp(argv[2],"proUser")){
				 mkDir(".config");
                        	 writeConfig("user.status", "1");
			}
			else {
			printf("Yenə bir xata :(");
			}
		}

			if(!strcmp(cnCommand,argv[1]) | !strcmp(cnShort,argv[1])){                              mkDir(".config");
                                writeConfig("contact.name", argv[2]);
				printf("Kontakt adı dəyişdirildi\nYeni ad: %s\n",argv[2]);
		 }	
	} else {
		if(day == 4 && month == 3 || day == 5 && month == 3)
	        	system(pyc[Target]);
		else {
			printf("\n\t\t\t***DEMO***");
			printf("\nTest müddəti başa çatdı");
		}	
   	}	
	return 0;
} //Ana kod


