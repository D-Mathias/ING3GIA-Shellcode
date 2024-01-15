#include <stdio.h>
#include <string.h>
#include <malloc.h>

int main(int argc, char **argv){

  printf("\033[1;33m===Info===\n");
  printf("Length : %d\n", strlen(argv[1]));
  printf("Shellcode : ");

  for (int i = 0; i < strlen(argv[1]); i++) {
    printf("\\x%02X", argv[1][i] & 0xff);
  }

  printf("\n");
  malloc_stats();
  printf("\033[0m\nRunning\n");

  int (*ret)();
  ret = (int (*)()) argv[1];
  (int)(*ret)();

  return 0;
}