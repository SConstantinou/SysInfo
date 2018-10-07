Function Get-ErrorAccess {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Read'}
            4 {'Write'}
            5 {'Partial Write'}
            default {'Invalid Code'}
        }
    }

    Return
}