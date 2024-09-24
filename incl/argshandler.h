#ifndef ZHEST_ARGS
#define ZHEST_ARGS

#include "list.h"

/*
  * Function that handles variadic args into a list from a provided ptrptr
  * Data in a node is of 8 bytes (stddata aka unsigned long)
  * 
  * If a provided node ptrptr points to a null address,
  * then the fist node will be the lenght of a list,
  * otherwise this node is preserved
*/
extern void handleargs(llnode **, stddata, ...);
extern void testdptr(llnode **);

#endif // !ZHEST_ARGS

