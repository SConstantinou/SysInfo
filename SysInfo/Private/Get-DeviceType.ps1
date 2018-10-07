Function Get-DeviceType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Video'}
            4 {'SCSI Controller'}
            5 {'Ethernet'}
            6 {'Token Ring'}
            7 {'Sound'}
            default {'Invalid Code'}
        }
    }

    Return
}