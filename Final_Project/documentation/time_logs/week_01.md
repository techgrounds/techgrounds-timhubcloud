# Log August 21, 2023


## Daily report
Read through the assignment and setup all files and tools needed for the project (Jira, .md for doccumentation, Visual Studio Code, Azure CLI)

## Obstacles
No obstacles.

## Solutions
No solutions needed.

## Learnings
How to use Jira; how to use the Azure CLI to interact with my subscription; what the project entails.

---

# Log August 22, 2023

## Daily report
Wrote down questions for our scrum master to ask the product owners (meeting set at 14:00 tomorrow) and did a deep dive into the Microsoft Bicep learn modules.

## Obstacles
Had problems with laggy and failed deployment in my Azure Sandbox.

Another problem was with the Azure Sandbox code block examples requiring multiple lines but not knowing how to do this in Bash.

## Solutions
First problem fixed itself after about 30 minutes.

Second problem solution found on stackoverflow:

> So, you literally need a newline (press ENTER) after you type the \ to tell the shell you want to enter more parameters but on a separate line.

## Learnings
How to analyze a product owners' requirement and formulate questions; how to deploy resources using bicep, parameter file, modules etc.

---

# Log August 23, 2023

## Daily report
Had our meeting with the product owner. A lot of questions were answered. Started lining out a deployment plan.

## Obstacles
No obstacles.

## Solutions
No solutions needed.

## Learnings
As more in depth questions to get a good grasp of the required infrastructure.

---

# Log August 24, 2023

## Daily report
Started building the first version of the main bicep and several modules. Created the network, subnets, NSGs, keyvault and storage account.

## Obstacles
Had to deal with a lot of error fixing. One of the biggest was the creation of a keyvault to hold the encryption keys which required soft delete enabled and purging not allowed, meaning I couldn't remove the container in a deleted state. At the same time the key generation failed because a key already existed from a previous deployment with a different expiration date.

## Solutions
Made the expiration date static for the moment. Will fix in a future version.

## Learnings
How to deal with errors and how to use what-if to test deployments without deloying.

---

# Log August 25, 2023

## Daily report
Created a blob storage module for the post-deployment scripts.

## Obstacles


## Solutions


## Learnings
