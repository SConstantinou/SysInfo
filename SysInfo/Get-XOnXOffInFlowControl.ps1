Function Get-XOnXOffInFlowControl {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'False'}
        '1' {'True'}
        default {'Invalid or No Code'}
    }

    Return
}