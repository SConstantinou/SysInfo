Function Get-TypeDetail {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Reserved'}
        '2' {'Other'}
        '4' {'Unknown'}
        '8' {'Fast-paged'}
        '16' {'Static column'}
        '32' {'Pseudo-static'}
        '64' {'RAMBUS'}
        '128' {'Synchronous'}
        '256' {'CMOS'}
        '512' {'EDO'}
        '1024' {'Window DRAM'}
        '2048' {'Cache DRAM'}
        '4096' {'Non-volatile'}
        default {'Invalid or No Code'}
    }

    Return
}