#define LINE_SIZE 64
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <intrin.h> /* for rdtscp and clflush */
#include <x86intrin.h> /* for rdtscp and clflush */


int main()
{

	int A[1024];
	int Access_Time[1024] = {0};
	int i,j, aux, access;	
	register uint64_t time1, time2;

	//Measuring the time
	for (j=0; j<64;j++)
	{
		access = A[0];
		time1 = __rdtscp(&aux);
		access = A[j];
		time2 = __rdtscp(&aux) - time1;
		Access_Time[j]=time2;
		_mm_clflush((A+LINE_SIZE));
	}

	for (int j=0; j<64;j++)
		printf("%d  -> %d\n",j, Access_Time[j]);

	return 0;
}
