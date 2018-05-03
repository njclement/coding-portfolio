// multiples of 3 and 5 less than 1000
//
#include <iostream>

int main()
{
  long N;
  N = 600851475143;
  int primes [10000];
  for (int i=0;i < 10000; i++)
  {
    primes[i] = i;
  }
  for (int i=2;i < 200; i++)
  {
    for (int j = 2*i; j < 10000; j += i)
    {
      primes[j]=0;
    }
  }
  for (int p=2; p<10000; p++)
  {
    if(primes[p] != 0)
    {
      while (N % p == 0)
      {
        std::cout << p << " * " << N/p << " = " << N << "\n";
        N /= p;
      }
    }
  }
}


