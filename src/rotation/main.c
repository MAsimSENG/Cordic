//#include "cordic_rotation_opt.c"
//#include "cordic_rotation.c"
#include "rotation_original.c"

int main()
{

	//int * angle_ptr = generate_table(); 

	double desired_angle = 1.2217; // 70 degrees 

	desired_angle = (int) (desired_angle * (1 << 13)); // right shift our input angle by our scale factor 2^13; 

	rotation_cordic(desired_angle, 14 );

	// rotation_cordic(desired_angle,14);

}
