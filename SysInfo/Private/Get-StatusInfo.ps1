Function Get-StatusInfo {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Enabled'}
            4 {'Disabled'}
            5 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}