Function Get-TcpipNetbiosOptions {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'EnableNetbiosViaDhcp'}
            1 {'EnableNetbios'}
            2 {'DisableNetbios'}
            default {'Invalid Code'}
        }
    }
    Return
}