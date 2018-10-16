Function Get-WeightKg {

    param ([float]$Pounds)

    if ($Pounds -ne ''){[math]::round($Pounds / 2.205,2)}

    Return
}