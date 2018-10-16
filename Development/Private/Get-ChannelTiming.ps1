Function Get-ChannelTiming {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'ISA Compatible'}
            4 {'Type A'}
            5 {'Type B'}
            6 {'Type F'}
            default {'Invalid Code'}
        }
    }

    Return
}