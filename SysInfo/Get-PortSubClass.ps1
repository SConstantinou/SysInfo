Function Get-PortSubClass {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Parallel Port'}
        1 {'Serial Port'}
        2 {'Modem'}
        default {'Invalid or No Code'}
    }

    Return
}