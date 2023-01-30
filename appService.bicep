resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'App-service-plan'
  location: 'UK South'
  sku:{
    name:'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'app-service-app'
  location: 'UK South'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
