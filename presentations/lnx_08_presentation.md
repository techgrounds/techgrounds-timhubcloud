# Cron jobs
Crontab (short for Cron Table) is a job scheduler in Unix that executes commands and scripts based on certain preset time intervals. This can be very useful for the execution of repetitive tasks and periodic maintenance. Examples of this can include things like the creation of backups, checking for and executing software updates etc.

## Key-terms
- **Cron**: name of the system that executes these periodic tasks.
- **Cron job**: an individual command or script that is executed at a certain time interval.
- **Cron tab**: a file containing the list of all tasks that need to be executed.

## Assignments

### Assignment 1
- [x] Create a Bash script that writes the current date and time to a file in your home directory.
- [x] Register the script in your crontab so that it runs every minute.
- [x] Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.

### Used sources
- [A Beginners Guide To Cron Jobs](https://ostechnix.com/a-beginners-guide-to-cron-jobs/)
- [Linux Crontab Reference Guide](https://linuxconfig.org/linux-crontab-reference-guide)
- [Check your disk space use with the Linux df command](https://www.redhat.com/sysadmin/linux-df-command)
- [Crontab Guru](https://crontab.guru)

### Possible problems encountered
I ran into a problem where the time and date were not properly being written to the datetime.txt file. After some troubleshooting I discovered the bash script didn't have the proper execute permissions.

### Result

Bash script for writing the time and date to datetime.txt:

```
#!/usr/bin/bash
echo $(date) > /home/tim_/datetime.txt
```

Added the job to crontab via `crontab -e`. I then used `cat datetime.txt` to make sure the date and time were properly written to datetime.txt:

![crontab](../00_includes/week_01_images/screen26.png)

Following that I created a script that writes the current available diskspace to /var/logs/diskspace.log:

```
#!/usr/bin/bash
df > /var/logs/diskspace.log
```

And lastly, I added the script to crontab, to be executed every Sunday at 00:00:

![crontab, diskspace](../00_includes/week_01_images/screen27.png)