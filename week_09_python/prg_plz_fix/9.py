'''
The output should be:
0
1
2
3
4
8
9
'''
for i in range(10):
	if i < 5:
		print(i)
	elif i < 8:
		# Changed break to continue. Break stops the loop, continue moves to the next iteration
		continue
	else:
		print(i)