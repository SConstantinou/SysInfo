Function Get-Attributes {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Queued - Print jobs are buffered and queued'}
            2 {'Direct - Document to be sent directly to the printer'}
            4 {'Default - Default printer on a computer'}
            8 {'Shared - Available as a shared network resource'}
            16 {'Network - Attached to a network'}
            32 {'Hidden - Hidden from some users on the network'}
            64 {'Local - Directly connected to a computer'}
            128 {'EnableDevQ - Enable the queue on the printer if available'}
            256 {'KeepPrintedJobs - Spooler should not delete documents after they are printed'}
            512 {'DoCompleteFirst - Start jobs that are finished spooling first'}
            1024 {'WorkOffline - Queue print jobs when a printer is not available'}
            2048 {'EnableBIDI - Enable bidirectional printing'}
            4096 {'RAW Only - Allow only raw data type jobs to be spooled'}
            8192 {'Published - Published in the network directory service'}
            default {'Invalid Code'}
        }
    }

    Return
}