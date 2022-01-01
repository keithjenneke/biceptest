targetScope = 'subscription'

@description('The name of the department.')
@allowed([
  'ictb'
])
param department string

@description('The name of the environment. This must be spt, dev, tst, sit, uat, ppd, prd.')
@allowed([
  'spt'
  'dev'
  'tst'
  'sit'
  'uat'
  'ppd'
  'prd'
])
param environment string

@description('The location of the environment. This must be aes or ase.')
@allowed([
  'australiaeast'
  'australiasoutheast'
])
param location string

@description('The name of the project or application.')
param application string

var locationShortName = location == 'australiaeast' ? 'aes' : 'ase'
var resourceGroupName = '${department}-${environment}-${locationShortName}-rg-${application}'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  properties: {}
}
