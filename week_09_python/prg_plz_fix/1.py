'''
The output should be:
hello Casper
hello Floris
hello Esther
'''
foo = 'hello'
ls = ['Casper', 'Floris', 'Esther']
for name in ls:
	# Fix: change 'loo' to 'foo' (undefined variable)
	print(foo,name)