Function Get-CurrentScanMode {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Interlaced'}
            4 {'Non Interlaced'}
            default {'Invalid Code'}
        }
    }

    Return
}