Function Get-AcceleratorCapabilities {

    param ([uint16[]]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'Graphics Accelerator'}
        3 {'3D Accelerator'}
        default {'Invalid or No Code'}
    }

    Return
}