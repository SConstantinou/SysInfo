Function Get-WritePolicy {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Write Back'}
        '4' {'Write Through'}
        '5' {'Varies with Address'}
        '6' {'Determination Per I/O'}
        default {'Invalid or No Code'}
    }

    Return
}