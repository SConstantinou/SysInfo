function Get-TemperatureProbe {
    
    $Properties = 'Name','Description','Caption','PowerManagementSupported',
                  'PowerManagementCapabilities','Accuracy','IsLinear','LowerThresholdCritical',
                  'LowerThresholdFatal','LowerThresholdNonCritical','MaxReadable','MinReadable',
                  'NominalReading','NormalMax','NormalMin','Resolution','Tolerance',
                  'UpperThresholdCritical','UpperThresholdFatal','UpperThresholdNonCritical','Status'
    
    $TemperatureProbe = Get-CimInstance -ClassName Win32_TemperatureProbe -Property $Properties | Select-Object $Properties

    Write-Output $TemperatureProbe
}