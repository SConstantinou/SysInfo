Function Get-ReportSetMarksStatus {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Disabled'}
            1 {'Enabled'}
            default {'Invalid Code'}
        }
    }

    Return
}