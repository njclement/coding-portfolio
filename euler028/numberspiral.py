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


def f(n):
    return (32*choose(n,2) + 20*choose(n,1) + 4)

def g(n):
    return (32*choose(n,3) + 20*choose(n,2) + 4*choose(n,1) - 3)


for i in range(8):
    print(i, g(i))

