Function Get-VppMixedVoltageSupport {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Unknown'}
            2 {'3.3V'}
            3 {'5V'}
            4 {'12V'}
            default {'Invalid Code'}
        }
    }

    Return
}