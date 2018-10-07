Function Get-WritePolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Write Back'}
            4 {'Write Through'}
            5 {'Varies with Address'}
            6 {'Determination Per I/O'}
            default {'Invalid Code'}
        }
    }
    Return
}