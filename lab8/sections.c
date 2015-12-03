#include <stdio.h>
#include <stdlib.h>

int a=5;

int buffer[1000000];

int foo() {
  int d;
  static int e = 5;

  printf("&d=0x%x &e=0x%x\n", &d, &e);

}

int
main()
{
  int b = 5;
  static int c;
  int * p = (int *) malloc(sizeof(int));
  *p = 42;
  char * str = "Hello World\n";

  printf("&a=0x%x &buffer=0x%x\n\n", &a, &buffer);

  printf("&b=0x%x &c=0x%x\n", &b, &c);
  printf("&p=0x%x p=0x%x\n", &p, p);
  printf("&str=0x%x str=0x%x\n", &str, str);
  foo();

  printf("main=0x%x &foo=0x%x\n", main, &foo);
}
