function Get-Fan {
    Get-CimInstance -ClassName Win32_Fan -Property *
}