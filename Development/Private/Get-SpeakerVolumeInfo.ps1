Function Get-SpeakerVolumeInfo {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Not Supported'}
            3 {'High'}
            4 {'Medium'}
            5 {'Low'}
            6 {'Off'}
            7 {'Auto'}
            default {'Invalid Code'}
        }
    }

    Return
}