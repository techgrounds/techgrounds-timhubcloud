@description('The location into which the resources should be deployed.')
param location string = resourceGroup().location

param managedIdentityName string
param keyVaultName string

@description('Name of the key in the Key Vault')
param keyVaultKeyName string = 'cmkey'

// CHANGE BACK TO THIS AFTER TESTING (This is to avoid The key 'cmkey' already exists, but the specified key creation parameters did not match that of the existing key errors)
//@description('Expiration time of the key')
//param keyExpiration int = dateTimeToEpoch(dateTimeAdd(utcNow(), 'P1Y'))

@description('Expiration time of the key')
param keyExpiration int = 1724419997

@description('The name of the Storage Account')
param storageAccountName string =  'storage${uniqueString(resourceGroup().id)}'

// Use the managed identity created in keyvault.bicep
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: managedIdentityName  
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: keyVaultName
}

resource kvKey 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
  parent: keyVault
  name: keyVaultKeyName
  properties: {
    attributes: {
      enabled: true
      exp: keyExpiration
    }
    keySize: 4096
    kty: 'RSA'
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentity.id}': {}
    }
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    encryption: {
      identity: {
        userAssignedIdentity: managedIdentity.id
      }
      services: {
         blob: {
           enabled: true
         }
      }
      keySource: 'Microsoft.Keyvault'
      keyvaultproperties: {
        keyname: kvKey.name
        keyvaulturi: endsWith(keyVault.properties.vaultUri,'/') ? substring(keyVault.properties.vaultUri,0,length(keyVault.properties.vaultUri)-1) : keyVault.properties.vaultUri
      }
    }
  }
}
