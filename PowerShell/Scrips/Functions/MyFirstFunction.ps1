<#
Ref
    https://www.mssqltips.com/sqlservertip/7235/powershell-functions-sql-server-dba/

    Best Practices for functions
        . Name your funciton as descriptive as possible
        . Include a comment section
        . Follow a standard for parameters
#>


function myFirstBasicFunction {
    Write-Host "It's my first basic function"
}

myFirstBasicFunction

# Function with parameters
function myFunctionWithParameters {
    param (
        [Int]$parUno,
        [Int]$parDos
    )

    #Si le pongo o no el $ antes del parentesis es lo mismo por lo visto
    Write-Host $($parUno + $parDos)
}

myFunctionWithParameters 24 33


# Function with return
# The main difference, versus the one that doesn't return a value, is that you can assign the function 
# to a variable and use the output in a different section of your script
function myFunctionWithReturn {
    param (
        [Int]$parUno,
        [Int]$parDos
    )

    #Si le pongo o no el $ antes del parentesis es lo mismo por lo visto
    return $($parUno + $parDos)
}

$result = myFunctionWithReturn 24 33

Write-Host "The result is: $result"

# Function with mandatory parameters
function myFunctionWithMandatoryParameters {
    param (
        [Int]$parUno,

        [parameter(mandatory)]
        [Int]$parDos
    )

    #Si le pongo o no el $ antes del parentesis es lo mismo por lo visto
    return $($parUno + $parDos)
}

$result = myFunctionWithMandatoryParameters 24

Write-Host "The result is: $result"

#Now, what happens if I want to pass a value only for $p2, but not for $p1?
$result = myFunctionWithMandatoryParameters -parDos 24


# Function with mandatory parameters and Valid set of value for a parameter
function myFunctionWithValidSetParameters {
    param (
        [parameter(position = 0, mandatory = $false)]
        [ValidateSet(1,2,3,4,5)]
        [Int]$parUno,

        [parameter(position = 1, mandatory = $true)]
        [Int]$parDos,
      
        [parameter(position = 2, mandatory = $true)]
        [Int]$parTres
    )

    #Si le pongo o no el $ antes del parentesis es lo mismo por lo visto
    return $($parUno + $parDos + $parTres)
}

$result = myFunctionWithValidSetParameters 5 2 3

Write-Host "The result is: $result"


# Calling Functions from Another Script
<#
    So I have created a new script file called test.ps1 and in the first line I've put a dot and the 
    path where my function is hosted. After that, I'm able to invoke it without any issues.
#>
. "C>\Users\lliberatori\Desktop\Basic functions.ps1"
Write-Host $(myFunctionWithValidSetParameters 1 2 3)
