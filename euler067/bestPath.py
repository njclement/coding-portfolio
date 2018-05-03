import math

def run_one_step(maze):
    step = maze.pop(0)
    for i in range(len(maze[0])):
        add = max(step[i],step[i+1])
        maze[0][i] += add
        
def run(maze):
    while len(maze) > 1:
        run_one_step(maze)


