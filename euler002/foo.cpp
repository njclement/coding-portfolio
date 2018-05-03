// multiples of 3 and 5 less than 1000
//
#include <iostream>

int main()
{
  long A,B,C;
  A = 1;
  B = 1;
  C = 2;
  long S;
  S = 0;
  while ( C <= 4000000 )
  {
    S += C;
    A = B + C;
    B = C + A;
    C = A + B;
    std::cout << C << ", " ;
  }
  std::cout << "\nThe sum is " << S << "\n";
}


