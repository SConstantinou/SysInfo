Function Get-AcceleratorCapabilities {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

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