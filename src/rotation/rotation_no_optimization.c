#include <stdio.h>


double pow(int base, int exponent)

{
 // 1 1*2=2 2*2 =4 4*2 = 8 
  double result =1.0;

  for(int i=0; i<exponent;i++)
  {
    result = result * base;
  }

  return result;
}

double angle_arr[14] = {45.0, 26.565, 14.036, 7.125, 3.576, 1.790, 0.895, 0.4476, 0.2238, 0.1119, 0.05595, 0.02798, 0.013988,0.007 };


void rotation_cordic_no_optimization(int target_angle, int length_of_angle_array)
{

    printf("enter Rotatoion no opt !!! \n");
    double Y_prev =0; 
    double Y_next =0;

    double X_next =1.0;

     //double X_prev =0.6073;// scale factor applied to initial value rather than at end 

    double X_prev = 1.0; 

    double Z_next, Z=target_angle; 


      for (int i=0; i< length_of_angle_array; i++)  {

        if(Z > 0){

          X_next= X_prev - (Y_prev * (1/pow(2,i))); // x_next = 1 - (0 * 2^13) // 1 

          Y_next = Y_prev + (X_prev * (1/pow(2,i))); // Y = 0 + 1 * 2^13 // 8192 

          Z_next = Z  -  angle_arr[i]; // 1.22 * 8192 - 5433 

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;

        }else{
          X_next= X_prev + (Y_prev * (1/pow(2,i)));

          Y_next = Y_prev - (X_prev * (1/pow(2,i)));

          Z_next = Z  +  angle_arr[i];

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;
        }
      
    } // for loop

      double Z_result = (Z) * 57.3;
      double X_result = ((X_next) )*0.6072;   // K=0,6072= cos(45)*cos(26)*......
      double Y_result = ((Y_next))*0.6072;

      printf("X_Next: %f \t Y_next: %f \t Z: %f\n" , X_result  , Y_result, Z_result);


    

}// cordic function
