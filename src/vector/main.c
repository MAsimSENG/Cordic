
//#include "vector_cordic.c"

#include <stdio.h>
//#include <math.h>

int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };

void cordic_vector(double x, double y){
	
	// int x_prev = (int) (x *  pow(2,13)); 
	// int y_prev = (int) (y * pow(2,13)); 
	int x_prev = (int) (x * (1 << 13)); 
	int y_prev = (int) (y * (1 << 13)); 
	int z=0; 
	int x_next =0; 
	int y_next =0; 
	int z_next =0; 
	printf("######Initial x_prev is %d\t y is %d\t####\n", x_prev,y_prev );
	for(int i=0; i<14; i++)
	{
		printf("iteration: %d\n", i);
		printf("x_next= %d \t y_next= %d \n",x_next,y_next);
		if(y_prev > 0)
		{
			x_next = x_prev +  (y_prev >> i);
		   	y_next = y_prev - (x_prev >> i);
		   	z_next = z + angle_arr[i];
		   	x_prev = x_next; 
		   	y_prev = y_next;
		   	z = z_next; 
		}

		else
		{
			x_next = x_prev - (y_prev >> i);
		   	y_next = y_prev + (x_prev >> i);
		   	z_next = z - angle_arr[i];
			x_prev = x_next; 
	   		y_prev = y_next;
	   		z = z_next;
		}



	}	


	printf("This is the result %d\t %d\t %d\n", x_next, y_next,z);

}



int main()
{

 // cordic_vector(0.342, 0.9397);
   cordic_vector(0.85, 0.75);

}
