#include <stdio.h>
int * generate_table()
{
	float pi = 3.1415926535897932384626;
	int bit = 14;
	int angle_array[14];
	float array[] = {45.0,26.56,14.03,7.125,3.57,1.78,0.89,0.44,0.22,0.11,0.055,0.027,0.013,0.006};
	int scale_factor = 1<<(bit-1);
	for (int i=0;i<14;i++){
		angle_array[i] = array[i]* pi / 180 * scale_factor;
		printf("%d \n",angle_array[i]);
	}
	
	return angle_array; // &angle_array[0]

}
