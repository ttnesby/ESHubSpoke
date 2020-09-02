[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $location = "westeurope"
)
#autentiserer med MSI
import-module az.accounts
connect-azaccount -identity

$templateURI = 'https://raw.githubusercontent.com/navgov/hubspoke/master/armTemplates/es-hubspoke.json?token=AAU4OQ33TP3LZJY3JIU6IZ27KCKKY'

#deployer fra github
Test-AzTenantDeployment -Location $location -TemplateUri $templateURI -TemplateParameterFile "./armTemplates/es-hubspoke.parameters.json"