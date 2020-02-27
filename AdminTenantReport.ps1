Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser
Connect-PowerBIServiceAccount -Environment USGov
Invoke-PowerBIRestMethod -Url 'admin/groups?$top=5000&$skip=0&$expand=reports,dashboards,datasets,users,dataflows' -Method GET  | Out-File "C:\MyPathHere\PowerBIResults.json"