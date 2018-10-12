Function Get-LargeSystemCache {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Optimize for Applications'}
            1 {'Optimize for System Performance'}
            default {'Invalid Code'}
        }
    }

    Return
}