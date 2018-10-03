Function Get-ProtectionManagement {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Unprotected'}
        '4' {'Protected'}
        '5' {'Protected through SCC (SCSI-3 Controller Command)'}
        '6' {'Protected through SCC-2 (SCSI-3 Controller Command)'}
        default {'Invalid or No Code'}
    }

    Return
}