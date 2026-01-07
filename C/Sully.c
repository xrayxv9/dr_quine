#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int i = 5;
	if (i <= 0)
	{
		system("/usr/bin/gcc Sully_0.c -o Sully_0");
		return 1;
	}
	char s[12];
	if (!access("Sully_5.c", F_OK))
		sprintf(s, "Sully_%d.c", i - 1);
	else
		sprintf(s, "Sully_%d.c", i);
	int fd = open(s, O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd == -1)
		return 1;
	char str[10000] = "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c%1$cint main()%1$c{%1$c%2$cint i = %3$d;%1$c%2$cif (i <= 0)%1$c%2$c{%1$c%2$c%2$csystem(%4$c/usr/bin/gcc Sully_0.c -o Sully_0%4$c);%1$c%2$c%2$creturn 1;%1$c%2$c}%1$c%2$cchar s[12];%1$c%2$cif (!access(%4$cSully_5.c%4$c, F_OK))%1$c%2$c%2$csprintf(s, %4$cSully_%5$cd.c%4$c, i - 1);%1$c%2$celse%1$c%2$c%2$csprintf(s, %4$cSully_%5$cd.c%4$c, i);%1$c%2$cint fd = open(s, O_CREAT | O_TRUNC | O_WRONLY, 0644);%1$c%2$cif (fd == -1)%1$c%2$c%2$creturn 1;%1$c%2$cchar str[10000] = %4$c%6$s%4$c;%1$c%2$cchar command[1000];%1$c%2$csprintf(command, %4$c/usr/bin/gcc %5$cs -o Sully_%%d; ./Sully_%%d%4$c, s, i, i);%1$c%2$cif (!access(%4$cSully_4.c%4$c, F_OK))%1$c%2$c%2$cdprintf(fd, str, 10, 9, i - 1, 34, 37, str);%1$c%2$celse%1$c%2$c%2$cdprintf(fd, str, 10, 9, i, 34, 37, str);%1$c%2$csystem(command);%1$c%2$cclose(fd);%1$c%2$creturn 0;%1$c}%1$c";
	char command[1000];
	sprintf(command, "/usr/bin/gcc %s -o Sully_%d; ./Sully_%d", s, i, i);
	if (!access("Sully_4.c", F_OK))
		dprintf(fd, str, 10, 9, i - 1, 34, 37, str);
	else
		dprintf(fd, str, 10, 9, i, 34, 37, str);
	system(command);
	close(fd);
	return 0;
}
