Function Get-PortType {

    param ([uint16]$Code)

    switch ($Code){
        '0' {'None'}
        '1' {'Parallel Port XT/AT Compatible'}
        '2' {'Parallel Port PS/2'}
        '3' {'Parallel Port ECP'}
        '4' {'Parallel Port EPP'}
        '5' {'Parallel Port ECP/EPP'}
        '6' {'Serial Port XT/AT Compatible'}
        '7' {'Serial Port 16450 Compatible'}
        '8' {'Serial Port 16550 Compatible'}
        '9' {'Serial Port 16550A Compatible'}
        '10' {'SCSI Port'}
        '11' {'MIDI Port'}
        '12' {'Joy Stick Port'}
        '13' {'Keyboard Port'}
        '14' {'Mouse Port'}
        '15' {'SSA SCSI'}
        '16' {'USB'}
        '17' {'FireWire (IEEE P1394)'}
        '18' {'PCMCIA Type II'}
        '19' {'PCMCIA Type II'}
        '20' {'PCMCIA Type III'}
        '21' {'Cardbus'}
        '22' {'Access Bus Port'}
        '23' {'SCSI II'}
        '24' {'SCSI Wide'}
        '25' {'PC-98'}
        '26' {'PC-98-Hireso'}
        '27' {'PC-H98'}
        '28' {'Video Port'}
        '29' {'Audio Port'}
        '30' {'Modem Port'}
        '31' {'Network Port'}
        '32' {'8251 Compatible'}
        '33' {'8251 FIFO Compatible'}
        default {'Invalid or No Code'}
    }

    Return
}