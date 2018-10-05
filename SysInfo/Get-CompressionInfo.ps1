Function Get-CompressionInfo {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'No Compression'}
        3 {'MNP 5'}
        4 {'V.42bis'}
        default {'Invalid or No Code'}
    }

    Return
}