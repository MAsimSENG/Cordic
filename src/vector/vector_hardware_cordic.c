#include <stdio.h>



 void vector_hardware_cordic(int x, int y, int *z){
	
	int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };
	
	register int c_xy_temp =0; 
	register int xy_temp =0; 
	register int z_temp =0; 
	register int c_xz_temp =0; 
	register int i; 

	for(i^=i; i<14; i=i+2)
	{

	__asm__ __volatile__ ( "CORDIC_V_xy %0, %1, %2"
	: "=r" (c_xy_temp) : "r" (xy_temp), "r" (z_temp));

	__asm__ __volatile__ ( "CORDIC_V_xz %0, %1, %2"
	: "=r" (c_xz_temp) : "r" (xy_temp), "r" (z_temp));


	x = c_xy_temp >> 16;// 0 out y so that we only have x 
	y = (cxy_temp << 16) >> 16; // left shift xy to 0 out the x's then right shift again 
	z_temp = (c_xz_temp << 16) >> 16; // left shift xz to 0 out the x's then right shift again 
	*z = z_temp;
	
	}	


}
