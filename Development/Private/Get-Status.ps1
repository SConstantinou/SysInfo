Function Get-Status {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'OK'}
            2 {'Warning'}
            3 {'Exceeded'}
            default {'Invalid Code'}
        }
    }

    Return
}