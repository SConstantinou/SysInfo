Function Get-DataExecutionPreventionSupportPolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Always Off'}
            1 {'Always On'}
            2 {'Opt In'}
            3 {'Opt Out'}
            default {'Invalid Code'}
        }
    }

    Return
}