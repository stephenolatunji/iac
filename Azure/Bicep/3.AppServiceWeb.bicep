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
      {
        name: 'APPINSIGHT_INSTRUMENTATIONKEY'
        value: appInsightsComponents.properties.InstrumentationKey
      }
    ]
  }
}

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'az-bicep-dev-ai'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
