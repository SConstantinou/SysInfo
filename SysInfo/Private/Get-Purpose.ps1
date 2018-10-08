Function Get-Purpose {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Uknown'}
            1 {'Other'}
            2 {'Driver'}
            3 {'Configuration Software'}
            4 {'Application Software'}
            5 {'Instrumentation'}
            6 {'Firmware'}
            default {'Invalid Code'}
        }
    }

    Return
}