@description('The Azure region inton which the resources should be deployed')
param location string

@description('The name of the app service app')
param appServiceAppName string = 'toy-${uniqueString(resourceGroup().id)}'

@description('The name of the App Service Plan SKU')
param appServicePlanSkuName string = 'F1'

@description('Indicates whetehr a CDN should be deployed')
param deployCdn bool = true

var appServicePlanName = 'toy-product-laucnh-plan'

module app 'modules/app.bicep' ={
  name: 'toy-launch-app'
  params: {
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
  }
}

module cdn 'modules/cdn.bicep' = if ((deployCdn)) {
  name: 'toy-launch-cdn'
  params: {
    httpsOnly: true
    originHostName: app.outputs.appServiceAppHostName
  }
}

@description('The host name to use to acces this website')
output websiteHostName string = deployCdn ? cdn.outputs.endpointHostName : app.outputs.appServiceAppHostName
