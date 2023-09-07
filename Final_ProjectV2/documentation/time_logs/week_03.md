# Log September 4, 2023

## Daily report
Had a look at the new requirements for version 1.1. Went through all the possible solution to fit these requirements in the azure architecture. Picked what I believed to be the best solutions and started working out possible implementations: Application Gateway and a Virtual Machine Scale Set.

## Obstacles
Had some issues with errors and deployment being quite slow. Since all the new requirements had to do with the webserver I decided to build it from the ground up and started out 

## Solutions
Since all the new requirements had to do with the webserver I decided to build it from the ground up and started out using only the networking module from the previous version. Plan is to make a working scaleset and app gateway and then add the previous version modules to it later.

## Learnings
How to implement App Gateway and VMSS with bicep.

---

# Log September 5, 2023

## Daily report
After drawing up a new architecture for the new version I decided to start working on the base version of the VMSS and the App Gateway redirection routing rules with the ssl certificate.

## Obstacles
I was expecting a lot of obstacles working with the self-signed certificate since Shikha mentioned previous groups had a lot of issues with this. Surprisingly it all seemed to work on the first attempt for me :) Unlike every other attempt at deploying resources, this one had no errors from the start.

## Solutions
No solutions needed.

## Learnings
How to work with App Gateway redirects and routing as well as how to upload a self-signed certificate.

---

# Log August 6, 2023

## Daily report
Did not do any work on the project. In the morning I had to create a presentation on presenting and in the afternoon I worked some more on my python programming course.

## Obstacles
No obstacles.

## Solutions
No solutions needed.

## Learnings
How to present a presentation on presenting. Python programming

---

# Log August 7, 2023

## Daily report
In the morning I implemented the final pieces of the puzzle: health checks and automatic repairs for the VMSS and a auto scaling setting for when the webserver is under heavy load. Now all requirements for version 1.1 are met I started working on the time logs, architecture visuals and documentation.

## Obstacles
No obstacles.

## Solutions
No solutions needed.

## Learnings.
