Function Get-XOnXOffInFlowControl {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'False'}
            1 {'True'}
            default {'Invalid Code'}
        }
    }
    Return
}