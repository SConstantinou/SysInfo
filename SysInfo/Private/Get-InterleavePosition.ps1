Function Get-InterleavePosition {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Noninterleaved'}
            1 {'First position'}
            2 {'Second position'}
            default {'Invalid Code'}
        }
    }

    Return
}