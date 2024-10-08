#ifndef ZHEST_LIST
#define ZHEST_LIST 

#include "types.h"

typedef struct llnode
{
  stddata data;
  struct llnode * next;
}
llnode;

typedef void (*llnodeiter)(llnode *, stddata *);

llnode * init_node (stddata);
llnode * append_node (llnode *, stddata);
void destroy_node (llnode *);
void iterate_list (llnode *, llnodeiter);

#endif // !ZHEST_LIST
