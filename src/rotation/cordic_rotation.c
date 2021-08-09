#include <math.h>
#include <stdio.h>

void rotation_cordic(int target_angle, int length_of_angle_array)
{
 
int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };


 // purpose of rotation cordic 
    // is to calculate sine and consine of angle
    // and we return x,y;
  // our initial 

    int Y_prev =0; 
    int Y_next =0;

    int X_next =1;

     //double X_prev =0.6073;// scale factor applied to initial value rather than at end 

    int X_prev = (1 << 13);

    int Z_next, Z=target_angle; 


      for (int i=0; i< length_of_angle_array; i++)  {

        if(Z > 0){

          X_next= X_prev - (Y_prev >> i); // x_next = 1 - (0 * 2^13) // 1 

          Y_next = Y_prev + (X_prev >> i); // Y = 0 + 1 * 2^13 // 8192 

          Z_next = Z  -  angle_arr[i]; // 1.22 * 8192 - 5433 

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
      
    	// factor=pow(2,); //equivalent to 2^-i ex:{ 1/2.0, 1/4.0, 1/8.0, 1/16.0, 1/32.0, 1/64.0, 1/128.0, 1/512.0};
      double temp_angle = ((float)(Z) / (float)(1<<13)) * 57.3;
    } // for loop

      double Z_result = ((float)(Z) / (float)(1<<13)) * 57.3;
      double X_result = ((float)(X_next) / (float)(1<<13))*0.6072;   // K=0,6072= cos(45)*cos(26)*......
      double Y_result = ((float)(Y_next) / (float)(1<<13))*0.6072;

      printf(" X_Next: %f \t Y_next: %f \t Z: %f\n" , X_result  , Y_result, Z_result);


    

}// cordic function
