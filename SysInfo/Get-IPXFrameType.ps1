Function Get-IPXFrameType {

    param ([uint32[]]$Code)

    switch ($Code){
        0 {'Ethernet II'}
        1 {'Ethernet 802.3'}
        2 {'Ethernet 802.2'}
        3 {'Ethernet SNAP'}
        255 {'Auto'}
        default {'Invalid or No Code'}
    }

    Return
}