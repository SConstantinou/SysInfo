function Get-Info {

    param (
        [String]$ClassName,
        [String[]]$ComputerName,
        [String]$Protocol,
        [String[]]$Properties)

    if (($ComputerName.Count -eq 0) -and ($Protocol -eq '')){

        $Info = Get-CimInstance -ClassName $ClassName -Property $Properties | Select-Object $Properties
    }
    elseif (($ComputerName.Count -eq 0) -and ($Protocol -ieq 'WinRM')){

        throw "You have not specified any 'ComputerName'."
    }
    elseif (($ComputerName.Count -eq 0) -and ($Protocol -ieq 'DCOM')){

        throw "You have not specified any 'ComputerName'."
    }
    elseif (($ComputerName -ne '') -and ($Protocol -eq '')) {

        $Info = Get-CimInstance -ClassName $ClassName -ComputerName $ComputerName -Property $Properties | Select-Object $Properties
    }
    elseif (($ComputerName -ne '') -and ($Protocol -ieq "WinRM")) {

        $SessionProtocolOption = New-CimSessionOption -Protocol Wsman 
        $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption
        $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object $Properties
        Remove-CimSession -CimSession $Session | Out-Null
    }
    elseif (($ComputerName -ne '') -and ($Protocol -ieq "DCOM")) {

        $SessionProtocolOption = New-CimSessionOption -Protocol DCOM 
        $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption
        $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object $Properties
        Remove-CimSession -CimSession $Session | Out-Null
    }

    Write-Output $Info
}