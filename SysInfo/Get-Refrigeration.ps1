function Get-Refrigeration {
    Get-CimInstance -ClassName Win32_Refrigeration -Property *
}