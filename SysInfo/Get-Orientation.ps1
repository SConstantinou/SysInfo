Function Get-Orientation {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Portrait'}
        2 {'Landscape'}
        default {'Invalid or No Code'}
    }

    Return
}