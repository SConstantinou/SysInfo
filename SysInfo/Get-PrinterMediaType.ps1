Function Get-PrinterMediaType {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Standard'}
        2 {'Transparency'}
        3 {'Glossy'}
        default {'Invalid or No Code'}
    }

    Return
}