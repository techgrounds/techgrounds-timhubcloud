@description('The Azure region into which the resources should be deployed.')
param location string

@description('The Vault Name.')
param vaultName string = 'vault-${uniqueString(resourceGroup().id)}'

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2023-04-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
  }
}
