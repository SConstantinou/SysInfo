Function Get-SecurityBreach {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'No Breach'}
        '4' {'Breach Attempted'}
        '5' {'Breach Successful'}
        default {'Invalid or No Code'}
    }

    Return
}