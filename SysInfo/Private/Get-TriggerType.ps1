Function Get-TriggerType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Level'}
            4 {'Edge'}
            default {'Invalid Code'}
        }
    }
    Return
}