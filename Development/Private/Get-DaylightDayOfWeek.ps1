Function Get-DaylightDayOfWeek {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Sunday'}
            1 {'Monday'}
            2 {'Tuesday'}
            3 {'Wednesday'}
            4 {'Thursday'}
            5 {'Friday'}
            6 {'Saturday'}
            default {'Invalid Code'}
        }
    }

    Return
}