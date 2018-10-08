Function Get-AuthenticationLevel {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'None'}
            2 {'Connect'}
            3 {'Call'}
            4 {'Packet'}
            5 {'PacketIntegrity'}
            6 {'PacketPrivacy'}
            default {'Invalid Code'}
        }
    }

    Return
}