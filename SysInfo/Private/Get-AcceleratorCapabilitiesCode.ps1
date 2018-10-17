Function Get-AcceleratorCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Graphics Accelerator'}
            3 {'3D Accelerator'}
            default {'Invalid Code'}
        }
    }

    Return
}