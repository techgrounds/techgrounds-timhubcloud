
length = 0
five_integers = [3,5,2,7,39]

print("My list: {}".format(five_integers))

for number in five_integers:
    if len(five_integers) == length+1:
        print(number + five_integers[0])
    else:
        print(number + five_integers[length+1])
    length += 1