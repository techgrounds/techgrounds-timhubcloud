'''
The output should be:
a5|||5|||5|||a5|||5|||5|||a5|||5|||5|||
'''
foo = ''
for i in range(3):
	foo += 'a'
	for j in range(3):
		foo += '5'
		# Indented so the below loop runs within the above loop
		for k in range(3):
			foo += '|'

print(foo)