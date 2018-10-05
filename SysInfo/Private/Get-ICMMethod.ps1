Function Get-ICMMethod {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Disabled'}
        2 {'Windows'}
        3 {'Device Driver'}
        4 {'Device'}
        default {'Invalid or No Code'}
    }

    Return
}