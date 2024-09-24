#include "incl/list.h"
#include "incl/printbuf.h"
#include "incl/syscalls.h"

#define FLAG_STOP 

void print_node (llnode * iter, stddata * flagptr)
{
  char * msg = "Ave ";
  if ((*flagptr)++ % 2) msg = "Caesar!\n";
  printbuf(msg);
}

int main (int argc, char ** argv)
{
  llnode * root = init_node(42);
  for (int i = 0; i < 11; i++) append_node(root, (i % 3 == 0) ? 69 : (i % 3 == 1) ? 420 : 1337 );
  iterate_list(root, print_node);
  //printform("Nigger", 1, 2, 3);
  charout('a');
  sysexit(42);
  
  return 0;
}
