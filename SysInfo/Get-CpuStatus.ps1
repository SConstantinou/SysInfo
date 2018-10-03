Function Get-CpuStatus {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'CPU Enabled'}
        '2' {'CPU Disabled by User via BIOS Setup'}
        '3' {'CPU Disabled By BIOS (POST Error)'}
        '4' {'CPU is Idle'}
        '5' {'Reserved'}
        '6' {'Reserved'}
        '7' {'Other'}
        default {'Invalid or No Code'}
    }

    Return
}