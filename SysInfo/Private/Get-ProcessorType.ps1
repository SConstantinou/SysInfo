Function Get-ProcessorType {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Central Processor'}
        '4' {'Math Processor'}
        '5' {'DSP Processor'}
        '6' {'Video Processor'}
        default {'Invalid or No Code'}
    }

    Return
}