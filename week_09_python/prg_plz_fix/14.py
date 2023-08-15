'''
The output should be:
True
'''
def rtn(x):
	return(x)

foo = rtn(3)

# Changed > to <
if foo < rtn(4):
	print(True)
else:
	print(False)