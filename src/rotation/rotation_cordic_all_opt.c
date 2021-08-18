#include <stdio.h>

//== LOCAL VARIABLES//
//== OPTIMIZE THE FOR LOOP//

static inline void rotation_cordic_all_opt(int target_angle)
{
int angle_arr[14] = {6433, 3797, 2005, 1018, 510, 254, 127, 62, 31, 15, 7, 3, 1,0 };

    register int Y_prev =0; 
    register int Y_next =0;
    register int X_next =1;
    register int X_prev = (1 << 13);
    register int Z_next, Z=target_angle; 
    register int i; 

      for (i^=i; i < 14; i=i+2)  {

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

        // double temp_angle = ((float)(Z) /  (float)(1<<13)) * 57.3;

        if(Z > 0){

          X_next= X_prev - (Y_prev >> (i+1)); 

          Y_next = Y_prev + (X_prev >> (i+1)); 

          Z_next = Z  -  angle_arr[i+1]; 

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;

        }else{
          X_next= X_prev + (Y_prev  >> (i+1));

          Y_next = Y_prev - (X_prev >> (i+1));

          Z_next = Z  +  angle_arr[i+1];

          X_prev = X_next;

          Y_prev = Y_next;

          Z= Z_next;
        }
      
    
    } 


    //   double Z_result = ((float)(Z) / (float)(1<<13)) * 57.3;
    //   double X_result = ((float)(X_next) / (float)(1<<13))*0.6072; 
    //   double Y_result = ((float)(Y_next) / (float)(1<<13))*0.6072;
  

    //  int x_fix_result = X_result*(1<<13);
    //  int y_fix_result = Y_result * (1<<13);

    //  printf("OUR FIXED RESULT\n X_Next: %d \t Y_next: %d \t\n" , x_fix_result, y_fix_result);

    // printf(" X_Next: %f \t Y_next: %f \t Z: %f\n" , X_result  , Y_result, Z_result);

      X_next = (X_next) * 0.6072; 
      Y_next = (Y_next) * 0.6072;
      printf(" X_Next: %d \t Y_next: %d \t Z: %d\n" , X_next  , Y_next, Z);
}
