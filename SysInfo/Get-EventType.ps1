Function Get-EventType {

    param ([uint16]$Code)

    switch ($Code){
        4 {'Entering Suspend'}
        7 {'Resume from Suspend'}
        10 {'Power Status Change'}
        11 {'OEM Event'}
        18 {'Resume Automatic'}
        default {'Invalid or No Code'}
    }

    Return
}