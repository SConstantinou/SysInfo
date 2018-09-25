function Get-Fan {
    
    $Properties = 'Name','Description','Caption','PowerManagementSupported','PowerManagementCapabilities','ActiveCooling','DesiredSpeed','VariableSpeed','Status'

    $Fan = Get-CimInstance -ClassName Win32_Fan -Property $Properties | Select-Object -Property $Properties

    Write-Output $Fan
}