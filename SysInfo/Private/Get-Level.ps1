Function Get-Level {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Primary'}
            4 {'Secondary'}
            5 {'Tertiary'}
            6 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}