<#
Ref
    https://www.mssqltips.com/sqlservertip/6223/create-sql-server-database-with-powershell/
#>

# ****************************************************************************************************************
# Method 1a – Create SQL Server Database Using PowerShell Invoke-SqlCmd calling a .sql script
# ****************************************************************************************************************

# First. Check if the SqlServer module is installed. If not run Install-Module -Name "SqlServer"
Get-InstalledModule -Name "SqlServer"

# Second. Paste the SQL code below into a file in C:\scripts called Create_MyDatabase.sql
CREATE DATABASE [PowerShellDB]
	CONTAINMENT = NONE
	ON  PRIMARY 
	
	( 
		  NAME 		 = N'PowerShellDB'
		, FILENAME 	 = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\PowerShellDB.mdf' 
		, SIZE 		 = 1048576KB 
		, FILEGROWTH = 262144KB )
 
	LOG ON 
	( 
		  NAME 	     = N'PowerShellDB_log'
		, FILENAME   = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\PowerShellDB_log.ldf' 
		, SIZE 	   	 = 524288KB 
		, FILEGROWTH = 131072KB )
GO

USE [PowerShellDB]
GO
ALTER DATABASE [PowerShellDB] SET RECOVERY SIMPLE WITH NO_WAIT
GO
 
ALTER AUTHORIZATION ON DATABASE::[PowerShellDB] TO [sa]
GO


# Third. Run 
# To CREATE db
Invoke-Sqlcmd -ServerInstance LAPTOP-60QH10D0\SQL2019_DEV -InputFile C:\Scripts\Create_PowerShellDB.sql

# To DROP db
Invoke-Sqlcmd -ServerInstance LAPTOP-60QH10D0\SQL2019_DEV -InputFile C:\Scripts\Drop_PowerShellDB.sql


# ****************************************************************************************************************
# Method 1b – Create SQL Server Database Using PowerShell Invoke-SqlCmd and a PowerShell variable
# ****************************************************************************************************************

# Import SqlServer module
Import-Module -Name "SqlServer"

# Create var
$varSQL = "
CREATE DATABASE [PowerShellDB]
	CONTAINMENT = NONE
	ON  PRIMARY 
	
	( 
		  NAME 		 = N'PowerShellDB'
		, FILENAME 	 = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\PowerShellDB.mdf' 
		, SIZE 		 = 1048576KB 
		, FILEGROWTH = 262144KB )
 
	LOG ON 
	( 
		  NAME 	     = N'PowerShellDB_log'
		, FILENAME   = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\PowerShellDB_log.ldf' 
		, SIZE 	   	 = 524288KB 
		, FILEGROWTH = 131072KB )
GO

USE [PowerShellDB]
GO
ALTER DATABASE [PowerShellDB] SET RECOVERY SIMPLE WITH NO_WAIT
GO
 
ALTER AUTHORIZATION ON DATABASE::[PowerShellDB] TO [sa]
GO"

Invoke-Sqlcmd -ServerInstance LAPTOP-60QH10D0\SQL2019_DEV -Query $varSQL


# ****************************************************************************************************************
# Method 2 - Create SQL Server Database Using PowerShell and SQL Server Management Object (SMO)
# ****************************************************************************************************************

# Import Module SqlServer
Import-Module -Name SqlServer

# Set Instance and Database Name
$varInstanceName = "LAPTOP-60QH10D0\SQL2019_DEV"
$varDBName = "PowerShellDB"
$varDBQuery = "SELECT 1 FROM master.sys.databases WHERE Name = '" + $varDBName + "'"
$varDBExists

# Change to SQL Server instance directory  
Set-Location SQLSERVER:\SQL\$inst   

# Create object and database
$varDBObject = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -Argumentlist $varInstanceName, $varDBName  

# Check if DB exists
$varDBExists = Invoke-Sqlcmd -ServerInstance $varInstanceName -Query $varDBQuery

if ($varDBExists -eq $null) {
    $varDBObject.Create()  

    # Set recovery model
    $varDBObject.RecoveryModel = "simple"
    $varDBObject.Alter()

    # Change owner
    $varDBObject.SetOwner('sa')
    
    # Change data file size and autogrowth amount
    foreach($datafile in $varDBObject.filegroups.files) 
    {
    $datafile.size = 1048576
    $datafile.growth = 262144
    $datafile.growthtype = "kb"
    $datafile.alter()
    }
    
    # Change log file size and autogrowth
    foreach($logfile in $varDBObject.logfiles)
    {
    $logfile.size = 524288
    $logfile.growth = 131072
    $logfile.growthtype = "kb"
    $logfile.alter()
    }
} else {
    Write-Host "Database already exists"
}


# ****************************************************************************************************************
#Method 3 - Create SQL Server Database Using PowerShell and dbatools
# ****************************************************************************************************************

$SqlInstance 	= 'LAPTOP-60QH10D0\SQL2019_DEV'                                           # SQL Server name 
$Name 			= 'PowerShellDB'                                                          # database name
$DataFilePath 	= 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\' # data file path
$LogFilePath 	= 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019_DEV\MSSQL\DATA\' # log file path
$Recoverymodel 	= 'Simple'                                                           	  # recovery model
$Owner 			= 'sa'                                                                    # database owner
$PrimaryFilesize 	= 1024                                                                # data file initial size
$PrimaryFileGrowth 	= 256                                                            	  # data file autrogrowth amount
$LogSize 			= 512                                                                 # data file initial size
$LogGrowth 			= 128                                                                 # data file autrogrowth amount

New-DbaDatabase -SqlInstance $SqlInstance -Name $Name -DataFilePath $DataFilePath -LogFilePath $LogFilePath -Recoverymodel $Recoverymodel -Owner $Owner -PrimaryFilesize $PrimaryFilesize -PrimaryFileGrowth $PrimaryFileGrowth -LogSize $LogSize -LogGrowth $LogGrowth | Out-Null

			
		




