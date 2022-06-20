#Get-Service | Where-Object($_.displayname -match "sql")

#psdrive
#$PSVersionTable

Get-ExecutionPolicy -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

##########################################################
# Modules
##########################################################

#To know wich modules are install
Get-Module
Get-InstalledModule

#Set repository as truest
Set-PSRepository -Name PSGallery

#Install module
Install-Module -Name SqlServer -Scope AllUsers
Install-Module -Name dbatools -Scope AllUsers

#Load modules to be use
Import-Module SqlServer
Import-Module dbatools

#To uninstall module you need to remove and uninstall
Remove-Module -Name SqlServer
Uninstall-Module -Name SqlServer

Remove-Module -Name dbatools
Uninstall-Module -Name dbatools

##########################################################
# Helpful cmdlet (stored procedure)
##########################################################

#To know a list of all commands for a module
Get-Command -Module dbatools
(Get-Command -Module dbatools).count

#If you don't know what a command do
Get-Help Get-DbaDatabase -online 

#Return methods, properties, and type of the objects 
Get-Service | Get-Member 

#List of all alias for a command type
Get-Alias

##########################################################
# Use Get-Service
##########################################################

#Display services that include a search string
Get-Service -DisplayName "*sql*"
Get-Service "*sql*"

#Get services that begin with a search string and an exclusion
Get-Service -DisplayName "sql*" -Exclude "SQL Full-text Filter Daemon Launcher (SQL2019_DEV)"
Get-Service "sql*" -Exclude "SQL Full-text Filter Daemon Launcher (SQL2019_DEV)"

#Display services that are currently active
Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service | ? {$_.Status -eq "Running"} #using alias for Where-Object

Get-Service | Sort-Object status
Get-Service "s*" | Sort-Object status



##########################################################
# Vars
##########################################################

$SQLSvr = Get-Service -Name "MSSQLSERVER"