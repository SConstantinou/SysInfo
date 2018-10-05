Function Get-AnswerMode {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'Disabled'}
        3 {'Manual Answer'}
        4 {'Auto Answer'}
        5 {'Auto Answer with Call-Back'}
        default {'Invalid or No Code'}
    }

    Return
}