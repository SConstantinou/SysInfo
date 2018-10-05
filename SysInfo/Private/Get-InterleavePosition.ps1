Function Get-InterleavePosition {

    param ([uint32]$Code)

    switch ($Code){
        '0' {'Noninterleaved'}
        '1' {'First position'}
        '2' {'Second position'}
        default {'Invalid or No Code'}
    }

    Return
}