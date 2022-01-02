@allowed([
  'dev'
  'prod'
])
param environment string
param resourcePostfix string

resource plan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'plan-badadvisor-${environment}-${resourcePostfix}'
  location: resourceGroup().location
  sku: {
    tier: 'Free'
    name: 'F1'
  }
  kind: 'linux'
  properties: {
    maximumElasticWorkerCount: 1
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: 'appservice-badadvisor-${environment}-${resourcePostfix}'
  location: resourceGroup().location
  properties: {
    serverFarmId: plan.id
  }
}
