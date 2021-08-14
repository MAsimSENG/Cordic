
#include <stdio.h>

double angle_arr[14] = {45.0, 26.565, 14.036, 7.125, 3.576, 1.790, 0.895, 0.4476, 0.2238, 0.1119, 0.05595, 0.02798, 0.013988,0.007 };



double pow(int base, int exponent)

{
 // 1 1*2=2 2*2 =4 4*2 = 8 
	int result =1;

	for(int i=0; i<exponent;i++)
	{
		result = result * base;
	}

	printf("%d is the result\n",result);
	return (double)result;
}


void cordic_vector(double x, double y){
	
	// int x_prev = (int) (x *  pow(2,13)); 
	// int y_prev = (int) (y * pow(2,13)); 
	double x_prev = x;
	double y_prev = y; 

	double z=0; 
	double x_next =0; 
	double y_next =0; 
	double z_next =0; 
	printf("######Initial x_prev is %d\t y is %d\t####\n", x_prev,y_prev );
	for(int i=0; i<14; i++)
	{
		printf("iteration: %d\n", i);
		printf("x_next= %d \t y_next= %d \n",x_next,y_next);
		if(y_prev > 0)
		{
			x_next = x_prev +  (y_prev  * (1/pow(2,i)));
		   	y_next = y_prev - (x_prev  * (1/pow(2,i)));
		   	z_next = z + angle_arr[i];
		   	x_prev = x_next; 
		   	y_prev = y_next;
		   	z = z_next; 
		}

		else
		{
			x_next = x_prev - (y_prev  * (1/pow(2,i)));
		   	y_next = y_prev + (x_prev  * (1/pow(2,i)));
		   	z_next = z - angle_arr[i];
			x_prev = x_next; 
	   		y_prev = y_next;
	   		z = z_next;
		}



	}	


	printf("This is the result %f\t %f\t %f\n", x_next, y_next,z);

}
