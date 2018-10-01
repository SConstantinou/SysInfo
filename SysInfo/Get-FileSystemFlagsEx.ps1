Function Get-FileSystemFlagsEx {

    param ([uint32]$Code)

    switch ($Code){
        '1' {'Case Sensitive Search'}
        '2' {'Case Preserved Names'}
        '4' {'Unicode On Disk'}
        '8' {'Persistent ACLs'}
        '16' {'File Compression'}
        '32' {'Volume Quotas'}
        '64' {'Supports Sparse Files'}
        '128' {'Supports Reparse Points'}
        '256' {'Supports Remote Storage'}
        '16384' {'Supports Long Names'}
        '32768' {'Volume Is Compressed'}
        '524289' {'Read Only Volume'}
        '65536' {'Supports Object IDS'}
        '131072' {'Supports Encryption'}
        '262144' {'Supports Named Streams'}
        default {'Invalid or No Code'}
    }

    Return
}