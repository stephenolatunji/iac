param location string = resourceGroup().location

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'az-bicep-dev-ai'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
