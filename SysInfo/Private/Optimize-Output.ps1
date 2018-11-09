Function Optimize-Output {

    param (
        [PSObject]$Object,
        [String[]]$Properties,
        [String[]]$DefaultProperties)

    if ($Properties.Count -eq 0) {

        Write-Output $Object | Select-Object -Property $DefaultProperties
    }
    else{

        Write-Output $Object | Select-Object -Property $Properties
    }
}