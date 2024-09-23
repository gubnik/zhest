#include "incl/list.h"
#include "incl/syscalls.h"
#include "incl/printbuf.h"
//#include <stdio.h>

#define FLAG_STOP 

void print_node (llnode * iter, stddata * flagptr)
{
  if (*flagptr < 0x0000AAAA)
  {
    *flagptr |= iter->data;
  }
  printbuf("");
  //printf("Node : %p %p %lu\nFlags : %lx\n", iter, iter->next, iter->data, *flagptr);
}

int main (int argc, char ** argv)
{
  llnode * root = init_node(42);
  llnode * node1 = append_node(root, 69);
  llnode * node2 = append_node(root, 1337);
  iterate_list(root, print_node);
  sysexit(42);
  return 0;
}
