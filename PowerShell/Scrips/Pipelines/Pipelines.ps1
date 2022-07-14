
<#
Pipelines in PowerShell
Talking about pipes, not in the programming space but in the real world, a pipe is something used to 
carry stuff from point A all along the way to point B.

In computing, a pipeline is a set of data-processing elements connected serially, where the output 
of one element (pipe) is the input for the very next element within the pipeline.

Ref
    https://www.mssqltips.com/sqlservertip/7272/powershell-pipelines-pass-parameters-examples/
#>

Get-Date | Format-List

Get-Date | Format-List | Out-File -FilePath .\PipelineFormatList.txt

# Get services with status Running
# Here we said. Take the services where property status is equeal to Running
Get-Service | Where-Object -Property Status -eq Running

# Show services that has SQL* name and status = Running
Get-Service | Where-Object -Property DisplayName -match 'SQL*' | Where-Object -Property Status -eq Running

# Show services that has SQL* name and status = Stopped and Start Service
Get-Service | Where-Object -Property DisplayName -match 'SQL*' | Where-Object -Property Status -eq Stopped | Start-Service

# Similar than before but here we check the Process not the Services
Get-Process | Where-Object -Property ProcessName -Match 'SQL*'

# Chain PowerShell Scripts with Pipelines
Check the example on webpage

Pretty cool if you ask me! Because this allows you to build complex solutions in a modular fashion. 
One use case that comes to my mind is having one script that returns a list of SQL Server instances 
and another script that grabs each instance and performs a connectivity test.

