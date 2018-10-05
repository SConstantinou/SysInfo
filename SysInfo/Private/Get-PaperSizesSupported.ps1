﻿Function Get-PaperSizesSupported {

    param ([uint16[]]$Code)

    switch ($Code){
        0 {'Unknown'}
        1 {'Other'}
        2 {'A'}
        3 {'B'}
        4 {'C'}
        5 {'D'}
        6 {'E'}
        7 {'Letter'}
        8 {'Legal'}
        9 {'NA-10x13-Envelope'}
        10 {'NA-9x12-Envelope'}
        11 {'NA-Number-10-Envelope'}
        12 {'NA-7x9-Envelope'}
        13 {'NA-9x11-Envelope'}
        14 {'NA-10x14-Envelope'}
        15 {'NA-Number-9-Envelope'}
        16 {'NA-6x9-Envelope'}
        17 {'NA-10x15-Envelope'}
        18 {'A0'}
        19 {'A1'}
        20 {'A2'}
        21 {'A3'}
        22 {'A4'}
        23 {'A5'}
        24 {'A6'}
        25 {'A7'}
        26 {'A8'}
        27 {'A9A10'}
        28 {'B0'}
        29 {'B1'}
        30 {'B2'}
        31 {'B3'}
        32 {'B4'}
        33 {'B5'}
        34 {'B6'}
        35 {'B7'}
        36 {'B8'}
        37 {'B9'}
        38 {'B10'}
        39 {'C0'}
        40 {'C1'}
        41 {'C2C3'}
        42 {'C4'}
        43 {'C5'}
        44 {'C6'}
        45 {'C7'}
        46 {'C8'}
        47 {'ISO-Designated'}
        48 {'JIS B0'}
        49 {'JIS B1'}
        50 {'JIS B2'}
        51 {'JIS B3'}
        52 {'JIS B4'}
        53 {'JIS B5'}
        54 {'JIS B6'}
        55 {'JIS B7'}
        56 {'JIS B8'}
        57 {'JIS B9'}
        58 {'JIS B10'}
        59 {'NA-Letter'}
        60 {'NA-Legal'}
        61 {'B4-Envelope'}
        62 {'B5-Envelope'}
        63 {'C3-Envelope'}
        64 {'C4-Envelope'}
        65 {'C5-Envelope'}
        66 {'C6-Envelope'}
        67 {'Designated-Long-Envelope'}
        68 {'Monarch-Envelope'}
        69 {'Executive'}
        70 {'Folio'}
        71 {'Invoice'}
        72 {'Ledger'}
        73 {'Quarto'}
        default {'Invalid or No Code'}
    }

    Return
}