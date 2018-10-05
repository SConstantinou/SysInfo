function Get-Printer {

    $Properties = ((Get-CimClass -ClassName Win32_Printer).CimClassProperties).Name

    $Printer = Get-CimInstance -ClassName Win32_Printer -Property $Properties | Select-Object $Properties

    foreach ($_ in $Printer){

        $_.Attributes = Get-Attributes ($_.Attributes)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentCapabilities = Get-CurrentCapabilities ($_.CurrentCapabilities)
        $_.CurrentLanguage = Get-CurrentLanguage ($_.CurrentLanguage)
        $_.DefaultCapabilities = Get-DefaultCapabilities ($_.DefaultCapabilities)
        $_.DefaultLanguage = Get-DefaultLanguage ($_.DefaultLanguage)
        $_.DetectedErrorState = Get-DetectedErrorState ($_.DetectedErrorState)
        $_.ExtendedDetectedErrorState = Get-ExtendedDetectedErrorState ($_.ExtendedDetectedErrorState)
        $_.ExtendedPrinterStatus = Get-ExtendedPrinterStatus ($_.ExtendedPrinterStatus)
        $_.LanguagesSupported = Get-LanguagesSupported ($_.LanguagesSupported)
        $_.MarkingTechnology = Get-MarkingTechnology ($_.MarkingTechnology)
        $_.PaperSizesSupported = Get-PaperSizesSupported ($_.PaperSizesSupported)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.PrinterState = Get-PrinterState ($_.PrinterState)
        $_.PrinterStatus = Get-PrinterStatus ($_.PrinterStatus)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $Printer
}