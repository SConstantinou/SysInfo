Function Get-EventType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            4 {'Entering Suspend'}
            7 {'Resume from Suspend'}
            10 {'Power Status Change'}
            11 {'OEM Event'}
            18 {'Resume Automatic'}
            default {'Invalid Code'}
        }
    }

    Return
}