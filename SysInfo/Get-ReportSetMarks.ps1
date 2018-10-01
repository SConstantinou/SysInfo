Function Get-ReportSetMarks {

    param ([uint32]$Code)

    switch ($Code){
        '0' {'Disabled'}
        '1' {'Enabled'}
        default {'Invalid or No Code'}
    }

    Return
}