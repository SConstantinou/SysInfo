Function Get-DetectedErrorState {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'No Error'}
            3 {'Low Paper'}
            4 {'No Paper'}
            5 {'Low Toner'}
            6 {'No Toner'}
            7 {'Door Open'}
            8 {'Jammed'}
            9 {'Offline'}
            10 {'Service Requested'}
            11 {'Output Bin Full'}
            default {'Invalid Code'}
        }
    }

    Return
}