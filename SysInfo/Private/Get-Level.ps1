Function Get-Level {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Primary'}
        '4' {'Secondary'}
        '5' {'Tertiary'}
        '6' {'Not Applicable'}
        default {'Invalid or No Code'}
    }

    Return
}