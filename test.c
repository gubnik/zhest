#include "incl/list.h"
#include "incl/printbuf.h"
#include "incl/syscalls.h"
#include "incl/argshandler.h"
#include <stdio.h>

#define FLAG_STOP 

void print_node (llnode * iter, stddata * flagptr)
{
  printf("> %lu %p\n", iter->data, iter->next);
}

int main (int argc, char ** argv)
{
  llnode * root = init_node(42);
  charout('a');
  charout('\n');
  if ((stddata) root > 0x700000000000)
  {
    printf("%lu %p\n", root->data, root->next);
  }
  handleargs(root, 9, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L);
  printf("%p\n", root);
  if ((stddata) root > 0x700000000000)
  {
    iterate_list(root, print_node);
  }
  sysexit(42);
  
  return 0;
}
