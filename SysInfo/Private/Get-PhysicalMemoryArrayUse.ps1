Function Get-PhysicalMemoryArrayUse {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'System memory'}
            4 {'Video memory'}
            5 {'Flash memory'}
            6 {'Non-volatile RAM'}
            7 {'Cache memory'}
            default {'Invalid Code'}
        }
    }

    Return
}