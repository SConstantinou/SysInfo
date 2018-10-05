Function Get-VoltageCaps {

    param ([uint32]$Code)

    switch ($Code){
        '1' {'5 volts'}
        '2' {'3.3 volts'}
        '4' {'2.9 volts'}
        default {'Invalid or No Code'}
    }

    Return
}