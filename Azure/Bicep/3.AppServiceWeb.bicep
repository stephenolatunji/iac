param location string = resourceGroup().location

resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'az-bicep-dev-webapp'
  location: location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'az-bicep-dev-linux-asp')
  }
}

resource appSettings 'Microsoft.Web/sites/config@2022-09-01' = {
  name: 'web'
  parent: webApp
  properties: {
    appSettings: [
      {
        name: 'WEBSITE_ENABLED_STORAGE'
        value: 'fakeValue'
      }
      {
        name: 'WEBSITE_ENABLED_INSIGHT'
        value: 'falseValue'
      }
    ]
  }
}
