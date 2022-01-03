"""
This is a dumb calculator that can add and substract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

numbers = ['one','two','three','four','five']
operation = ['plus','minus']

a = input('Please choose your first number (zero to five): ')
if a not in numbers:
    a = input('Please choose your first number (zero to five) and type it in english lowercase letters: ')
    
b = input('What do you want to do? plus or minus: ')
if b not in operation:
    b = input('What do you want to do (please type in english lowercase letters)? plus or minus: ')
    
c = input('Please choose your second number (zero to five): ')
if c not in numbers:
    c = input('Please choose your second number (zero to five) and type it in english lowercase letters: ')

if a == 'one':
    a1 = 1
elif a == 'two':
    a1 = 2
elif a == "three":
    a1 = 3
elif a == "four":
    a1 = 4
elif a == "five":
    a1 = 5

if c == 'one':
    c1 = 1
elif c == 'two':
    c1 = 2
elif c == "three":
    c1 = 3
elif c == "four":
    c1 = 4
elif c == "five":
    c1 = 5

if b == "plus":
    print (a, b , c , "equals" a1+c1)
elif b == "minus":
    print (a, b, c , "equels" a1-c1)


print("Thanks for using this calculator, goodbye :)")
