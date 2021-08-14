#include "vector_cordic_no_optimization.c"
#include "rotation_cordic_arith_opt.c"
#include "cordic_rotation_all_opt.c"


int main()
{
  printf("PLEASE ENTER 1 for NO OPT\n 2 for arith opt\n 3 for all optimization\n");
  int opt=0; 
    scanf("%d", &opt);

    if(opt == 1)
    {
      rotation_cordic_no_optimization(70,14);
    return 0;

    }  
    else if(opt ==2)
    {
    double desired_angle = 1.2217; // 70 degrees 
    desired_angle = (int) (desired_angle * (1 << 13)); // right shift our input angle by our scale factor 2^13; 
      rotation_cordic_arith_opt(desired_angle,14);
    return 0;

    }
    else if(opt ==3 )
    {
      double desired_angle = 1.2217; // 70 degrees 
    desired_angle = (int) (desired_angle * (1 << 13)); // right shift our input angle by our scale factor 2^13; 
      rotation_cordic_all_opt(desired_angle,14);
  
    return 0;
    }

    else
    {
      printf("INVALID OPTIONS SELECT CLOSING PROGRAM\n");
      return 1; 
    }

  return 0;

}
