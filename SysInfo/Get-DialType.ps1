Function Get-DialType {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Tone'}
        2 {'Pulse'}
        default {'Invalid or No Code'}
    }

    Return
}