Function Get-CurrentUsage {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'Available'}
            4 {'In use'}
            default {'Invalid Code'}
        }
    }

    Return
}