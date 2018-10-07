Function Get-Orientation {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Portrait'}
            2 {'Landscape'}
            default {'Invalid Code'}
        }
    }

    Return
}