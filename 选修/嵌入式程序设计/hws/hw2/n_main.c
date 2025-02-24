/* C Traditional include method*/
#include <stdio.h>
#include <stdlib.h>
#include "hello.h"
int main(int argc, char *argv[])
{ 
	if (argc<2) 
	{ 
		printf("You MUST input parameters,ex> %s someword\n",argv[0]);
		exit(1);
	}
	printf("======Include method ======\n");
	hello(argv[1]);
	return 0; 
}

