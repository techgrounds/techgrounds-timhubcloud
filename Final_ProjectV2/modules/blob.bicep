@description('Name of the storage account')
param storageAccountName string

@description('Name for blob container that holds post deployment scripts')
param blobContainerName string = 'scriptstorage'

// Create blob storage for scripts and set to private
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${storageAccountName}/default/${blobContainerName}'
  properties: {
    publicAccess: 'None'
  }
}
