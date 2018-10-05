Function Get-ErrorGranularity {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Device level'}
        '4' {'Memory partition level'}
        default {'Invalid or No Code'}
    }

    Return
}