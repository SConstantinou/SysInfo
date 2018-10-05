Function Get-ErrorAccess {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Read'}
        '4' {'Write'}
        '5' {'Partial Write'}
        default {'Invalid or No Code'}
    }

    Return
}