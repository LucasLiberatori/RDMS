
###########################################################################################################
# Use of variables
# Ref
https://www.mssqltips.com/sqlservertip/7153/powershell-variable-examples-data-types-scope-name-assignment/
###########################################################################################################

# Specify the data type within brackets syntax
[Int]$myFirstVariable = 5
Write-Host $myFirstVariable

$myFirstVariable.GetType().Name

# We can change data type online
$myFirstVariable = 5
$myFirstVariable.GetType().Name
 
$myFirstVariable = "Hello World"
$myFirstVariable.GetType().Name

# To do that you need, specify explicitely the data type
[Int]$myFirstVariable = 5
$myFirstVariable.GetType().Name
 
[String]$myFirstVariable = "Hello World"
$myFirstVariable.GetType().Name

# What happend if you don't specify the first variable type?
$myFirstVariable = 5
$myFirstVariable.GetType().Name
 
[String]$myFirstVariable = "Hello World"
$myFirstVariable.GetType().Name


# PowerShell variables are not case-sensitive

# Assign Value to PowerShell Variable
[Int]$myFirstVariable = 1
$myFirstVariable += 5
$myFirstVariable 
Write-Host "----------------------------------"

$myFirstVariable -= 1
$myFirstVariable 
Write-Host "----------------------------------"

[String]$myFirstVariable  = if(1 -lt 0) {"true"} else {"false"}
$myFirstVariable


# SEcond example
[Int]${my-First-Variable} = 100
${my-First-Variable}

${my-First-Variable} = ${my-First-Variable} + 100
${my-First-Variable}
Write-Host "----------------------------------"

[String]${my Second Variable} = "Hello weird world"
${my Second Variable}
${my Second Variable} = ${my Second Variable}.Replace(' weird ', ' ')
${my Second Variable}


# Array
[System.Collections.ArrayList]$myFirstVariable = 1, 2, 3
$myFirstVariable
Write-Host "----------------------------------"

$myFirstVariable[2]
$myFirstVariable += 4
$myFirstVariable.Add(5)
Write-Host "----------------------------------"

$myFirstVariable
Write-Host "----------------------------------"

$myFirstVariable.RemoveAt(2) #This remove the value in position 3
$myFirstVariable


# Hash tables (Data Dictionary)
$myFirstVariableDictonary = @{"a" = 1; "b" = 2; "c" = 3}
$myFirstVariableDictonary
Write-Host "----------------------------------"
$myFirstVariableDictonary.Add("d", 4)
$myFirstVariableDictonary
Write-Host "----------------------------------"
$myFirstVariableDictonary.Remove("b")
$myFirstVariableDictonary


# Scope of PowerShell Variables
function fun_First {
    if ($myVariable) {
        Write-Host "Variable value: $myVariable"
    } else {
        Write-Host "I have nothing ..."
    } 
}
function fun_Second {
    $myVariable = "dummyValue"
    } 

fun_First
fun_Second
fun_First


function fun_First {
    if ($myVariable) {
        Write-Host "Variable value: $myVariable"
    } else {
        Write-Host "I have nothing ..."
    } 
}
function fun_Second {
    $global:myVariable = "dummyValue"
    } 

fun_First
fun_Second
fun_First
