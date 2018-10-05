Function Get-ICMIntent {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Saturation'}
        2 {'Contrast'}
        3 {'Exact Color'}
        default {'Invalid or No Code'}
    }

    Return
}