Function Get-SupportedSRAM {

    param ([uint16[]]$Code)

    switch ($Code){
        '0' {'Other'}
        '1' {'Unknown'}
        '2' {'Non-Burst'}
        '3' {'Burst'}
        '4' {'Pipeline Burst'}
        '5' {'Synchronous'}
        '6' {'Asynchronous'}
        default {'Invalid or No Code'}
    }

    Return
}