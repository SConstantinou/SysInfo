Function Get-ReplacementPolicy {

    param ([uint16]$Code)

    switch ($Code){
        '1' {'Other'}
        '2' {'Unknown'}
        '3' {'Least Recently Used (LRU)'}
        '4' {'First In First Out (FIFO)'}
        '5' {'Last In First Out (LIFO)'}
        '6' {'Least Frequently Used (LFU)'}
        '7' {'Most Frequently Used (MFU)'}
        '8' {'Data Dependent Multiple Algorithms'}
        default {'Invalid or No Code'}
    }

    Return
}