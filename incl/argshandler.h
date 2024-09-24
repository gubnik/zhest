#ifndef ZHEST_ARGS
#define ZHEST_ARGS

#include "list.h"

/*
  * Function that handles variadic args into a list from a provided pointer
  * Data in a node is of 8 bytes (stddata aka unsigned long)
*/
extern void handleargs(llnode *, stddata, ...);

#endif // !ZHEST_ARGS

