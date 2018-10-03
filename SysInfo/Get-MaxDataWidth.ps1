Function Get-MaxDataWidth {

    param ([uint16]$Code)

    switch ($Code){
        0 {'8'}
        1 {'16'}
        2 {'32'}
        3 {'64'}
        4 {'128'}
        default {'Invalid or No Code'}
    }

    Return
}