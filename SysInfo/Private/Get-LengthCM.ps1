Function Get-LengthCM {

    param ([float]$Inches)

    if ($Inches -ne ''){[math]::round($Inches * 2.54,2)}

    Return
}