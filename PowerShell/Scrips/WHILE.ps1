
#############################################################################################################
https://www.mssqltips.com/sqlservertip/7223/powershell-for-loop-powershell-while-loop-powershell-foreach/
#############################################################################################################

# WHILE loop

# Syntax
# while(*condition*){*Code to be executed*}

$i = 1

while ($i -le 10) {
    Write-Host "Iteration $i"
    $i++
}

# Same code but in a single line
# while ($i -le 10) {Write-Host "Iteration $i" $i++}


# WHILE with BREAK
$i = 1

WHILE (1){
    if($i -le 10){
        Write-Host "Iteration $i"
        $i++
    }
    else {
        break
    }
}

# Do-While Loop and Do-Until Loop
# Do-While Loop
# Purpose: Guarantees that the code is going to be run at least once.

# Syntax
# do{*code to be executed*} while(*condition*)

$i = 1

do {
    Write-Host "Iteration: $i"
    $i ++
} while (
    $i -lt 1   
)

# Do-Until
# Purpose: it is the "negation" of the Do-While
# Syntax
# do{*code to be executed*} until(*condition*)
$i = 1

do {
    Write-Host "Iteration: $i"
    $i ++
} until (
    $i -lt 1   
)

