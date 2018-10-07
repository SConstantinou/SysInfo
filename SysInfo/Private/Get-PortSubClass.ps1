Function Get-PortSubClass {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Parallel Port'}
            1 {'Serial Port'}
            2 {'Modem'}
            default {'Invalid Code'}
        }
    }

    Return
}