Function Get-NetConnectionStatus {

    param ([uint16]$Code)

    switch ($Code){
        0 {'Disconnected'}
        1 {'Connecting'}
        2 {'Connected'}
        3 {'Disconnecting'}
        4 {'Hardware Not Present'}
        5 {'Hardware Disabled'}
        6 {'Hardware Malfunction'}
        7 {'Media Disconnected'}
        8 {'Authenticating'}
        9 {'Authentication Succeeded'}
        10 {'Authentication Failed'}
        11 {'Invalid Address'}
        12 {'Credentials Required'}
        {13..65535 -contains $_} {'Other'}
        default {'Invalid or No Code'}
    }

    Return
}