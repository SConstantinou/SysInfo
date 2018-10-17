Function Get-DitherType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'No Dithering'}
            2 {'Coarse Brush'}
            3 {'Fine Brush'}
            4 {'Line Art'}
            5 {'Grayscale'}
            default {'Invalid Code'}
        }
    }

    Return
}