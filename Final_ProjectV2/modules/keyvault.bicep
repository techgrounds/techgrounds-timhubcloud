@description('Specifies the name of the key vault.')
param keyVaultName string = 'vaultNew-${uniqueString(resourceGroup().id)}'

@description('Specifies the managed identity.')
param managedIdentityName string

@description('Specifies the Azure location where the key vault should be created.')
param location string

@description('Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault.')
param enabledForDeployment bool = true

@description('Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys.')
param enabledForDiskEncryption bool = true

@description('Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault.')
param enabledForTemplateDeployment bool = true

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Login name for the server.')
@secure()
param loginName string

@description('Password for the server.')
@secure()
param loginPassword string

@description('Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge.')
param keysPermissions array = [
  'list'
  'unwrapKey'
  'wrapKey'
  'get'
]

@description('Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge.')
param secretsPermissions array = [
  'list'
]

// Create the managed identity
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdentityName
  location: location
  tags: {
    tagName1: 'keyvaultIdentity'
  }
}

// Create the keyvault and add the username and password as secrets
resource keyvault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enableSoftDelete: true
    enablePurgeProtection: true
    tenantId: tenantId
    accessPolicies: [
      {
        objectId: managedIdentity.properties.principalId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
        }
      }
      {
        objectId: '46dd69bb-dc65-4d4a-987d-869e27a06014'
        tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
        permissions: {
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
        }
      }
    ]

    sku: {
      name: skuName
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

resource secret1 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyvault
  name: 'ServerUsername'
  properties: {
    value: loginName
  }
}

resource secret2 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyvault
  name: 'ServerPassword'
  properties: {
    value: loginPassword
  }
}

resource secret3 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyvault
  name: 'CertificatePassword'
  properties: {
    value: 'testing'
  }
}

resource secret4 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyvault
  name: 'ServerPublicKey'
  properties: {
    value: loadTextContent('keys/sshkey.pub')
  }
}

resource secret5 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyvault
  name: 'ServerPrivateKey'
  properties: {
    value: loadTextContent('keys/sshkey')
  }
}

output keyVaultName string = keyVaultName
