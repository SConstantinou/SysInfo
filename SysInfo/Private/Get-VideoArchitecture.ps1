Function Get-VideoArchitecture {

    param ([uint16]$Code)

    switch ($Code){
        1 {'Other'}
        2 {'Unknown'}
        3 {'CGA'}
        4 {'EGA'}
        5 {'VGA'}
        6 {'SVGA'}
        7 {'MDA'}
        8 {'HGC'}
        9 {'MCGA'}
        10 {'8514A'}
        11 {'XGA'}
        12 {'Linear Frame Buffer'}
        160 {'PC-98'}
        default {'Invalid or No Code'}
    }

    Return
}