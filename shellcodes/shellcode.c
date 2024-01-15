#include <unistd.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    execve("/bin/sh", NULL, NULL);
    return 0;
}
