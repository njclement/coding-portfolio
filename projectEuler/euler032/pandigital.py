from math import *

def growSeq(seeds):
    ret = []
    for seed in seeds:
        extant = seed[0]*1
        choices = seed[1]*1
        for choice in choices:
            remainingChoices = choices*1
            remainingChoices.remove(choice)
            ret.append((extant + [choice],remainingChoices))
    return ret

s = [([],[1,2,3,4,5,6,7,8,9])]

while (len(s[0][1]) > 0):
    s = growSeq(s)
    print("Finished an iteration.\n")

print(len(s))
print(9*8*7*6*5*4*3*2)

for i in range(len(s)):
    s[i] = s[i][0]

def make14fact(l):
    x = l[0]
    y = 1000*l[1] + 100*l[2] + 10*l[3] + l[4]
    z = 1000*l[5] + 100*l[6] + 10*l[7] + l[8]
    return (x,y,z)

def make23fact(l):
    x = 10*l[0] + l[1]
    y = 100*l[2] + 10*l[3] + l[4]
    z = 1000*l[5] + 100*l[6] + 10*l[7] + l[8]
    return (x,y,z)

products = []
for seq in s:
    try1 = make14fact(seq)
    try2 = make23fact(seq)
    if (try1[0] * try1[1] == try1[2]):
        print(try1)
        if (products.count(try1[2]) == 0):
            products.append(try1[2])
    if (try2[0] * try2[1] == try2[2]):
        print(try2)
        if (products.count(try2[2]) == 0):
            products.append(try2[2])

tot = sum(products)
print(tot)

