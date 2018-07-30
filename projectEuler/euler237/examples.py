from copy import deepcopy
import sys

width = int(sys.argv[1])

def makeboard(n):
    ret = []
    for i in range(n):
        for j in range(4):
            ret.append((j,i))

board = ([[ 0 for i in range(width)] for j in range(4)],(0,0,1))
board[0][0][0] = 1

ls = [board]


def growPaths(seeds):
    ret = []
    for seed in seeds:
        ret = ret + growSeed(seed)
    return ret

def growSeed(seed):
    ret = []
    pointer = seed[1]
    boardState = seed[0]
    y = pointer[0]
    x = pointer[1]
    time = pointer[2]
    time += 1
    if y > 0 and boardState[y - 1][x] == 0:
        copyBoard1 = deepcopy(boardState)
        copyBoard1[y - 1][x] = time
        ret.append((copyBoard1,(y-1,x,time)))
    if x < width - 1 and boardState[y][x + 1] == 0:
        copyBoard2 = deepcopy(boardState)
        copyBoard2[y][x + 1] = time
        ret.append((copyBoard2,(y,x+1,time)))
    if y < 3 and boardState[y + 1][x] == 0:
        copyBoard3 = deepcopy(boardState)
        copyBoard3[y + 1][x] = time
        ret.append((copyBoard3,(y+1,x,time)))
    if x > 0 and boardState[y][x - 1] == 0:
        copyBoard4 = deepcopy(boardState)
        copyBoard4[y][x - 1] = time
        ret.append((copyBoard4,(y,x-1,time)))
    return ret
        

def show(seed):
    board = seed[0]
    for row in board:
        print(row)

for c in range(width*4 - 1):
    ls = growPaths(ls)

counter = 0
for seed in ls:
    if seed[1] == (3,0,width*4):
        counter += 1

print(counter)

