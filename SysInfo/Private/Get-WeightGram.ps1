Function Get-WeightGram {

    param ([float]$Pounds)

    if ($Pounds -ne ''){[math]::round($Pounds * 453.592,2)}

    Return
}