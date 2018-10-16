﻿Function Get-Attributes {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Queued'}
            2 {'Direct'}
            4 {'Default'}
            8 {'Shared'}
            16 {'Network'}
            32 {'Hidden'}
            64 {'Local'}
            128 {'EnableDevQ'}
            256 {'KeepPrintedJobs'}
            512 {'DoCompleteFirst'}
            1024 {'WorkOffline'}
            2048 {'EnableBIDI'}
            4096 {'RAW Only'}
            8192 {'Published'}
            default {'Invalid Code'}
        }
    }

    Return
}