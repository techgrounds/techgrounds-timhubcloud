

def asknumber():
    try:
        number = int(input("Please input a number: "))

        if number < 100:
            print("{} is pretty low, isn't it".format(number))
        elif number == 100:
            print("{} is a nice number indeed".format(number))
        elif number > 100:
            print("Wow, {} is a big number!".format(number))
        else:
            print("Something went horribly wrong!")

    except ValueError:
        print("That's not a number!")
        asknumber()

asknumber()

