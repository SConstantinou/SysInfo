Function Get-SecurityStatus {

    param ([uint16]$Code)

    switch ($Code){
        1 {'Other'}
        2 {'Unknown'}
        3 {'None'}
        4 {'External interface locked out'}
        5 {'External interface enabled'}
        default {'Invalid or No Code'}
    }

    Return
}