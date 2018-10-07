Function Get-ConnectorType {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Male'}
            3 {'Female'}
            4 {'Shielded'}
            5 {'Unshielded'}
            6 {'SCSI (A) High-Density (50 pins)'}
            7 {'SCSI (A) Low-Density (50 pins)'}
            8 {'SCSI (P) High-Density (68 pins)'}
            9 {'SCSI SCA-I (80 pins)'}
            10 {'SCSI SCA-II (80 pins)'}
            11 {'SCSI Fibre Channel (DB-9, Copper)'}
            12 {'SCSI Fibre Channel (Fibre)'}
            13 {'SCSI Fibre Channel SCA-II (40 pins)'}
            14 {'SCSI Fibre Channel SCA-II (20 pins)'}
            15 {'SCSI Fibre Channel BNC'}
            16 {'ATA 3-1/2 Inch (40 pins)'}
            17 {'ATA 2-1/2 Inch (44 pins)'}
            18 {'ATA-2'}
            19 {'ATA-3'}
            20 {'ATA/66'}
            21 {'DB-9'}
            22 {'DB-15'}
            23 {'DB-25'}
            24 {'DB-36'}
            25 {'RS-232C'}
            26 {'RS-422'}
            27 {'RS-423'}
            28 {'RS-485'}
            29 {'RS-449'}
            30 {'V.35'}
            31 {'X.21'}
            32 {'IEEE-488'}
            33 {'AUI'}
            34 {'UTP Category 3'}
            35 {'UTP Category 4'}
            36 {'UTP Category 5'}
            37 {'BNC'}
            38 {'RJ11'}
            39 {'RJ45'}
            40 {'Fiber MIC'}
            41 {'Apple AUI'}
            42 {'Apple GeoPort'}
            43 {'PCI'}
            44 {'ISA'}
            45 {'EISA'}
            46 {'VESA'}
            47 {'PCMCIA'}
            48 {'PCMCIA Type I'}
            49 {'PCMCIA Type II'}
            50 {'PCMCIA Type III'}
            51 {'ZV Port'}
            52 {'CardBus'}
            53 {'USB'}
            54 {'IEEE 1394'}
            55 {'HIPPI'}
            56 {'HSSDC (6 pins)'}
            57 {'GBIC'}
            58 {'DIN'}
            59 {'Mini-DIN'}
            60 {'Micro-DIN'}
            61 {'PS/2'}
            62 {'Infrared'}
            63 {'HP-HIL'}
            64 {'Access.bus'}
            65 {'NuBus'}
            66 {'Centronics'}
            67 {'Mini-Centronics'}
            68 {'Mini-Centronics Type-14'}
            69 {'Mini-Centronics Type-20'}
            70 {'Mini-Centronics Type-26'}
            71 {'Bus Mouse'}
            72 {'ADB'}
            73 {'AGP'}
            74 {'VME Bus'}
            75 {'VME64'}
            76 {'Proprietary'}
            77 {'Proprietary Processor Card Slot'}
            78 {'Proprietary Memory Card Slot'}
            79 {'Proprietary I/O Riser Slot'}
            80 {'PCI-66MHZ'}
            81 {'AGP2X'}
            82 {'AGP4X'}
            83 {'PC-98'}
            84 {'PC-98Hireso'}
            85 {'PC-H98'}
            86 {'PC-98Note'}
            87 {'PC-98Full'}
            88 {'Mini-Jack - SSA SCSI'}
            89 {'On Board Floppy - Circular'}
            90 {'9 Pin Dual Inline (pin 10 cut) - On Board IDE Connector'}
            91 {'25 Pin Dual Inline (pin 26 cut) - On Board Floppy Connector'}
            92 {'50 Pin Dual Inline'}
            93 {'68 Pin Dual Inline'}
            94 {'On Board Sound Input from CD-ROM'}
            95 {'68 Pin Dual Inline'}
            96 {'On Board Sound Connector'}
            97 {'Mini-Jack'}
            98 {'PCI-X'}
            99 {'Sbus IEEE 1396-1993 32 Bit'}
            100 {'Sbus IEEE 1396-1993 64 Bit'}
            101 {'MCA'}
            102 {'GIO'}
            103 {'XIO'}
            104 {'HIO'}
            105 {'NGIO'}
            106 {'PMC'}
            107 {'MTRJ'}
            108 {'VF-45'}
            109 {'Future I/O'}
            110 {'SC'}
            111 {'SG'}
            112 {'Electrical'}
            113 {'Optical'}
            114 {'Ribbon'}
            115 {'GLM'}
            116 {'1x9'}
            117 {'Mini SG'}
            118 {'LC'}
            119 {'HSSC'}
            120 {'VHDCI Shielded (68 pins)'}
            121 {'InfiniBand'}
            default {'Invalid Code'}
        }
    }

    Return
}