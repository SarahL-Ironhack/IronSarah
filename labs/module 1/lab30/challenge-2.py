"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.


The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import random
import sys
import string

def RandomStringGenerator(l=12,a=(string.digits + string.ascii_lowercase) ):
    p = 0
    s = ''
    while p<l:
        s += random.choice(a)
        p += 1
    return s

def BatchStringGenerator(n, a=8, b=12):
    r = []
    c = None
    characters = (string.digits + string.ascii_lowercase)
    
    if a > b : 
        sys.exit('Incorrect min and max string lengths. Try again.')
    for i in range(n):
        c = random.choice(range(a, b))

        r.append(RandomStringGenerator(c, characters))
    return r

a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))
