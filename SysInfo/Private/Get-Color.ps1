Function Get-Color {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Monochrome (true black)'}
            2 {'Color'}
            default {'Invalid Code'}
        }
    }

    Return
}