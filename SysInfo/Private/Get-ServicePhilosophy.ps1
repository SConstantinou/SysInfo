Function Get-ServicePhilosophy {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Service From Top'}
            3 {'Service From Front'}
            4 {'Service From Back'}
            5 {'Service From Side'}
            6 {'Sliding Trays'}
            7 {'Removable Sides'}
            8 {'Moveable'}
            default {'Invalid Code'}
        }
    }
    Return
}