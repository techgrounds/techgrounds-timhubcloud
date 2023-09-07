## Application Manual

This document will instruct you on how the application can be deployed in your Azure environment. It will outline the prerequisites, commands and parameters needed to create a successful deployment.

The following steps use the Azure Command Line Interface to deploy resources using a bicep file. If you prefer another method please visit the following Microsoft documentation pages:

- Deploy using **Visual Studio Code**
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-vscode
- Deploy using **PowerShell**
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-powershell
- Deploy using **CloudShell**
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cloud-shell?tabs=azure-cli

Otherwise follow the steps below to use our preferred method (Azure CLI):

### Prerequisites

#### Step 1
Install Azure CLI commands on your local computer. To deploy Bicep files, you need Azure CLI version 2.20.0 or later.
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

#### Step 2
Connect to Azure by using ```az login```. If you have multiple Azure subscriptions, you might also need to run az account set.

#### Step 3
Change your current working directory to the folder containing the main.bicep file using the ```cd <path>``` command. Replace ```<path>``` with the path to the application folder.

### Deployment

To deploy the application use the code below:

```az deployment sub create --template-file main.bicep --parameters trustedIpAddresses=<IP Address>```

**Important**: replace `<IP Address>` with the IP address you wish to use to access the management server. More addresses can be added later.

During the deployment process you will be asked to provide a **Login Name** and **Login Password**. These will be used later to access the web- and management server via **SSH** and **RDP** respectively.

**Important**: the Login Name and Password have several security requirements.

**Login Name**:
- Usernames can be a maximum of 20 characters in length and cannot end in a period (".").
- The following names are not allowed: *1, 123, a, actuser, adm, admin, admin1, admin2, administrator, aspnet, backup, console, david, guest, john, owner, root, server, sql, support_388945a0, support, sys, test, test1, test2, test3, user, user1, user2*

**Login Password**:
There are varying password length requirements, depending on the tool you are using:

- Portal - between 12 - 123 characters
- PowerShell - between 8 - 123 characters
- CLI - between 12 - 123

The password must also:

- Have lower characters
- Have upper characters
- Have a digit
- Have a special character (Regex match [\W_])

- The following passwords are not allowed: *abc@123 	iloveyou! 	P@\$\$w0rd 	P@ssw0rd 	P@ssword123 Pa$$word 	pass@word1 	Password! 	Password1 	Password22*

### Additional Parameters

Apart from the ```trustedIpAddresses``` there are several more optional parameters that can be used in your deployment to further customize the application:

**location** (string): the location where your resource group and resources contained within will be deployed. (e.g. ```eastus```)

**resourceGroupName** (string): the name of the resource group that will be created for this deployment. Default is: ```maingroup```

**environmentName** (string): the default here is ```Production```. This will set all the variables in the bicep file to Production standards. Leave this as is unless you want to do a test deployment, in which case you should alter this to ```Development```.