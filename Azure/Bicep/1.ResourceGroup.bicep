param location string = 'eastus'

targetScope = 'subscription'
resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'az-bicep-dev-rg'
  location: location
}
