Function Get-VoltageCaps {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'5'}
            2 {'3.3'}
            4 {'2.9'}
            default {'Invalid Code'}
        }
    }
    Return
}