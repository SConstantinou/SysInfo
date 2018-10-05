Function Get-FormFactor {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'Unknown'}
        '1' {'Other'}
        '2' {'SIP'}
        '3' {'DIP'}
        '4' {'ZIP'}
        '5' {'SOJ'}
        '6' {'Proprietary'}
        '7' {'SIMM'}
        '8' {'DIMM'}
        '9' {'TSOP'}
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