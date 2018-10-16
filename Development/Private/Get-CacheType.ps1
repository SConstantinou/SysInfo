Function Get-CacheType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Instruction'}
            4 {'Data'}
            5 {'Unified'}
            default {'Invalid Code'}
        }
    }

    Return
}