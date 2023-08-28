@description('The Azure region into which the resources should be deployed.')
param location string

@description('The Vault Name.')
param vaultName string = 'vault-${uniqueString(resourceGroup().id)}'

param backupPolicyName string = 'DefaultPolicy'

param vmName string
param vmId string

//----

// param policyName string = 'TestingPolicy'

//----

var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${vmName}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${vmName}'


//-----

// var scheduleRunTimes = [
//   '2017-01-26T05:30:00Z'
// ]

// ------

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2021-03-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    // publicNetworkAccess: 'Disabled'
  }
}

// resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2021-03-01' = {
//   parent: recoveryServicesVault
//   name: policyName
//   location: location
//   properties: {
//     backupManagementType: 'AzureIaasVM'
//     instantRpRetentionRangeInDays: 7
//     schedulePolicy: {
//       scheduleRunFrequency: 'Daily'
//       scheduleRunTimes: scheduleRunTimes
//       schedulePolicyType: 'SimpleSchedulePolicy'
//     }
//     retentionPolicy: {
//       dailySchedule: {
//         retentionTimes: scheduleRunTimes
//         retentionDuration: {
//           count: 104
//           durationType: 'Days'
//         }
//       }
//       weeklySchedule: {
//         daysOfTheWeek: [
//           'Sunday'
//           'Tuesday'
//           'Thursday'
//         ]
//         retentionTimes: scheduleRunTimes
//         retentionDuration: {
//           count: 104
//           durationType: 'Weeks'
//         }
//       }
//       monthlySchedule: {
//         retentionScheduleFormatType: 'Daily'
//         retentionScheduleDaily: {
//           daysOfTheMonth: [
//             {
//               date: 1
//               isLast: false
//             }
//           ]
//         }
//         retentionTimes: scheduleRunTimes
//         retentionDuration: {
//           count: 60
//           durationType: 'Months'
//         }
//       }
//       yearlySchedule: {
//         retentionScheduleFormatType: 'Daily'
//         monthsOfYear: [
//           'January'
//           'March'
//           'August'
//         ]
//         retentionScheduleDaily: {
//           daysOfTheMonth: [
//             {
//               date: 1
//               isLast: false
//             }
//           ]
//         }
//         retentionTimes: scheduleRunTimes
//         retentionDuration: {
//           count: 10
//           durationType: 'Years'
//         }
//       }
//       retentionPolicyType: 'LongTermRetentionPolicy'
//     }
//     timeZone: 'UTC'
//   }
// }

resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2021-03-01' = {
  name: '${vaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    //policyId: backupPolicy.id
    policyId: '${recoveryServicesVault.id}/backupPolicies/${backupPolicyName}'
    sourceResourceId: vmId
  }
} 
