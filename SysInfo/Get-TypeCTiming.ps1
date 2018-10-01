Function Get-TypeCTiming {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'ISA Compatible'}
        '4' {'Not Supported'}
        '5' {'Supported'}
        default {'Invalid or No Code'}
    }

    Return
}