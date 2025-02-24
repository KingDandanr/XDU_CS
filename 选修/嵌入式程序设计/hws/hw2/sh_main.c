/* C Shared lib method*/
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{ 
	if (argc<2) 
	{ 
		printf("You MUST input parameters,ex> %s someword\n",argv[0]);
		exit(1);
	}
	printf("====== Shared lib method ======\n");
	printf("factorial value: f(%d) = %d! = %d\n", atoi(argv[1]), atoi(argv[1]), factorial(atoi(argv[1])));
	return 0; 
}

