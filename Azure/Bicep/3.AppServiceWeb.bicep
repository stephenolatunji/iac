param location string = resourceGroup().location

resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'az-bicep-dev-webapp'
  location: location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'az-bicep-dev-linux-asp')
  }
}
