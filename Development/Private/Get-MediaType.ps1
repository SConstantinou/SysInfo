Function Get-MediaType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Tape Cartridge'}
            3 {'QIC Cartridge'}
            4 {'AIT Cartridge'}
            5 {'DTF Cartridge'}
            6 {'DAT Cartridge'}
            7 {'8mm Tape Cartridge'}
            8 {'19mm Tape Cartridge'}
            9 {'DLT Cartridge'}
            10 {'Half-Inch Magnetic Tape Cartridge'}
            11 {'Cartridge Disk'}
            12 {'JAZ Disk'}
            13 {'ZIP Disk'}
            14 {'SyQuest Disk'}
            15 {'Winchester Removable Disk'}
            16 {'CD-ROM'}
            17 {'CD-ROM/XA'}
            18 {'CD-I'}
            19 {'CD Recordable'}
            20 {'WORM'}
            21 {'Magneto-Optical'}
            22 {'DVD'}
            23 {'DVD+RW'}
            24 {'DVD-RAM'}
            25 {'DVD-ROM'}
            26 {'DVD-Video'}
            27 {'Divx'}
            28 {'Floppy/Diskette'}
            29 {'Hard Disk'}
            30 {'Memory Card'}
            31 {'Hard Copy'}
            32 {'Clik Disk'}
            33 {'CD-RW'}
            34 {'CD-DA'}
            35 {'CD+'}
            36 {'DVD Recordable'}
            37 {'DVD-RW'}
            38 {'DVD-Audio'}
            39 {'DVD-5'}
            40 {'DVD-9'}
            41 {'DVD-10'}
            42 {'DVD-18'}
            43 {'Magneto-Optical Rewriteable'}
            44 {'Magneto-Optical Write Once'}
            45 {'Magneto-Optical Rewriteable (LIMDOW)'}
            46 {'Phase Change Write Once'}
            47 {'Phase Change Rewriteable'}
            48 {'Phase Change Dual Rewriteable'}
            49 {'Ablative Write Once'}
            50 {'Near Field Recording'}
            51 {'MiniQic'}
            52 {'Travan'}
            53 {'8mm Metal Particle'}
            54 {'8mm Advanced Metal Evaporate'}
            55 {'NCTP'}
            56 {'LTO Ultrium'}
            57 {'LTO Accelis'}
            58 {'9 Track Tape'}
            59 {'18 Track Tape'}
            60 {'36 Track Tape'}
            61 {'Magstar 3590'}
            62 {'Magstar MP'}
            63 {'D2 Tape'}
            64 {'Tape - DST Small'}
            65 {'Tape - DST Medium'}
            66 {'Tape - DST Large'}
            default {'Invalid Code'}
        }
    }

    Return
}