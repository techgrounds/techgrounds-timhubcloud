# Use the input() function to ask the user of your script for their name.
name = input("Please input your name: ")

coolestname = "Tim"

if name == coolestname:
    # If the name they input is your name, print a personalized welcome message.
    print("Hello! Welcome, {}!".format(name))
else:
    # If not, print a different personalized message.
    print("You are {}, not Tim. Please leave.".format(name,coolestname))