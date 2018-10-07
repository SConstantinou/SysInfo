Function Get-AccessState {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Active'}
            2 {'Inactive'}
            default {'Invalid or No Code'}
        }
    }

    Return
}