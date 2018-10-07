Function Get-VideoMemoryType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'VRAM'}
            4 {'DRAM'}
            5 {'SRAM'}
            6 {'WRAM'}
            7 {'EDO RAM'}
            8 {'Burst Synchronous DRAM'}
            9 {'Pipelined Burst SRAM'}
            10 {'CDRAM'}
            11 {'3DRAM'}
            12 {'SDRAM'}
            13 {'SGRAM'}
            default {'Invalid Code'}
        }
    }

    Return
}