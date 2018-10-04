Function Get-BatteryStatus {

    param ([uint16]$Code)

    switch ($Code){
        1 {'Other - The battery is discharging'}
        2 {'Unknown - The system has access to AC so no battery is being discharged. However, the battery is not necessarily charging.'}
        3 {'Fully Charged'}
        4 {'Low'}
        5 {'Critical'}
        6 {'Charging'}
        7 {'Charging and High'}
        8 {'Charging and Low'}
        9 {'Charging and Critical'}
        10 {'Undefined'}
        11 {'Partially Charged'}
        default {'Invalid or No Code'}
    }

    Return
}