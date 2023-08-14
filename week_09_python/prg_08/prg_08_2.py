# import the needed modules
import csv
import os

# Use user input to ask for their information (first name, last name, job title, company).
first_name = input("What is your first name: ")
last_name = input("What is your last name: ")
job_title = input("What is your job title: ")
company = input("What is your company called: ")

# Store the information in a dictionary.
full_list = {"First name":first_name,"Last name":last_name,"Job title":job_title,"Company":company}

fields = ["First name","Last name","Job title","Company"]

# Write the information to a csv file (comma-separated values).
if os.path.isfile("dictionary.csv") == False:
    # If there is no csv file yet, create it and add headers and values:
    with open('dictionary.csv', 'w') as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writeheader()
        writer.writerow(full_list)
else:
    # If the csv file already exists, append it and add values:
    with open('dictionary.csv', 'a') as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writerow(full_list)