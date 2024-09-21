#ifndef ZHEST_LIST
#define ZHEST_LIST 

#include "types.h"

typedef struct llnode
{
  struct llnode * next;
  stddata data;
}
llnode;

extern aptr llalloc ();
extern aptr llfree (aptr);

llnode * init_node ();
void destroy_node (llnode *);

#endif // !ZHEST_LIST
