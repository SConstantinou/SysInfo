﻿Function Get-CurrentLanguage {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'PCL'}
            4 {'HPGL'}
            5 {'PJL'}
            6 {'PS'}
            7 {'PSPrinter'}
            8 {'IPDS'}
            9 {'PPDS'}
            10 {'EscapeP'}
            11 {'Epson'}
            12 {'DDIF'}
            13 {'Interpress'}
            14 {'ISO6429'}
            15 {'Line Data'}
            16 {'MODCA'}
            17 {'REGIS'}
            18 {'SCS'}
            19 {'SPDL'}
            20 {'TEK4014'}
            21 {'PDS'}
            22 {'IGP'}
            23 {'CodeV'}
            24 {'DSCDSE'}
            25 {'WPS'}
            26 {'LN03'}
            27 {'CCITT'}
            28 {'QUIC'}
            29 {'CPAP'}
            30 {'DecPPL'}
            31 {'Simple Text'}
            32 {'NPAP'}
            33 {'DOC'}
            34 {'imPress'}
            35 {'Pinwriter'}
            36 {'NPDL'}
            37 {'NEC201PL'}
            38 {'Automatic'}
            39 {'Pages'}
            40 {'LIPS'}
            41 {'TIFF'}
            42 {'Diagnostic'}
            43 {'CaPSL'}
            44 {'EXCL'}
            45 {'LCDS'}
            46 {'XES'}
            47 {'MIME'}
            48 {'XPS'}
            49 {'HPGL2'}
            50 {'PCLXL'}
            default {'Invalid Code'}
        }
    }

    Return
}