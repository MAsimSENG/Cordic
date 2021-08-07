#include <math.h>
#include <stdio.h>

//== LOCAL VARIABLES//
//== OPTIMIZE THE FOR LOOP//
void rotation_cordic_opt(int target_angle, int length_of_angle_array)
{
 
int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };

    register int Y_prev =0; 
    register int Y_next =0;
    register int X_next =1;
    register int X_prev = (1 << 13);
    register int Z_next, Z=target_angle; 
    register int i; 
      for (i^=i; i < length_of_angle_array; i++)  {

        if(Z > 0){

          X_next= X_prev - (Y_prev >> i); 

          Y_next = Y_prev + (X_prev >> i); 

          Z_next = Z  -  angle_arr[i]; 

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;

        }else{
          X_next= X_prev + (Y_prev  >> i);

          Y_next = Y_prev - (X_prev >> i);

          Z_next = Z  +  angle_arr[i];

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;
        }
      
      double temp_angle = ((float)(Z) /  (float)(1<<13)) * 57.3;
      printf("the angle: %f \n", temp_angle);
    } // for loop

      double Z_result = ((float)(Z) / (float)(1<<13)) * 57.3;
      double X_result = ((float)(X_next) / (float)(1<<13))*0.6072;   // K=0,6072= cos(45)*cos(26)*......
      double Y_result = ((float)(Y_next) / (float)(1<<13))*0.6072;

      printf(" X_Next: %f \t Y_next: %f \t Z: %f\n" , X_result  , Y_result, Z_result);


}// cordic function
