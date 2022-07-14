
# Open console as admin
Install-Module -Name SqlServer

# After the installation, you can confirm that it succeeded by typing 
Get-Module SqlServer -ListAvailable

# verify you have dbatools module installed
Get-InstalledModule -Name "dbatools"	

# If not install
Install-Module -Name "dbatools"
