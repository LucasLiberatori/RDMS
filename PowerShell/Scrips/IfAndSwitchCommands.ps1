<###################################################
# IF ELSE and SWITCH
###################################################>

# REF
# https://www.mssqltips.com/sqlservertip/7188/powershell-if-if-else-switch-examples/?utm_source=dailynewsletter&utm_medium=email&utm_content=headline&utm_campaign=20220324

# --------------------------------------------------
# IF
# --------------------------------------------------
$varNumber = 100

if ($varNumber -eq 10) {
    Write-Host "I am exactly 10"
}

if ($varNumber -lt 10) {
    Write-Host "I am less than 10"
}

if ($varNumber -gt 10) {
    Write-Host "I am greather than 10"
}

# IF plus Operators
$varNumber = 50

if (($varNumber -gt 40) -and ($varNumber -lt 100)) {
    Write-Host "I am old but not to old .... :-)"
}

if (($varNumber -gt 0) -or ($varNumber -lt 100)) {
    Write-Host "I am just a lucky number .... :-)"
}

# If Else
$varNumber = 10

if ($varNumber -gt 11) {
    Write-Host "I am greather than 11 .... :-)"
}
else {
    Write-Host "I am lower than 11 .... :-)"
}

# Nested If
# Example 1
$varText = "youtube"

if ($varText -match 'tuber') {
    Write-Host "Keep the videos rolling!!"
}
elseif ($varText -match 'you') {
    Write-Host "Who me??"
}
else {
    Write-Host "Nothing fancy really ..."
}

# Example 2
$varText = "x"

if ($varText -match 'a') {
    Write-Host "Test 1"
}
elseif ($varText -match 'b') {
    Write-Host "Test 2"
}
elseif ($varText -match 'c') {
    Write-Host "Test 3"
}
elseif ($varText -match 'd') {
    Write-Host "Test 4"
}
else {
    Write-Host "Nothing fancy really ..."
}

# --------------------------------------------------
# SWITCH
# --------------------------------------------------

# Example 1 IF vs SWITCH
$varDayOfWeek = 6
$varDay = ""

if ($varDayOfWeek -eq 0) {
    $Day = 'Sunday'
} elseif ($varDayOfWeek -eq 1) {
    $Day = 'Monday'
} elseif ($varDayOfWeek -eq 2) {
    $Day = 'Tuesday'
} elseif ($varDayOfWeek -eq 3) {
    $Day = 'Wednesday'
} elseif ($varDayOfWeek -eq 4) {
    $Day = 'Thursday'
} elseif ($varDayOfWeek -eq 5) {
    $Day = 'Friday'
} elseif ($varDayOfWeek -eq 6) {
    $Day = 'Saturday'
}
 Write-Host $Day


$varDayOfWeek = 6
$varDay = ""

switch ($varDayOfWeek) 
{
    0 { $varDay = 'Sunday' }
    1 { $varDay = 'Monday' }
    2 { $varDay = 'Tuesday' }
    3 { $varDay = 'Wednesday' }
    4 { $varDay = 'Thursday' }
    5 { $varDay = 'Friday' }
    6 { $varDay = 'Saturday' }                
    Default {$varDay = 'Error'}
}

Write-Host $Day

#SWITCH with Break
    # Whitout Break this is going to print Monday
    $varDayOfWeek = 1
    $varDay = ""

    switch ($varDayOfWeek) 
    {
        1 { $varDay = 'Sunday' }
        1 { $varDay = 'Monday' }
        2 { $varDay = 'Tuesday' }
        3 { $varDay = 'Wednesday' }
        4 { $varDay = 'Thursday' }
        5 { $varDay = 'Friday' }
        6 { $varDay = 'Saturday' }
    }

    Write-Host $varDay

    # Whit Break this is going to print Sunday
    $varDayOfWeek = 1
    $varDay = ""

    switch ($varDayOfWeek) 
    {
        1 { $varDay = 'Sunday'; break }
        1 { $varDay = 'Monday' }
        2 { $varDay = 'Tuesday' }
        3 { $varDay = 'Wednesday' }
        4 { $varDay = 'Thursday' }
        5 { $varDay = 'Friday' }
        6 { $varDay = 'Saturday' }
    }

    Write-Host $varDay

# SWITCH and Vars
$varDayOfWeek = 1
$varDay = switch ($varDayOfWeek) 
    {
        0 { 'Sunday' ; break }
        1 { 'Monday' ; break }
        2 { 'Tuesday'; break }
        3 { 'Wednesday' ; break }
        4 { 'Thursday' ; break }
        5 { 'Friday' ; break }
        6 { 'Saturday' ; break }
    Default{'Error'}
    }

Write-Host $varDay

# SWITCH and Wildcars
$varText = 'youtube'

switch -Wildcard ($varText)
{
    'YOUTUBE'   {'Regular match'}
    'YOU*'      {'Match the first 3 characters'}
    'Y[eOi]UTUB[Eia]'   {'Some specific characters and some withing a range of options'}
    'Y?UT?BE'   {'Similar string match'}
    'spotify*'   {'No match'}
}

#
$varText = 'y'

switch ($varText) {
    {'yes', 'y' -contains $varText} {'affirmative'}
    {'no', 'n' -contains $varText} {'negative'}
}

# SWITCH and regular expressions
$varText = 'n'

switch -Regex ($varText) {
    'yes|y' {'affirmative'}
    'no|n'  {'negative'}
}

#SWITCH and files
# Create a .txt file and put in two lines this:
# I love PowerShell
# All other scripting languages should bow down to PowerShell

$varFile = 'C:\nameOfTheFile.txt'

switch -file ($varFile) {
    'I love PowerShell' {"Yep, the one and only!"}
    'Python'            {"Keep dreaming..."}
}


