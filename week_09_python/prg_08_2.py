import csv
import os

first_name = input("What is your first name: ")
last_name = input("What is your last name: ")
job_title = input("What is your job title: ")
company = input("What is your company called: ")

full_list = {"First name":first_name,"Last name":last_name,"Job title":job_title,"Company":company}

fields = ["First name","Last name","Job title","Company"]

if os.path.isfile("dictionary.csv") == False:
    with open('dictionary.csv', 'w') as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writeheader()
        writer.writerow(full_list)
else:
    with open('dictionary.csv', 'a') as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writerow(full_list)