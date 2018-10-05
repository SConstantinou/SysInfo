Function Get-Architecture {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'x86'}
        '1' {'MIPS'}
        '2' {'Alpha'}
        '3' {'PowerPC'}
        '5' {'ARM'}
        '6' {'ia64 - Itanium-based systems'}
        '9' {'x64'}
        '10' {'PGA'}
        '11' {'RIMM'}
        '12' {'SODIMM'}
        '13' {'SRIMM'}
        '14' {'SMD'}
        '15' {'SSMP'}
        '16' {'QFP'}
        '17' {'TQFP'}
        '18' {'SOIC'}
        '19' {'LCC'}
        '20' {'PLCC'}
        '21' {'BGA'}
        '22' {'FPBGA'}
        '23' {'LGA'}
        default {'Invalid or No Code'}
    }

    Return
}