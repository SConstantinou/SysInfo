Function Get-AccessState {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'Active'}
        '2' {'Inactive'}
        default {'Invalid or No Code'}
    }

    Return
}