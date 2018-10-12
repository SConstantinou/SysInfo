Function Get-ProductType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Work Station'}
            2 {'Domain Controller'}
            3 {'Server'}
            default {'Invalid Code'}
        }
    }

    Return
}