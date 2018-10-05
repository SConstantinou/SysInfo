Function Get-Associativity {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Direct Mapped'}
        '4' {'2-way Set-Associative'}
        '5' {'4-way Set-Associative'}
        '6' {'Fully Associative'}
        '7' {'8-way Set-Associative'}
        '8' {'16-way Set-Associative'}
        default {'Invalid or No Code'}
    }

    Return
}