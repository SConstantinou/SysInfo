Function Get-Handedness {

    param ([uint16]$Code)

    if ($Code -ne ''){

    switch ($Code){
        0 {'Unknown'}
        1 {'Not Applicable'}
        2 {'Right Handed Operation'}
        3 {'Left Handed Operation'}
        default {'Invalid Code'}
    }
    }

    Return
}