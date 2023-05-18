param location string = resourceGroup().location

// To create Windows based Appservice Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'az-bicep-dev-asp'
  location: location
  sku: {
    name: 'S1'
    capacity: 1
  }
}


// To create linux based app service plan
resource linuxAppServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  kind: 'linux'
  properties: {
    reserved: true
  }
  name: 'az-bicep-dev-linux-asp'
  location: location
  sku: {
    name: 'S1'
    capacity: 1
  }
}
