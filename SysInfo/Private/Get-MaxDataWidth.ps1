Function Get-MaxDataWidth {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'8'}
            1 {'16'}
            2 {'32'}
            3 {'64'}
            4 {'128'}
            default {'Invalid Code'}
        }
    }

    Return
}