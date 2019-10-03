#define LINE 32
#define COUNT 64
#define OFFSET 0

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <intrin.h> /* for rdtscp and clflush */
#include <x86intrin.h> /* for rdtscp and clflush */

int main()
{

	int A[1024] = {0}, Access_Time[1024] = {0}, j, *p = A, access;
	unsigned aux;
	register uint64_t time1, time2;

	// Initialize array
	for(j=0;j<1024;j++)
		A[j] = j;



	//Measuring the time
	for (j=0; j<COUNT;j++)
	{
		access = (p[OFFSET]);
		time1 = __rdtscp(&aux);
		access = (p[OFFSET + j]);
		time2 = __rdtscp(&aux) - time1;
		Access_Time[j] = time2;
		_mm_clflush(p+LINE);
	}

	for (int j=0; j<COUNT;j++)
		printf("%d\t->\t%d\n",OFFSET+j, Access_Time[j]);

	return 0;
}
