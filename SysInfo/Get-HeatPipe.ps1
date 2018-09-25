function Get-HeatPipe {
    Get-CimInstance -ClassName Win32_HeatPipe -Property *
}