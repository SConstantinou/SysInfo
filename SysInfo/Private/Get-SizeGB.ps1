Function Get-SizeGB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1GB,2)}

    Return
}