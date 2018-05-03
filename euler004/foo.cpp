//
#include <iostream>

long gcd (long a, long b)
{
  while(a != 0 && b != 0)
  {
    a = a % b;
    a, b = b, a;
  }
  return a;
}


int main()
{
  int a = 15;
  int b = 18;
  std::cout << gcd(a,b);
}




