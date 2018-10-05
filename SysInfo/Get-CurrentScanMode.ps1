Function Get-CurrentScanMode {

    param ([uint16[]]$Code)

    switch ($Code){
        1 {'Other'}
        2 {'Unknown'}
        3 {'Interlaced'}
        4 {'Non Interlaced'}
        default {'Invalid or No Code'}
    }

    Return
}