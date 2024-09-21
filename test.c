#include "headers/list.h"
#include <stdio.h>

int main (int argc, char ** argv)
{
  llnode * node = init_node();
  printf("%lu | %p\n", sizeof(llnode), node);
  destroy_node(node);
  return 0;
}
