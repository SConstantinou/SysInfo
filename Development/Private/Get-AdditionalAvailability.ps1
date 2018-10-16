function Get-AdditionalAvailability {

    param ([uint16] $Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Running or Full Power'}
            4 {'Warning'}
            5 {'In Test'}
            6 {'Not Applicable'}
            7 {'Power Off'}
            8 {'Off Line'}
            9 {'Off Duty'}
            10 {'Degraded'}
            11 {'Not Installed'}
            12 {'Install Error'}
            13 {'Power Save - Unknown'}
            14 {'Power Save - Low Power Mode'}
            15 {'Power Save - Standby'}
            16 {'Power Cycle'}
            17 {'Power Save - Warning'}
            18 {'Pause'}
            19 {'Not Ready'}
            20 {'Not Configured'}
            21 {'Quiesced - Device is Quiet'}
            default {'Invalid or No Code'}
        }
    }
    Return
}