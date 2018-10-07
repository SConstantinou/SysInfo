Function Get-MemoryErrorCorrection {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'None'}
            4 {'Parity'}
            5 {'Single-bit ECC'}
            6 {'Multi-bit ECC'}
            7 {'CRC'}
            default {'Invalid Code'}
        }
    }

    Return
}