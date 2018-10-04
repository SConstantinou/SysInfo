Function Get-TcpipNetbiosOptions {

    param ([uint32]$Code)

    switch ($Code){
        0 {'EnableNetbiosViaDhcp'}
        1 {'EnableNetbios'}
        2 {'DisableNetbios'}
        default {'Invalid or No Code'}
    }

    Return
}