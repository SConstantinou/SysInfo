Function Get-ForegroundApplicationBoost {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'None'}
            1 {'Minimum'}
            2 {'Maximum'}
            default {'Invalid Code'}
        }
    }

    Return
}