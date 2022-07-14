
<#
Ref
    https://www.mssqltips.com/sqlservertip/2702/setting-the-powershell-execution-policy/

    Execution Policy determines how (or if) PowerShell runs scripts. By default, PowerShell's execution policy is set to Restricted; 
    this means that scripts will not run.

    You can verify the execution policy setting by using the Get-ExecutionPolicy PowerShell command as shown below:

    get-executionpolicy

    You can change the PowerShell script execution behavior using "Set-ExecutionPolicy"

    Restricted - No scripts can be run. Windows PowerShell can be used only in interactive mode.
    AllSigned - Only scripts signed by a trusted publisher can be run.
    RemoteSigned - Downloaded scripts must be signed by a trusted publisher before they can be run.
    Unrestricted - No restrictions; all scripts can be run.

    #>

    set-executionpolicy unrestricted
    get-executionpolicy
    
    --or
    set-executionpolicy remotesigned
    get-executionpolicy
