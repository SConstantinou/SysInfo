Function Get-DriveType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'No Root Directory'}
            2 {'Removable Disk'}
            3 {'Local Disk'}
            4 {'Network Drive'}
            5 {'Compact Disc'}
            6 {'RAM Disk'}
            default {'Invalid Code'}
        }
    }

    Return
}