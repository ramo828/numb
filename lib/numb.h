#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define __VERSION_APP__  "1.8.5 stable"
void update();
void reInstall();
void removeApp();
void writeKey(char* key);
void version();
char *getDir();
//Trinity Func
void author();
void code();
void phone();
//Trinity end
void mkDir(char* dir);
void writeConfig(char* config, char* value);
char *get_homedir(void);
