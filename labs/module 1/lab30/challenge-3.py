"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.
"""

def my_function(X):
    solution = -1
    
    for x in range(X, 4,-1):
        for y in range(X, 3, -1):
            for z in range(X, 2, -1):
                if (x**2==y**2+z**2):
                    solution = x
                    print(solution)
                    break
            if solution != -1:
                break
        if solution !=-1:
            break
        
    if solution == -1:
        return 0
    return solution

X = input("What is the maximal length of the triangle side? Enter a number: ")

print("The longest side possible is " + str(my_function(int(X))))
