function Get-BaseBoard {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_BaseBoard).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $BaseBoard = Get-CimInstance -ClassName Win32_BaseBoard -Property $Properties | Select-Object $Properties
    }
    else{

        $BaseBoard = Get-CimInstance -ClassName Win32_BaseBoard -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    if ($null -ne $BaseBoard.Depth){
        $BaseBoard |
            Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "$(Get-LengthCM ($BaseBoard.Depth))" -Force
    }

    if ($null -ne $BaseBoard.Height){
        $BaseBoard |
            Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "$(Get-LengthCM ($BaseBoard.Height))" -Force
    }

    if ($null -ne $BaseBoard.Width){
        $BaseBoard |
            Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "$(Get-LengthCM ($BaseBoard.Width))" -Force
    }

    if ($null -ne $BaseBoard.Weight){
        $BaseBoard |
            Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "$(Get-WeightGram ($BaseBoard.Weight))" -Force
    }

    if (($BaseBoard.PSObject.Properties.Name -match "WeightGr") -and ($BaseBoard.WeightGr -ge 1000)){
        $BaseBoard |
            Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "$(Get-WeightKg ($BaseBoard.Weight))" -Force
    }

    Write-Output $BaseBoard
}