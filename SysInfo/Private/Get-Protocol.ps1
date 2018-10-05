Function Get-Protocol {

    param ([uint32]$Code)

    switch ($Code){
        1 {'RAW - Printing directly to a device or print server'}
        2 {'LPR - Legacy protocol, which is eventually replaced by RAW'}
        default {'Invalid or No Code'}
    }

    Return
}