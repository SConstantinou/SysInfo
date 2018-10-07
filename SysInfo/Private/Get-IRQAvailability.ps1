function Get-IRQAvailability {

    param ([uint16] $Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Other'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'Available'}
            4 {'In Use/Not Available'}
            5 {'In Use and Available/Shareable'}
            default {'Invalid Code'}
        }
    }

    Return
}