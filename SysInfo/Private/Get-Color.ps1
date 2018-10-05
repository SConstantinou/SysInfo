Function Get-Color {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Monochrome (true black)'}
        2 {'Color'}
        default {'Invalid or No Code'}
    }

    Return
}