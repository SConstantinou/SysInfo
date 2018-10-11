function Get-CompactDisc {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $CompactDisc = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'Compact Disc'}
    }
    else{

        $CompactDisc = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Compact Disc'}
    }

    Write-Output $CompactDisc
}