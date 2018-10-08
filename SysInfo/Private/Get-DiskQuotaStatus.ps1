Function Get-DiskQuotaStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'OK'}
            1 {'Warning'}
            2 {'Exceeded'}
            default {'Invalid Code'}
        }
    }

    Return
}