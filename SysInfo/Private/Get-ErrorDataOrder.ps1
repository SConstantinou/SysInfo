Function Get-ErrorDataOrder {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Least Significant Byte First'}
            2 {'Most Significant Byte First'}
            default {'Invalid Code'}
        }
    }

    Return
}