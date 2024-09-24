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
  llnode * root = 0;
  charout('a');
  charout('\n');
  printf("PtrPtr : %p\nPtr: %p\n", &root, root);
  handleargs(&root, 9, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L);
  iterate_list(root, print_node);

  llnode * iter = root->next;
  stddata sum = 0;
  while (iter)
  {
    sum += iter->data;
    iter = iter->next;
  }
  printf("Sum : %lu\n", sum);

  sysexit(42);
  
  return 0;
}
