Function Get-DisplayType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Multiscan Color'}
            3 {'Multiscan Monochrome'}
            4 {'Fixed Frequency Color'}
            5 {'Fixed Frequency Monochrome'}
            default {'Invalid Code'}
        }
    }

    Return
}