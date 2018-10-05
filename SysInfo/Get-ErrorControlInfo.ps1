Function Get-ErrorControlInfo {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'No Error Correction'}
        3 {'MNP 4'}
        4 {'LAPM'}
        default {'Invalid or No Code'}
    }

    Return
}