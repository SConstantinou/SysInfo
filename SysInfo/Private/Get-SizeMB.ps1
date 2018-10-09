Function Get-SizeMB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1MB,2)}

    Return
}