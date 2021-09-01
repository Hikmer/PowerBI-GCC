Install-Module -Name DataGateway
	 
#Login to O365 as Admin: 
 
Login-DataGatewayServiceAccount -Environment USGov

#List existing gateways

#https://docs.microsoft.com/en-us/powershell/module/datagateway/get-datagatewaycluster?view=datagateway-ps
Get-DataGatewayCluster -Scope Organization
 
#Consider restricting gateway setup moving forward
#https://docs.microsoft.com/en-us/powershell/module/datagateway/set-datagatewaytenantpolicy?view=datagateway-ps
Set-DataGatewayTenantPolicy -PersonalGatewayInstallPolicy Restricted
Set-DataGatewayTenantPolicy -ResourceGatewayInstallPolicy Restricted

#Reopen gaeway access for a brief period of time to install
Set-DataGatewayTenantPolicy -PersonalGatewayInstallPolicy Open
Set-DataGatewayTenantPolicy -ResourceGatewayInstallPolicy Open

#Assign a user to allow gateway install rights
#https://docs.microsoft.com/en-us/powershell/module/datagateway/set-datagatewayinstaller?view=datagateway-ps

$user1 = $(Get-AzADUser -ObjectId "testUpn@tenant.com").Id
$user2 = $(Get-AzADUser -ObjectId "testUpn@tenant.com").Id
Set-DataGatewayInstaller -PrincipalObjectIds $user1,$user2 -Operation Add -GatewayType Resource
