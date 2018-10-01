Function Get-SoftwareElementState {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Deployable'}
        '1' {'Installable'}
        '2' {'Executable'}
        '3' {'Running'}
        default {'Invalid or No Code'}
    }

    Return
}