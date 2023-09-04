@description('VM Size.')
param vmSku string = 'Standard_B1s'

@description('VM Name.')
param vmssName string

@description('Number of VM instances (1000 or less).')
@minValue(2)
@maxValue(1000)
param instanceCount int

@description('Admin username on all VMs.')
param adminUsername string

@description('Default location')
param location string = resourceGroup().location

@description('Admin password on all VMs.')
@secure()
param adminPassword string

param virtualNetworkName string
param subnetName string
param appGwSubnetName string
param ubuntuOSVersion string = 'Ubuntu-2204'

var vmScaleSetName = toLower(substring('${vmssName}${uniqueString(resourceGroup().id)}', 0, 9))
var nicName = '${vmScaleSetName}nic'
var ipConfigName = '${vmScaleSetName}ipconfig'
var appGwPublicIPAddressName = '${vmScaleSetName}appGwPip'
var appGwName = '${vmScaleSetName}appGw'
var appGwFrontendPort = 443
var appGwBackendPort = 80
var appGwBePoolName = '${vmScaleSetName}appGwBepool'
var imageReference = {
  'Ubuntu-1804': {
    publisher: 'Canonical'
    offer: 'UbuntuServer'
    sku: '18_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2004': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-focal'
    sku: '20_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2204': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-jammy'
    sku: '22_04-lts-gen2'
    version: 'latest'
  }
}

resource appGwPublicIPAddress 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: appGwPublicIPAddressName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource appGw 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: appGwName
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 10
    }
    gatewayIPConfigurations: [
      {
        name: 'appGwIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, appGwSubnetName)
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwFrontendIP'
        properties: {
          publicIPAddress: {
            id: appGwPublicIPAddress.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGwFrontendPort'
        properties: {
          port: appGwFrontendPort
        }
      }
      {// =========== NEW
        name: 'redirPort'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: appGwBePoolName
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGwBackendHttpSettings'
        properties: {
          port: appGwBackendPort
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
        }
      }
    ]
    sslCertificates: [
      {
        name: 'sshCertificate'
        properties: {
          data: loadFileAsBase64('appgwcert.pfx')
          password: 'test'
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGwHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', appGwName, 'appGwFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', appGwName, 'appGwFrontendPort')
          }
          protocol: 'Https'
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', appGwName, 'sshCertificate')
          }
        }
      }
      {// ================================== NEW
        name: 'redirHttpToHttpsListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', appGwName, 'appGwFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', appGwName, 'redirPort')
          }
          protocol: 'Http'
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          ruleType: 'Basic'
          priority: 100
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGwName, 'appGwHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', appGwName, appGwBePoolName)
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection/', appGwName, 'appGwBackendHttpSettings')
          }
        }
      }
      {// ====================== NEW
        name: 'rule2'
        properties: {
          ruleType: 'Basic'
          priority: 110
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGwName, 'redirHttpToHttpsListener')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations', appGwName, 'redirConfigHttpToHttps')
          }
        }
      }
    ]
    redirectConfigurations: [// ====================== NEW
      {
        name: 'redirConfigHttpToHttps'
        properties:{
          redirectType: 'Permanent'
          includePath: true
          includeQueryString: true
          targetListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGwName, 'appGwHttpListener')
          }
        }
      }
    ]
  }
}

resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: vmScaleSetName
  location: location
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    overprovision: true
    singlePlacementGroup: false
    upgradePolicy: {
      mode: 'Automatic'
    }
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'FromImage'
        }
        imageReference: imageReference[ubuntuOSVersion]
      }
      osProfile: {
        computerNamePrefix: vmScaleSetName
        adminUsername: adminUsername
        adminPassword: adminPassword
        customData: loadFileAsBase64('customdata.sh')
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets/', virtualNetworkName, subnetName)
                    }
                    applicationGatewayBackendAddressPools: [
                      {
                        id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', appGwName, appGwBePoolName)
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
  dependsOn: [
    appGw
  ]
}
