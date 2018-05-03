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
  long n = 100;
  long sumOfSquares;
  long squareOfSum;
  squareOfSum = ((n+1)*(n)/2)*((n+1)*(n)/2);
  sumOfSquares = ((n+2)*(n+1)*(n) + (n+1)*(n)*(n-1))/6;
  std::cout << squareOfSum << ", " << sumOfSquares << ", " << squareOfSum - sumOfSquares << "\n";
}






