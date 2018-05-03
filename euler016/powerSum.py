N = 2**1000

S = str(N)
L = list(S)
total = 0
for c in L:
    total += int(c)

print(total)
