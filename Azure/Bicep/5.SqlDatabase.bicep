param location string = resourceGroup().location

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: 'az-bicep-dev-dbserver'
  location: location
  properties: {
    administratorLogin: 'sqlServer'
    administratorLoginPassword: 'Admin123'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: 'dev-db1'
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '1073741824'
    requestedServiceObjectiveName: 'Basic'
  }
}
