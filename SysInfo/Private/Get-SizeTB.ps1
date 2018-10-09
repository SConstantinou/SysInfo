Function Get-SizeTB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1TB,2)}

    Return
}