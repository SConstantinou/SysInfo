Function Get-State {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Disabled'}
            2 {'Tracked'}
            3 {'Enforced'}
            default {'Invalid Code'}
        }
    }

    Return
}