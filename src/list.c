#include "../headers/list.h"

llnode * init_node ()
{
  llnode * nnode = 0;
  nnode = llalloc();
  if (nnode)
  {
    nnode->data = 8;
    nnode->next = (aptr) 0;
  }
  return nnode;
}

void destroy_node(llnode * node)
{
  if (!node) return;
  llfree(node);
}
