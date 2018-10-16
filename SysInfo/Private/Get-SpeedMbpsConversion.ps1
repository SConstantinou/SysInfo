Function Get-SpeedMbpsConversion {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000000,2)}

    Return
}