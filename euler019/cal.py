from math import *

year = 1900

def daysHathFeb(y):
    ret = 28
    if (y%4 == 0):
        ret += 1
    if (y%100 == 0):
        ret -= 1
    if (y%400 == 0):
        ret += 1
    return ret

daysTable = {
        0: 31,
        1: 28,
        2: 31,
        3: 30,
        4: 31,
        5: 30,
        6: 31,
        7: 31,
        8: 30,
        9: 31,
        10: 30,
        11: 31}

def daysInMonth(m):
    if m == 1:
        return daysHathFeb(year)
    return daysTable[m]

weekday = 1
month = 0
year = 1900

while month < 12:
    weekday = (weekday + daysInMonth(month))%7
    month += 1

month = 0
year = 1901
nSundays = 0

while year < 2001:
    while month < 12:
        if (weekday == 0):
            nSundays += 1
        weekday = (weekday + daysInMonth(month))%7
        month += 1
    month = 0
    year += 1


print(nSundays)




