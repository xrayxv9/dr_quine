#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define MYSELF "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c#define MYSELF %2$c%3$s%2$c%1$c#define PRINT_KID(fd) dprintf(fd, MYSELF, 10, 34, MYSELF)%1$c#define MAKE_MAIN int main(void) {int fd = open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY | O_TRUNC, 0644);if (fd < 0)return 1;PRINT_KID(fd); close(fd); return 0;}%1$c%1$cMAKE_MAIN%1$c"
#define PRINT_KID(fd) dprintf(fd, MYSELF, 10, 34, MYSELF)
#define MAKE_MAIN int main(void) {int fd = open("Grace_kid.c", O_CREAT | O_WRONLY | O_TRUNC, 0644);if (fd < 0)return 1;PRINT_KID(fd); close(fd); return 0;}

MAKE_MAIN
