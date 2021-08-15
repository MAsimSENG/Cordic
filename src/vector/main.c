#include "vector_cordic_no_optimization.c"
#include "vector_cordic_arith_opt.c"
#include "vector_cordic_all_opt.c"



int main()
{
  printf("PLEASE ENTER 1 for NO OPT\n 2 for arith opt\n 3 for all optimization\n");
  int opt=0; 
    scanf("%d", &opt);

    if(opt == 1)
    {
      vector_cordic_no_opt(0.85, 0.75);
    return 0;

    }  
    else if(opt ==2)
    {
      vector_cordic_arith_opt(0.85, 0.75);
    return 0;

    }
    else if(opt ==3 )
    {
      vector_cordic_all_opt(0.85, 0.75);
  
    return 0;
    }

    else
    {
      printf("INVALID OPTIONS SELECT CLOSING PROGRAM\n");
      return 1; 
    }

  return 0;

}
