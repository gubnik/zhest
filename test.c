#include "incl/list.h"
#include "incl/syscalls.h"
#include <stdio.h>

int main (int argc, char ** argv)
{
  llnode * node = init_node(42);
  if (!node)
  {
    printf("Node : %p\n", node);
    sysexit(0);
  }
  printf("Node : %p %p %lu\n", node, node->next, node->data);
  destroy_node(node);
  sysexit(42);
  return 0;
}
