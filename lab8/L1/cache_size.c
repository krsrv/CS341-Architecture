#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <intrin.h> /* for rdtscp and clflush */
#include <x86intrin.h> /* for rdtscp and clflush */

#define CACHE_SIZE 4096

int main()
{

	int A[18+CACHE_SIZE];
	int Access_Time[CACHE_SIZE] = {0};
	int i,j, aux, access;	
	register uint64_t time1, time2, time3;

	//Measuring the time
	for (j=0; j<CACHE_SIZE;j++)
	{
		access = A[16];
		time1 = __rdtscp(&aux);
		access = A[16];
		time3 = __rdtscp(&aux) - time1;

		for(i=0; i<j;i++)
			A[i+16] = i;

		time1 = __rdtscp(&aux);
		access = A[16];
		time2 = __rdtscp(&aux) - time1;

		for(i=0;i<j;i+=16)
			_mm_clflush(A+i+16);
		
		Access_Time[j] = time2 - time3;
	}

	for (int j=0; j<CACHE_SIZE;j++)
		printf("%d  -> %d\n",j, Access_Time[j]);

	return 0;
}
