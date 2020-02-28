# PowerBI-GCC
Power BI Content for Government and Public Sector Customers

This article will explain how one can export a complete inventory of your Power BI tenant.  

NOTE:  While I am focusing this for content for government customers, it doesn’t mean that it is exclusively only usable in those environments.  

The following prerequisites are required:

PowerShell
Power BI Desktop

First install the PowerShell Power BI Management modules 

Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser

Running the following script as an O365 Admin will result in a JSON file saved to your local computer.  

Connect-PowerBIServiceAccount -Environment USGov

Invoke-PowerBIRestMethod -Url 'admin/groups?$top=5000&$skip=0&$expand=reports,dashboards,datasets,users,dataflows' -Method GET  | Out-File "C:\MyPathHere\PowerBIResults.json"

Download the AdminTenantReport template file and point the data source to the JSON file exported using the PowerShell script.

You should now have a current listing of all your Workspaces, Users, Reports, Dashboards, Datasets and Dataflows in a very handy Power BI report.
