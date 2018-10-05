Function Get-MemoryErrorCorrection {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Reserved'}
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'None'}
        '4' {'Parity'}
        '5' {'Single-bit ECC'}
        '6' {'Multi-bit ECC'}
        '7' {'CRC'}
        default {'Invalid or No Code'}
    }

    Return
}