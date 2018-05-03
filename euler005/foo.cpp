//
#include <iostream>

long gcd (long a, long b)
{
  long s;
  while(a != 0 && b != 0)
  {
    a = a % b;
    s = a;
    a = b;
    b = s;
  }
  return a;
}


int main()
{
  long P = 1;
  for(int n = 1; n <21; n++)
  {
    P = P*n/gcd(P, n);
    std::cout << P << ", " << n << "\n" ;
  }
}




