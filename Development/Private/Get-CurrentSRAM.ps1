Function Get-CurrentSRAM {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Other'}
            1 {'Unknown'}
            2 {'Non-Burst'}
            3 {'Burst'}
            4 {'Pipeline Burst'}
            5 {'Synchronous'}
            6 {'Asynchronous'}
            default {'Invalid Code'}
        }
    }

    Return
}