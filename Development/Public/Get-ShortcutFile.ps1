function Get-ShortcutFile {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ShortcutFile).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ShortcutFile = Get-CimInstance -ClassName Win32_ShortcutFile -Property $Properties | Select-Object $Properties
    }
    else{

        $ShortcutFile = Get-CimInstance -ClassName Win32_ShortcutFile -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $ShortcutFile){

        $_.AccessMask = Get-AccessMask ($_.AccessMask)
    }
    
    Write-Output $ShortcutFile
}