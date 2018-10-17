Function Get-Location {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Internal'}
            1 {'External'}
            2 {'Reserved'}
            3 {'Unknown'}
            default {'Invalid Code'}
        }
    }

    Return
}