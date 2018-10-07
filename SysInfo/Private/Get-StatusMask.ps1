Function Get-StatusMask {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Paused'}
            2 {'Error'}
            4 {'Deleting'}
            8 {'Spooling'}
            16 {'Printing'}
            32 {'Offline'}
            64 {'Paperout'}
            128 {'Printed'}
            256 {'Deleted'}
            512 {'Blocked_DevQ'}
            1024 {'User_Intervention_Req'}
            2048 {'Restart'}
            default {'Invalid Code'}
        }
    }

    Return
}