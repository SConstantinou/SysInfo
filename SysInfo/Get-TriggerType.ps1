Function Get-TriggerType {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Level'}
        '4' {'Edge'}
        default {'Invalid or No Code'}
    }

    Return
}