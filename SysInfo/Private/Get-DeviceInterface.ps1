Function Get-DeviceInterface {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Serial'}
            4 {'PS/2'}
            5 {'Infrared'}
            6 {'HP-HIL'}
            7 {'Bus Mouse'}
            8 {'ADB (Apple Desktop Bus)'}
            160 {'Bus mouse DB-9'}
            161 {'Bus mouse micro-DIN'}
            162 {'USB'}
            default {'Invalid Code'}
        }
    }

    Return
}