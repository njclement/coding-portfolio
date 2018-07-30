import sys

bound = int(sys.argv[1])

fib = [1,2] + [0]*50
for i in range(2,52):
    fib[i] = fib[i-1] + fib[i-2]

def zec(N):
    ret = [0]*52
    while (N > 0):
        i = finderino(N)
        N = N - fib[i]
        ret[i] = 1
    return ret

def finderino(N):
    i = 0
    while (fib[i] <= N):
        i = i + 1
    return (i-1)

def z(N):
    return(zec(N).count(1))

def nicezec(N):
    ret = ""
    dingles = zec(N)
    for c in dingles:
        if (c == 1):
            ret = ret + "@"
        if (c == 0):
            ret = ret + " "
    return ret

for i in range(1,bound):
    print(nicezec(i))

chunks = [1]

for n in range(2,10):
    top = fib[n]
    tot = 0
    for i in range(1,top):
        tot += z(i)
    chunks.append(tot)

print(chunks)
