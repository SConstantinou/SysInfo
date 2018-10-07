Function Get-PrinterMediaType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Standard'}
            2 {'Transparency'}
            3 {'Glossy'}
            default {'Invalid Code'}
        }
    }

    Return
}