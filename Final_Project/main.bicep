
// ----- MAIN -----

// Temporary commands:
// az deployment sub create --location westus3 --template-file main.bicep
// az keyvault purge --name keyVault-vxnackc5ttjdq

targetScope = 'subscription'

@description('The Azure region into which the resources should be deployed.')
param location string = 'westus3'

@description('The name of the resource group.')
param resourceGroupName string = 'groupmain'

@description('The name of the managed identity.')
param managedIdentityName string = 'keyVaultIdentity'

@description('The IP adresses for the vnet resources that should be deployed.')
param vnetIps array = [
  '10.10.10.0/24'
  '10.20.20.0/24'
]

@description('Trusted IP addresses for access to the management server. Seperated by a comma.')
param trustedIpAddresses string = '10.10.10.0'

@description('The login name for the server.')
@secure()
param loginName string

@description('The password for the server.')
@secure()
param loginPassword string

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

module newNetworks 'modules/network.bicep' = {
  name: 'newVnets'
  scope: newRG
  params: {
    location: location
    vnetIps : vnetIps
    trustedIpAddresses : trustedIpAddresses
  }
}

module keyVault 'modules/keyvault.bicep' = {
  name: 'keyVault'
  scope: newRG
  params: {
    location: location
    managedIdentityName : managedIdentityName
    loginName : loginName
    loginPassword : loginPassword
  }
}

module storageAccount 'modules/storage.bicep' = {
  name: 'storageAccount'
  scope: newRG
  params: {
    location: location
    managedIdentityName : managedIdentityName
    keyVaultName : keyVault.outputs.keyVaultName
  }
}
