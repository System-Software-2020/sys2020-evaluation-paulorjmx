#include <unistd.h>

const char *str = "Hello\n";

int main()
{
	write(1, str, 6);
	return 0;
}
