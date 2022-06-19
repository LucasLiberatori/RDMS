<###################################################
# FOR, FOREACH and WHILE
###################################################>

# -----------------------------------------------------------------
# FOR
# -----------------------------------------------------------------

# Simple FOR
for ($i = 1; $i -le 5; $i++) {
    Write-Host  "Iteration $i"
}

for ($i = 1; $i -le 5; $i++) {Write-Host  "Iteration $i"}

# FOR with multiples vars
for (($i = 1), ($j = 10); $i -lt $j; $i++, $j--){
    Write-Host "Iteration $i $j"
}


for (($i = 1), ($j = 10), ($k = 1); $i -lt $j; $i++, $j--, ($k+=2)){
    Write-Host "Iteration $i $j $k"
}

# For ghost
$i = 0

for (;;){
    Write-Host "Iteration $i"
    if ($i -lt 10){
        $i++
    }
    else {
        break
    }
}

#FOR another syntax
for(
    $i = 0
    $i -le 10
    $i ++
){
    Write-Host "Iteration $i"
}

# -----------------------------------------------------------------
# FOREACH LOOP
# -----------------------------------------------------------------

# foreach(*item* in *Item Collection*){*Code to be executed*} 
$myArray = 0, 1, 2, 3, 4, 5

foreach ($Item in $myArray) {
    Write-Host "Item: $Item"
}
    #Same but with FOR
    for ($i = 0; $i -lt $myArray.Length; $i++) {
        Write-Host "Item: $i"
    }

# -----------------------------------------------------------------
# WHILE LOOP
# -----------------------------------------------------------------

# Syntax
while(*condition*){*Code to be executed*}


