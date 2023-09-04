@description('The IP adresses for the vnet resources that should be deployed.')
param vnetIps array

@description('The Azure region into which the resources should be deployed.')
param location string

@description('Trusted IP addresses for access to the management server.')
param trustedIpAddresses string

// NSG for the webserver vnet (webserver access and ssh via the management server)
resource nsgVnet1 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: 'nsgVnet1'
  location: location
  properties: {
    securityRules: [
      {
        name: 'sshFromMngmt'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: vnetIps[1]
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'httpForWebserver'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
        }
      }
    ]
  }
}

// NSG for the management vnet (only allow access from trusted locations/IP)
resource nsgVnet2 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: 'nsgVnet2'
  location: location
  properties: {
    securityRules: [
      {
        name: 'sshIntoMngmt'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: trustedIpAddresses
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
        }
      }
      {
        name: 'rdpIntoMngmt'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: trustedIpAddresses
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 102
          direction: 'Inbound'
        }
      }
    ]
  }
}

// First virtual network for the webserver
resource virtualNetwork1 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: 'vnet1'
  location: location
  properties:{
    addressSpace:{
      addressPrefixes:[
        vnetIps[0]
      ]
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.10.10.64/26'
        }
      }
      {
        name: 'subnet1_2'
        properties: {
          addressPrefix: '10.10.10.128/26'
        }
      }
    ]
  }
}

// Second virtual network for the management server
resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: 'vnet2'
  location: location
  properties:{
    addressSpace:{
      addressPrefixes:[
        vnetIps[1]
      ]
    }
    subnets: [
      {
        name: 'subnet2'
        properties: {
          addressPrefix: vnetIps[1]
          networkSecurityGroup: {
            id: nsgVnet2.id
          }
        }
      }
    ]
  }
}

// Peering vnet 1 to vnet 2
resource peeringVnet1to2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  name: 'vnet1to2'
  parent: virtualNetwork1
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork2.id
    }
  }
}

// Peering vnet 2 to vnet 1
resource peeringVnet2to1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  name: 'vnet2to1'
  parent: virtualNetwork2
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork1.id
    }
  }
}

output subnet1 string = virtualNetwork1.properties.subnets[0].id
output subnet1_2 string = virtualNetwork1.properties.subnets[1].id
output subnet1_name string = virtualNetwork1.properties.subnets[0].name
output subnet1_2_name string = virtualNetwork1.properties.subnets[1].name
output subnet2 string = virtualNetwork2.properties.subnets[0].id
output nsg1 string = nsgVnet1.name
