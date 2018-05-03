# Python because it seems to support arbitrary precision out of box
from math import *

def choose(n,k):
    return (fact(n,n-k))//fact(k)

def fact(A,B=None):
    if B is None:
        B = 0
    ret = 1
    factor = A
    while factor > B:
        ret = ret * factor
        factor -= 1
    return ret

total = 0
size = 20
for i in range(size + 1):
    total += choose(size,i)**2
print(total)
