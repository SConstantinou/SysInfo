Function Get-TypeCTiming {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            '1' {'Other'}
            '2' {'Unknown'}
            '3' {'ISA Compatible'}
            '4' {'Not Supported'}
            '5' {'Supported'}
            default {'Invalid Code'}
        }
    }

    Return
}