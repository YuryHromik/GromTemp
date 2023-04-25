@allowed([
  'dev'
  'prod'
])
param environment string 
param resourcePostfix string
param location string = resourceGroup().location
param planConfig object

module storageAccount 'resources/storageAccount.bicep' = {
  name: 'storageAccount-deployment'
  params: {
    environment: environment
    resourcePostfix: resourcePostfix
    location: location
  }
}

module appService 'resources/appService.bicep' = {
  name: 'appService-deployment'
  params: {
    environment: environment
    resourcePostfix: resourcePostfix
    location: location
    planConfig:planConfig
  }
}
