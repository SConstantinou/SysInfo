Function Get-ErrorDataOrder {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'Least Significant Byte First'}
        '2' {'Most Significant Byte First'}
        default {'Invalid or No Code'}
    }

    Return
}