Function Get-PowerManagementCapabilities {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'Not Supported'}
        '2' {'Disabled'}
        '3' {'Enabled'}
        '4' {'Power Saving Modes Entered Automatically'}
        '5' {'Power State Settable'}
        '6' {'Power Cycling Supported'}
        '7' {'Timed Power On Supported'}
        default {'Invalid or No Code'}
    }

    Return
}