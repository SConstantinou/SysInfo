Function Get-WordMode {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {"Not execute in 'count by word' mode"}
            4 {"Execute in 'count by word' mode"}
            default {'Invalid Code'}
        }
    }
    Return
}