Function Get-DaylightDay {

    param ([uint16]$Code,
           [String]$Day,
           [String]$Month)

    if ($Code -ne ''){

        switch ($Code){
            1 {"First $Day of $Month"}
            2 {"Second $Day of $Month"}
            3 {"Third $Day of $Month"}
            4 {"Forth $Day of $Month"}
            5 {"Last $Day of $Month"}
            default {'Invalid Code'}
        }
    }

    Return
}