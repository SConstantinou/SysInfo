Function Get-Chemistry {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Lead Acid'}
            4 {'Nickel Cadmium'}
            5 {'Nickel Metal Hydride'}
            6 {'Lithium-ion'}
            7 {'Zinc air'}
            8 {'Lithium Polymer'}
            default {'Invalid Code'}
        }
    }

    Return
}