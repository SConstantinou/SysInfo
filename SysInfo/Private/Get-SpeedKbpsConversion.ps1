Function Get-SpeedKbpsConversion {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000,2)}

    Return
}