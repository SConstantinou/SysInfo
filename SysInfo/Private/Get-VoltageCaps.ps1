Function Get-VoltageCaps {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'5 volts'}
            2 {'3.3 volts'}
            4 {'2.9 volts'}
            default {'Invalid Code'}
        }
    }
    Return
}