Function Get-DirectoryType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Product log directory'}
            2 {'Shared base directory'}
            3 {'Shared executable directory'}
            4 {'Shared library directory'}
            5 {'Shared include directory'}
            6 {'System base directory'}
            7 {'System executable directory'}
            8 {'System library directory'}
            9 {'System configuration directory'}
            10 {'System include directory'}
            11 {'System log directory'}
            12 {'Other'}
            default {'Invalid Code'}
        }
    }

    Return
}