#include "../incl/list.h"
#include "../incl/syscalls.h"

llnode * init_node (stddata data)
{
  llnode * nnode = 0;
  nnode = alloc(sizeof(llnode));
  if (nnode)
  {
    nnode->data = data;
    nnode->next = (aptr) 0;
  }
  return nnode;
}

void destroy_node (llnode * node)
{
  if (!node) return;
  dealloc(node, sizeof(llnode));
}

