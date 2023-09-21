
// =============================================================
//                     CLOUD PROJECT V1.0
// =============================================================
//
// Temporary commands:
//
// az deployment sub what-if --location westus3 --template-file main.bicep
// az deployment sub create --location westus3 --template-file main.bicep
// az keyvault purge --name keyVault-vxnackc5ttjdq
// --parameters trustedIpAddresses=<IP Address>
// Temp admin: projectuser
// Temp passs: jhas984dalkD#8
//
// Tenant ID: de60b253-74bd-4365-b598-b9e55a2b208d
// User ID: 46dd69bb-dc65-4d4a-987d-869e27a06014

targetScope = 'subscription'

@description('The Azure region into which the resources should be deployed.')
param location string = 'westus3'

@description('The name of the resource group.')
param resourceGroupName string = 'groupmain'

@description('A configuration for this deployment.')
@allowed([
  'Development'
  'Production'
])
param environmentName string = 'Production'

// @description('The name of the managed identity.')
// param managedIdentityName string = 'keyVaultIdentity'

@description('The IP adresses for the virtual network resources that should be deployed.')
param vnetIps array = [
  '10.10.10.0/24'
  '10.20.20.0/24'
]

//Subnets 10.10.10.64/26 - 10.10.10.128/26

@description('Trusted IP address for access to the management server via RDP.')
param trustedIpAddresses string = '82.101.204.89'

@description('The login name for the servers.')
@secure()
param loginName string

@description('The password for the servers.')
@secure()
param loginPassword string

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// ====== Resources created in this module =====================
// Virtual Networks, Subnets, Network Security Groups,
// Network Peering
// =============================================================
module newNetworks 'modules/network.bicep' = {
  name: 'newVnets'
  scope: newRG
  params: {
    location: location
    vnetIps : vnetIps
    trustedIpAddresses : trustedIpAddresses
  }
}

module database 'modules/database.bicep' = {
  name: 'database'
  scope: newRG
  params: {
    location: location
    sqlAdministratorLogin : loginName
    sqlAdministratorLoginPassword: loginPassword
    subnetId : newNetworks.outputs.subnet2
  }
}

// ====== Resources created in this module =====================
// Scaleset, App Gateway
// =============================================================
// module webserverVmss 'modules/scaleset.bicep' = {
//   name: 'webserverVmss'
//   scope: newRG
//   params: {
//     location: location
//     virtualNetworkName: 'vnet1'
//     subnetName: newNetworks.outputs.subnet1_2_name
//     appGwSubnetName: newNetworks.outputs.subnet1_name
//     adminPassword: loginPassword
//     adminUsername: loginName
//     instanceCount: 1
//     vmssName: 'webserverVmss'
//   }
// }

// ====== Resources created in this module =====================
// KeyVault, Managed Identity, Secret
// =============================================================
// module keyVault 'modules/keyvault.bicep' = {
//   name: 'keyVault'
//   scope: newRG
//   params: {
//     location: location
//     managedIdentityName : managedIdentityName
//     loginName : loginName
//     loginPassword : loginPassword
//   }
// }

// ====== Resources created in this module =====================
// Storage Account, Encryption Key
// =============================================================
// module storageAccount 'modules/storage.bicep' = {
//   name: 'storageAccount'
//   scope: newRG
//   params: {
//     location: location
//     managedIdentityName : managedIdentityName
//     keyVaultName : keyVault.outputs.keyVaultName
//   }
// }

// ====== Resources created in this module =====================
// Blob Container
// =============================================================
// module blob 'modules/blob.bicep' = {
//   name: 'blob'
//   scope: newRG
//   params: {
//     storageAccountName : storageAccount.outputs.storageAccountName
//   }
// }

// ====== Resources created in this module =====================
// Public IP Address, Network Interface, Virtual Machine
// =============================================================
// module vmwebserver 'modules/vm-webserver.bicep' = {
//   name: 'vmwebserver'
//   scope: newRG
//   params: {
//     location : location
//     subnetId : newNetworks.outputs.subnet1
//     adminUsername : loginName
//     adminPasswordOrKey: loginPassword
//     environmentName: environmentName
//   }
// }

// ====== Resources created in this module =====================
// Public IP Address, Network Interface, Virtual Machine
// =============================================================
module mngmntserver 'modules/vm-management.bicep' = {
  name: 'mngmntserver'
  scope: newRG
  params: {
    location : location
    subnetId : newNetworks.outputs.subnet2
    adminUsername : loginName
    adminPassword: loginPassword
    environmentName: environmentName
  }
}

// ====== Resources created in this module =====================
// Recovery Services Vault, Backup Policy, Protected Container
// =============================================================
// module backup 'modules/backup.bicep' = {
//   name: 'backup'
//   scope: newRG
//   params: {
//     location : location
//     vmName : vmwebserver.outputs.vmName
//     vmId : vmwebserver.outputs.vmId
//   }
// }
