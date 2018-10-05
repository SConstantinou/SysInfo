Function Get-TTOption {

    param ([uint32]$Code)

    switch ($Code){
        1 {'Bitmap - Prints TrueType fonts as graphics'}
        2 {'Download - Downloads TrueType fonts as soft fonts'}
        3 {'Substitute - Substitutes device fonts for TrueType fonts'}
        default {'Invalid or No Code'}
    }

    Return
}