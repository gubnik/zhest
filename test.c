#include "incl/list.h"
#include "incl/syscalls.h"
#include <stdio.h>

int main (int argc, char ** argv)
{
  llnode * root = init_node(42);
  llnode * node1 = append_node(root, 69);
  llnode * node2 = append_node(root, 1337);
  
  llnode * iter = root;
  while (iter)
  {
    printf("Node : %p %p %lu\n", iter, iter->next, iter->data);
    iter = iter->next;
  }
  sysexit(42);
  return 0;
}
