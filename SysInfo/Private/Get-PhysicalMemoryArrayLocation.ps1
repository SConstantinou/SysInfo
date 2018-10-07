Function Get-PhysicalMemoryArrayLocation {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'System board or motherboard'}
            4 {'ISA add-on card'}
            5 {'EISA add-on card'}
            6 {'PCI add-on card'}
            7 {'MCA add-on card'}
            8 {'PCMCIA add-on card'}
            9 {'Proprietary add-on card'}
            10 {'NuBus'}
            11 {'PC-98/C20 add-on card'}
            12 {'PC-98/C24 add-on card'}
            13 {'PC-98/E add-on card'}
            14 {'PC-98/Local bus add-on card'}
            default {'Invalid Code'}
        }
    }

    Return
}