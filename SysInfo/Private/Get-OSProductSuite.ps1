Function Get-OSProductSuite {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Microsoft Small Business Server was once installed, but may have been upgraded to another version of Windows.'}
            2 {'Windows Server 2008 Enterprise is installed.'}
            4 {'Windows BackOffice components are installed.'}
            8 {'Communication Server is installed.'}
            16 {'Terminal Services is installed.'}
            32 {'Microsoft Small Business Server is installed with the restrictive client license.'}
            64 {'Windows Embedded is installed.'}
            128 {'A Datacenter edition is installed.'}
            256 {'Terminal Services is installed, but only one interactive session is supported.'}
            512 {'Windows Home Edition is installed.'}
            1024 {'Web Server Edition is installed.'}
            8192 {'Storage Server Edition is installed.'}
            16384 {'Compute Cluster Edition is installed.'}
            default {'Invalid Code'}
        }
    }

    Return
}