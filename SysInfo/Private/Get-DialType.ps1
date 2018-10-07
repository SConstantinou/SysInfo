Function Get-DialType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Tone'}
            2 {'Pulse'}
            default {'Invalid Code'}
        }
    }

    Return
}