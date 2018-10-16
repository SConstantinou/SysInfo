Function Get-ByteMode {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {"Not execute in 'count by byte' mode"}
            4 {"Execute in 'count by byte' mode"}
            default {'Invalid Code'}
        }
    }

    Return
}