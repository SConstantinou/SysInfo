Function Get-IPXMediaType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Ethernet'}
            2 {'Token ring'}
            3 {'FDDI'}
            8 {'ARCNET'}
            default {'Invalid Code'}
        }
    }

    Return
}