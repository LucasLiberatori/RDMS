
<#
    Ref
    https://www.mssqltips.com/sqlservertip/7262/cmdlets-for-powershell-examples/

#>

# CMDLET
Get-Date

# CMDLET with parameter
Get-Date -DisplayHint Date

# CMDLET with variable
[datetime]$startDate = Get-Date
Write-Host $startDate

Start-Sleep -Seconds 5

[datetime]$endDate = Get-Date
Write-Host $endDate

New-TimeSpan -Start $startDate -End $endDate


# Advance Function
function myFirstAdvanceFunction {
    [CmdletBinding()]
    param (
        [parameter(mandatory=$true)]
        [String]$X
    )
        
    process {
        Write-Host ("I wrote: " + $X)
    }
}

myFirstAdvanceFunction -X "this is some advance stuff!!"
