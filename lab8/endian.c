#include <stdio.h>

int isLittleEndian() {
	int fourbytes = 42;
	char * pointer = (char *) &fourbytes;
	
	if (*pointer == 42) {
		return 1;
	}

	return 0;
}

main() {
  	if (isLittleEndian()) {
    	printf("Machine is Little Endian\n");
  	}
  	else {
    	printf("Machine is Big Endian\n");
  	}
}
