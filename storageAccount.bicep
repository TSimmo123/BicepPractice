resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'simmostorage12345fhreihu'
  location: 'UK South'
  sku:{
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
  properties:{
    accessTier: 'Hot'
  }
}
