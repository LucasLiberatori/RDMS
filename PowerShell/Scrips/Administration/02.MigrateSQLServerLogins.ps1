
<#
    Ref
        https://www.mssqltips.com/sqlservertip/4654/migrate-sql-server-logins-with-powershell/
#>

# *****************************************************************************************************************
    Copy-DbaLogin
# *****************************************************************************************************************

# This example copy user DemoLogin1 from localhost instance to localhost\RacingClub
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub -Login DemoLogin1
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub -Login DemoLogin1, DemoLogin2
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub

# This example copy user DemoLogin1 from localhost instance to localhost\RacingClub and delete the user in 
# localhost\RacingClub if exist
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub -Login DemoLogin1 -Force
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub -Login DemoLogin1, DemoLogin2 -Force
Copy-DbaLogin -Source localhost -Destination localhost\RacingClub -Force

#Copies all logins from Source Destination. If a SQL Login on Source exists on the Destination, the Login on 
#Destination will be dropped and recreated. If any active connections are found they will be killed.
Copy-DbaLogin -Source sqlserver2014a -Destination sqlcluster -Force -KillActiveConnection

# Copy both SQL and Windows user
Copy-DbaLogin -Source localhost -Destination localhost\sql2016 -Logins DemoLogin2,DemoLogin3,'Domain\user'

# To migrate all users from one instance to another, remove the -Logins parameter from the scripts as follows.
Copy-DbaLogin -Source localhost -Destination localhost\sql2016  

# If we want to exclude a specific login, use the -Exclude parameter as shown below.
Copy-DbaLogin -Source localhost -Destination localhost\sql2016  -Exclude Demologin1


# *****************************************************************************************************************
    Export-DbaLogin
# *****************************************************************************************************************


