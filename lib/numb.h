#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define __VERSION_APP__  "5.1.3"
void update();
void reInstall();
void removeApp();
void writeKey(char* key);
void version();
char *getDir();
void mkDir(char* dir);
void writeConfig(char* config, char* value);
