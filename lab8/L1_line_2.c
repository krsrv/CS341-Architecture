#define LINE 32
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <intrin.h> /* for rdtscp and clflush */
#include <x86intrin.h> /* for rdtscp and clflush */

#define COUNT 64
#define OFFSET 0

int main()
{

	int A[1024];
	int Access_Time[1024] = {0};
	int i,j,access;	
	unsigned aux;
	int *p;
	register uint64_t time1, time2;
	p=&A[0]; // p stores base address of array

	_mm_clflush((p + LINE));
	_mm_clflush((p + 2*LINE));
	_mm_clflush((p + 3*LINE));

	//Measuring the time
	access = *(p + OFFSET);
	time1 = __rdtscp(&aux);
	access = *(p + OFFSET + 32);
	time2 = __rdtscp(&aux) - time1;
	Access_Time[0] = time2;

	printf("%d  -> %d\n",64, Access_Time[0]);

	return 0;
}
