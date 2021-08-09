nt angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };

int cordic_vector(int x, int y)
{
	
	x = x << 13; 
	y = y << 13; 

	int x_prev = x; 
	int y_prev = y; 
	int z=0; 
	int x_next =0; 
	int y_next =0; 
	int z_next =0; 

	for(int i=0; i<14; i++)
	{

		if(y_next > 0)
		{
			x_next = x_prev +  (y_prev >> i);
		   	y_next = y_prev - (x_prev >> i);
		   	z_next = z_prev + angle_arr[i];
		   	x_prev = x_next; 
		   	y_prev = y_next;
		   	z_next = z_prev; 
		}

		else
		{
			x_next = x_prev - (y_prev >> i);
		   	y_next = y_prev + (x_prev >> i);
		   	z_next = z_prev - angle_arr[i];
			x_prev = x_next; 
	   		y_prev = y_next;
	   		z_next = z_prev;
		}



	}	
	printf("This is the result %d\t%d\%d, x_next, y_next,z_next);


}

