#include <stdio.h>
#include <string.h>

char configPath[255] = ".config/";

void keyPass(char* config, char* value) {
        if(config != NULL && value != NULL){
        FILE *rk = fopen(strcat(configPath,config),"w");
        fprintf(rk, "%s",value);
        fclose(rk);
        }
}



int main(void) {
	keyPass("data.key","busted");
	return 0;
}

