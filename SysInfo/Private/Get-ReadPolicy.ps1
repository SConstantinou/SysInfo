Function Get-ReadPolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Read'}
            4 {'Read-Ahead'}
            5 {'Read and Read-Ahead'}
            6 {'Determination Per I/O'}
            default {'Invalid Code'}
        }
    }

    Return
}