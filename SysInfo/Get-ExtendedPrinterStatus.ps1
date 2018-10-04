Function Get-ExtendedPrinterStatus {

    param ([uint16]$Code)

    switch ($Code){
        1 {'Other'}
        2 {'Unknown'}
        3 {'Idle'}
        4 {'Printing'}
        5 {'Warming Up'}
        6 {'Stopped Printing'}
        7 {'Offline'}
        8 {'Paused'}
        9 {'Error'}
        10 {'Busy'}
        11 {'Not Available'}
        12 {'Waiting'}
        13 {'Processing'}
        14 {'Initialization'}
        15 {'Power Save'}
        16 {'Pending Deletion'}
        17 {'I/O Active'}
        18 {'Manual Feed'}
        default {'Invalid or No Code'}
    }

    Return
}