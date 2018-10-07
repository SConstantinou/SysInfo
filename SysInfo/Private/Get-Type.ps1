Function Get-Type {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Write'}
            2 {'Read'}
            4 {'Redirected'}
            8 {'Net Attached'}
            16 {'Unknown'}
            default {'Invalid Code'}
        }
    }

    Return
}