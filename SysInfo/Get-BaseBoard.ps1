function Get-BaseBoard {

    $Properties = ((Get-CimClass -ClassName Win32_BaseBoard).CimClassProperties).Name

    $BaseBoard = Get-CimInstance -ClassName Win32_BaseBoard -Property $Properties | Select-Object $Properties
    
    Write-Output $BaseBoard
}