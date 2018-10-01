Function Get-Access {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'Readable'}
        '2' {'Writeable'}
        '3' {'Read/Write Supported'}
        '4' {'Write Once'}
        '5' {'Not Applicable'}
        default {'Invalid or No Code'}
    }

    Return
}