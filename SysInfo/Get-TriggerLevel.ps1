Function Get-TriggerLevel {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Active Low'}
        '4' {'Active High'}
        '5' {'Not Applicable'}
        default {'Invalid or No Code'}
    }

    Return
}