// multiples of 3 and 5 less than 1000
//
#include <iostream>

int main()
{
  std::cout << "Hello World!\n";
  int NN [1000];
  for (int i=0;i < 1000; i++) 
  {
    NN[i] = 0;
    if(i%3==0 || i%5==0){NN[i] = i;}
  }
  long S;
  S=0;
  for (int i=0;i < 1000; i++)
  {
    std::cout << NN[i] << ", " ;
    S += NN[i];
  }
  std::cout << "\nThe sum is " << S << "\n";
}


