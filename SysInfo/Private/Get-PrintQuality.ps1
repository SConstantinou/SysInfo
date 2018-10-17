Function Get-PrintQuality {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            -1 {'Draft'}
            -2 {'Low'}
            -3 {'Medium'}
            -4 {'High'}
            default {"$Code"}
        }
    }

    Return
}