'''
The output should be:
4
16129
'''
def square(x):
	return x**2

nr = square(2)
print(nr)

# Moved foo up so it could be used by square(foo)
foo = 127

big = square(foo)
print(big)

