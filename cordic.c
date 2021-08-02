cordic(int target_angle, int * angle_ptr, int length_of_angle_array)
{
 

    Y_prev, Y_next =0;

    X_next =0;

    X_prev =0.6073;// scale factor applied to initial value rather than at end 

    Z_next, Z=target_angle; 

    int sign = 1;  // sign can be +  or negative depending on feedback 

    factor =1;

      for (int i=0; i< length_of_angle_array; i++)  {
    	
      	X_next= X_prev - sign * Y_prev *  factor;

        Y_next = Y_prev + sign * X_prev * factor;

      	Z_next = Z - sign * (*(angle_ptr +i));

      	X_prev = X_next;

     	Y_next = Y_prev;

      	Z= Z_Next;

        // sign condition if z_next < 0 then sign -1 otherwsie sign =1 
     	if(Z_Next>0)

       		sign = 1;
    else
       		sign = -1; 

    	factor=factor>>1 ; //equivalent to 2^-i ex:{ 1/2.0, 1/4.0, 1/8.0, 1/16.0, 1/32.0, 1/64.0, 1/128.0, 1/512.0};

    } // for loop

}// cordic function
