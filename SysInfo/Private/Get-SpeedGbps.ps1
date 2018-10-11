Function Get-SpeedGbps {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000000000,2)}

    Return
}