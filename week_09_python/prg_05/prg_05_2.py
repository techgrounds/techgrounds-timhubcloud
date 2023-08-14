

def asknumber(): # Define an asknumber function
    try:
        # Ask the user of your script for a number
        number = int(input("Please input a number: "))

        # Give them a response based on whether the number is higher than, lower than, or equal to 100.
        if number < 100:
            print("{} is pretty low, isn't it".format(number))
        elif number == 100:
            print("{} is a nice number indeed".format(number))
        elif number > 100:
            print("Wow, {} is a big number!".format(number))
        else:
            print("Something went horribly wrong!")

    except ValueError:
        # Catch any ValueErrors
        print("That's not a number!")
        asknumber()

asknumber()

