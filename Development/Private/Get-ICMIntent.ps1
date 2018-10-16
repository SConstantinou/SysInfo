Function Get-ICMIntent {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Saturation'}
            2 {'Contrast'}
            3 {'Exact Color'}
            default {'Invalid Code'}
        }
    }

    Return
}