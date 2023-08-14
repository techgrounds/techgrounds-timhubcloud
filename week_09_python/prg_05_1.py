name = input("Please input your name: ")
coolestname = "Tim"
if name == coolestname:
    print("Hello! Welcome, {}!".format(name))
else:
    print("You are {}, not Tim. Please leave.".format(name,coolestname))