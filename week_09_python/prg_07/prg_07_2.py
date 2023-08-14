# Initialize length variable with 0
length = 0

# Create a list of five integers
five_integers = [3,5,2,7,39]

print("My list: {}".format(five_integers))

# Iterate through all the items in the list
for number in five_integers:

    if len(five_integers) == length+1:

        # If it is the last item, add it to the value of the first item instead (since there is no next item)
        print(number + five_integers[0])

    else:

        # Print the value of that item added to the value of the next item in the list.
        print(number + five_integers[length+1])

    # Increase the length  variable   
    length += 1