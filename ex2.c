#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>

const char *str = "Hello\n";
ssize_t write_on(int filedes, const void *buffer, size_t nbytes);

int main(int argc, char const *argv[])
{
    write_on(1, str, 6);
    return 0;
}

ssize_t write_on(int filedes, const void *buffer, size_t nbytes)
{
    return syscall(SYS_write, filedes, buffer, nbytes);
}
