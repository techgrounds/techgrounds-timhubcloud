#!/usr/bin/env python3

import sys
import re
import csv
import operator

# Declare lists for the assignment
error = {}
user = {}

# Open the syslog and iterate through the messages
with open('syslog.log', 'r') as file:
    for line in file:

        # Filter the INFO and ERROR messages
        found_error = re.search(r"ticky: ERROR ([\w ]*) ", line)
        found_info = re.search(r"ticky: INFO ([\w ]*) ", line)

        # If ticky ERROR message
        if found_error != None:
            # Either add a new error message to 'error' list or increase existing value by 1
            if found_error[1] in error:
                error[found_error[1]] = error[found_error[1]]+1
            else:
                error[found_error[1]] = 1

            # Find username and either add a new username to 'user' list or increase existing value by 1
            username = re.search(r"\((.*)\)", line)
            if username[1] in user:
                user[username[1]] = [user[username[1]][0],user[username[1]][1]+1]
            else:
                user[username[1]] = [0,1]
        
        # If ticky INFO message
        if found_info != None:

            # Find username and either add a new username to 'user' list or increase existing value by 1
            username = re.search(r"\((.*)\)", line)
            if username[1] in user:
                user[username[1]] = [user[username[1]][0]+1,user[username[1]][1]]
            else:
                user[username[1]] = [1,0]
        
# Sort by value for error list and key for user list
final_error = sorted(error.items(), key=operator.itemgetter(1), reverse=True)
final_user = sorted(user.items(), key=operator.itemgetter(0))

# Write CSV with error messages followed by number of occurrences of ERROR messages
header = ['Error','Count']
with open('error_message.csv', 'w') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    for data in final_error:
        writer.writerow(data)

# Write CSV with usernames and number of occurrences of INFO and ERROR messages
header = ['Username','INFO','ERROR']
with open('user_statistics.csv', 'w') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    for data in final_user:

        temp_list = [data[0],data[1][0],data[1][1]]
        writer.writerow(temp_list)

