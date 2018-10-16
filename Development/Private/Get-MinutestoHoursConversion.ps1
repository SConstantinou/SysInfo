Function Get-MinutestoHoursConversion {

    param ([uint32]$Minutes)

    if ($Minutes -ne ''){
    
        $Timespan = New-TimeSpan -Minutes $Minutes
    }

    Write-Output "$($Timespan.Hours):$($Timespan.Minutes)"

    Return
}