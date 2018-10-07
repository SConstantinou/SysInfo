Function Get-Access {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Readable'}
            2 {'Writeable'}
            3 {'Read/Write Supported'}
            4 {'Write Once'}
            5 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}