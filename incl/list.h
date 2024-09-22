#ifndef ZHEST_LIST
#define ZHEST_LIST 

#include "types.h"

typedef struct llnode
{
  struct llnode * next;
  stddata data;
}
llnode;

llnode * init_node (stddata);
void destroy_node (llnode *);
llnode * append_node (llnode *, stddata);

#endif // !ZHEST_LIST
