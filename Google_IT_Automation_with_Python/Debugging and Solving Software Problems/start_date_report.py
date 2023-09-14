#!/usr/bin/env python3

import operator
import csv
import datetime
import requests


FILE_URL = "https://storage.googleapis.com/gwg-content/gic215/employees-with-date.csv"

def get_start_date():
    """Interactively get the start date to query for."""

    print()
    print('Getting the first start date to query for.')
    print()
    print('The date must be greater than Jan 1st, 2018')
    year = int(input('Enter a value for the year: '))
    month = int(input('Enter a value for the month: '))
    day = int(input('Enter a value for the day: '))
    print()

    return datetime.datetime(year, month, day)

def get_file_lines(url):
    """Returns the lines contained in the file at the given URL"""

    # Download the file over the internet
    response = requests.get(url, stream=True)
    lines = []

    for line in response.iter_lines():
        lines.append(line.decode("UTF-8"))
    return lines

data = get_file_lines(FILE_URL)
reader = csv.reader(data[1:])
reader_sorted = sorted(reader, key=operator.itemgetter(3))

def get_same_or_newer(start_date):

    list_per_date = {}

    for people in reader_sorted:
        people_date = datetime.datetime.strptime(people[3], '%Y-%m-%d')
        names = "{} {}".format(people[0],people[1])
        if start_date <= people_date:
            if people_date in list_per_date:
                list_per_date[people_date].append(names)
            else:
                list_per_date[people_date] = [names]


    for print_date, print_name in list_per_date.items():
       print("Started on {}: {}".format(print_date.strftime("%b %d, %Y"), print_name))


def main():
    start_date = get_start_date()
    get_same_or_newer(start_date)

if __name__ == "__main__":
    main()