#include <unistd.h>
#include <sys/syscall.h>

ssize_t write_on(int filedes, const void *buffer, size_t nbytes)
{
    return syscall(SYS_write, filedes, buffer, nbytes);
}
