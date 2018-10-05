Function Get-ModulationScheme {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'Not Supported'}
        3 {'Bell 103'}
        4 {'Bell 212A'}
        5 {'V.22bis'}
        6 {'V.32'}
        7 {'V.32bis'}
        8 {'V.turbo'}
        9 {'V.FC'}
        10 {'V.34'}
        11 {'V.34bis'}
        default {'Invalid or No Code'}
    }

    Return
}