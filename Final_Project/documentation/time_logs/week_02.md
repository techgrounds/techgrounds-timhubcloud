# Log August 28, 2023

## Daily report
Created the final version for the webserver, then continued and completed the first versions of the management server and the backup system.

## Obstacles
Encountered a deployment error that kept me busy for a long time. Deployment gave a NO_PARAM error message which I tracked down somewhere in the creation of a new Backup Policy. The error message was very non-descriptive however which made finding the flaw in the code very difficult.

## Solutions
After a long process of adding and deleting various possible parameters in the backup policy code I eventually created an error free deployment. The exact cause of the original error is still somewhat unclear, but everything works now.

## Learnings
If you are hard stuck on a bug, attempt to track down the error as much as possible, then transfer the problem causing code to a seperate testing environment and just keep hammering at it using trial and error until it works.

---

# Log August 29, 2023

## Daily report
Did another deployment test just to make sure everything works as it should. After that I started working on all the documentation, logs and diagrams. Added availability zone allocation for servers.

## Obstacles


## Solutions


## Learnings

