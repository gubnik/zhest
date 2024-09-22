#ifndef ZHEST_SYSCALLS
#define ZHEST_SYSCALLS

#include "types.h"

extern void sysexit (byte);
extern aptr alloc (stddata);
extern void dealloc (aptr, stddata);

#endif // !ZHEST_SYSCALLS

