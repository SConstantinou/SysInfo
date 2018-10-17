function Get-Printer {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_Printer).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $Printer = Get-CimInstance -ClassName Win32_Printer -Property $Properties | Select-Object $Properties
    }
    else{

        $Printer = Get-CimInstance -ClassName Win32_Printer -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Printer){

        $MaxSizeSupported = $_.MaxSizeSupported * 1KB

        switch ($MaxSizeSupported){
            {$MaxSizeSupported -ge 1MB}
                {
                    $Printer | Add-Member -MemberType NoteProperty -Name "MaxSizeSupportedMB" -Value "" -Force
                }
            {$MaxSizeSupported -ge 1GB}
                {
                    $Printer | Add-Member -MemberType NoteProperty -Name "MaxSizeSupportedGB" -Value "" -Force
                }
        }
    }

    foreach ($_ in $Printer){

        $_.Attributes = Get-AttributesCode ($_.Attributes)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentCapabilities = Get-CurrentCapabilitiesCode ($_.CurrentCapabilities)
        $_.CurrentLanguage = Get-CurrentLanguage ($_.CurrentLanguage)
        $_.DefaultCapabilities = Get-DefaultCapabilitiesCode ($_.DefaultCapabilities)
        $_.DefaultLanguage = Get-DefaultLanguage ($_.DefaultLanguage)
        $_.DetectedErrorState = Get-DetectedErrorState ($_.DetectedErrorState)
        $_.ExtendedDetectedErrorState = Get-ExtendedDetectedErrorState ($_.ExtendedDetectedErrorState)
        $_.ExtendedPrinterStatus = Get-ExtendedPrinterStatus ($_.ExtendedPrinterStatus)
        $_.LanguagesSupported = Get-LanguagesSupported ($_.LanguagesSupported)
        $_.MarkingTechnology = Get-MarkingTechnology ($_.MarkingTechnology)
        $_.PaperSizesSupported = Get-PaperSizesSupported ($_.PaperSizesSupported)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.PrinterState = Get-PrinterState ($_.PrinterState)
        $_.PrinterStatus = Get-PrinterStatus ($_.PrinterStatus)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "MaxSizeSupportedMB"){$_.MaxSizeSupportedMB = Get-SizeMB ($_.MaxSizeSupported)}
        if ($_.PSObject.Properties.Name -match "MaxSizeSupportedGB"){$_.MaxSizeSupportedGB = Get-SizeGB ($_.MaxSizeSupported)}
    }

    Write-Output $Printer
}