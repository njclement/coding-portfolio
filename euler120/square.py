from math import *

tot = 0
for i in range(3,1001):
    if (i % 2 == 1):
        tot += i*(i-1)
    if (i % 2 == 0):
        tot += i*(i-2)

print(tot)
