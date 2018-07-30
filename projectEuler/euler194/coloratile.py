

def enumerate1(C):
    colors = []
    for i in range(1,C+1):
        colors.append(i)
    count = 0
    for C1 in colors:
        for C2 in colors:
            for C3 in colors:
                for C4 in colors:
                    for C5 in colors:
                        broken = False
                        if (1 == C1):
                            broken = True
                        elif (1 == C2):
                            broken = True
                        elif (2 == C4):
                            broken = True
                        elif (2 == C5):
                            broken = True
                        elif (C1 == C2):
                            broken = True
                        elif (C2 == C3):
                            broken = True
                        elif (C3 == C4):
                            broken = True
                        elif (C4 == C5):
                            broken = True
                        elif (C1 == C5):
                            broken = True
                        if (broken == False):
                            count += 1
    return(count)


def enumerate2(C):
    colors = []
    for i in range(1,C+1):
        colors.append(i)
    count = 0
    for C1 in colors:
        for C2 in colors:
            for C3 in colors:
                for C4 in colors:
                    for C5 in colors:
                        broken = False
                        if (1 == C1):
                            broken = True
                        elif (1 == C2):
                            broken = True
                        elif (2 == C4):
                            broken = True
                        elif (C1 == C2):
                            broken = True
                        elif (C2 == C3):
                            broken = True
                        elif (C3 == C4):
                            broken = True
                        elif (C4 == C5):
                            broken = True
                        elif (C1 == C5):
                            broken = True
                        if (broken == False):
                            count += 1
    return(count)

def sucdif(ls):
    ret = []
    copy = ls*1
    while len(copy) > 1:
        a = copy.pop(0)
        ret.append(copy[0] - a)
    return(ret)

def sucsum(base,diffs):
    while len(base) <= len(diffs):
        base.append(base[-1] + diffs[len(base)-1])


def patternate(lss):
    for i in range(1,len(lss)):
        lss[i] = sucdif(lss[i-1])


def backpatternate(lss):
    j = len(lss) - 1
    i = j - 1
    while (i >= 0):
        sucsum(lss[i],lss[j])
        i -= 1
        j -= 1

datas = []
for i in range(3,12):
    datas.append(enumerate1(i))

predictor = [datas,[],[],[],[],[],[]]

patternate(predictor)

predictor[-1] = [0]*2000

backpatternate(predictor)

ways1 = predictor[0][1984 - 3]

datas2 = []
for i in range(3,12):
    datas2.append(enumerate2(i))

predictor2 = [datas2,[],[],[],[],[],[]]

patternate(predictor2)

predictor2[-1] = [0]*2000

backpatternate(predictor2)

ways2 = predictor2[0][1984 - 3]


print(ways1%(10**9),ways2%(10**9))










