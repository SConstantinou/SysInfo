Function Get-SizeKB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1KB,2)}

    Return
}