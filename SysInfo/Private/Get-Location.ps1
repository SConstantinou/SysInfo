Function Get-Location {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Internal'}
        '1' {'External'}
        '2' {'Reserved'}
        '3' {'Unknown'}
        default {'Invalid or No Code'}
    }

    Return
}