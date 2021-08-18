#include <stdio.h>



static inline void vector_cordic_all_opt(double x, double y){
	int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };
	register int x_prev = (int) (x * (1 << 13)); 
	register int y_prev = (int) (y * (1 << 13)); 
	register int z=0; 
	register int x_next =0; 
	register int y_next =0; 
	register int z_next =0; 
	register int i; 
	for(i^=i; i<14; i=i+2)
	{
		if(y_prev > 0)
		{
			x_next = x_prev +  (y_prev >> i);
		   	y_next = y_prev - (x_prev >> i);
		   	z_next = z + angle_arr[i];
		   	
		}else
		{
			x_next = x_prev - (y_prev >> i);
		   	y_next = y_prev + (x_prev >> i);
		   	z_next = z - angle_arr[i];
			
		}
		x_prev = x_next; 
	   	y_prev = y_next;
	   	z = z_next;

		if(y_prev > 0)
		{
			x_next = x_prev +  (y_prev >> (i+1));
		   	y_next = y_prev - (x_prev >> (i+1));
		   	z_next = z + angle_arr[i+1];
		}else
		{
			x_next = x_prev - (y_prev >> (i+1));
		   	y_next = y_prev + (x_prev >> (i+1));
		   	z_next = z - angle_arr[i+1];
		}
		x_prev = x_next; 
	   	y_prev = y_next;
	   	z = z_next;
	}	

	printf("Fix-point result %d\t %d\t %d\n", x_next, y_next,z);

}
