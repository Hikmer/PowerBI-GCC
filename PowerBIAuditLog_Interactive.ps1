#Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser -Force

#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

#$MSOCred = Get-AutomationPSCredential 
Connect-PowerBIServiceAccount -Environment USGov 


30..0 |
foreach {

 $Date = (((Get-Date).Date).AddDays(-$_))
 $StartDate = (Get-Date -Date ($Date) -Format yyyy-MM-ddTHH:mm:ss)
 $EndDate = (Get-Date -Date ((($Date).AddDays(1)).AddMilliseconds(-1)) -Format yyyy-MM-ddTHH:mm:ss)
 
 $LogName = "PowerBI_AudititLog_$(Get-Date -Date $Date -Format yyyyMMdd).json"
 Write-Output $LogName
 $LogFile = New-Item -ItemType File -Name $LogName -Force

 Get-PowerBIActivityEvents -StartDateTime $StartDate -EndDateTime $EndDate -ResultType JsonString | 
 Out-File -FilePath "%yourpath%\Logs\PowerBI_AudititLog_$LogName.json" 
 
 }