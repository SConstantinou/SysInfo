Function Get-ECC {

    param ([uint32]$Code)

    switch ($Code){
        '0' {'Does not support hardware error corrention (ECC)'}
        '1' {'Supports hardware error corrention (ECC)'}
        default {'Invalid or No Code'}
    }

    Return
}