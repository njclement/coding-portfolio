//
#include <iostream>


int main()
{
  int N = 200000;
  int primes [N];
  for(int i=0; i< N; i++)
  {
    primes[i] = i;
  }
  primes[1] = 0;
  for(int d=2; d<447; d++)
  {
    for(int m=2*d; m<N; m+=d)
    {
      primes[m]=0;
    }
  }
  int C = 0;
  int i = 0;
  while(C<10001)
  {
    i++;
    if(primes[i] != 0)
    {
      C++;
    }
  }
  std::cout << primes[i] << "\n";
}






