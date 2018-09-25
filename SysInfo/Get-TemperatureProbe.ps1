function Get-TemperatureProbe {
    Get-CimInstance -ClassName Win32_TemperatureProbe -Property *
}