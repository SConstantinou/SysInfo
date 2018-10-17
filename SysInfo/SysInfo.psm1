Function Get-AcceleratorCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Graphics Accelerator'}
            3 {'3D Accelerator'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Access {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Readable'}
            2 {'Writeable'}
            3 {'Read/Write Supported'}
            4 {'Write Once'}
            5 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Architecture {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'x86'}
            1 {'MIPS'}
            2 {'Alpha'}
            3 {'PowerPC'}
            5 {'ARM'}
            6 {'ia64 - Itanium-based systems'}
            9 {'x64'}
            10 {'PGA'}
            11 {'RIMM'}
            12 {'SODIMM'}
            13 {'SRIMM'}
            14 {'SMD'}
            15 {'SSMP'}
            16 {'QFP'}
            17 {'TQFP'}
            18 {'SOIC'}
            19 {'LCC'}
            20 {'PLCC'}
            21 {'BGA'}
            22 {'FPBGA'}
            23 {'LGA'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Associativity {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Direct Mapped'}
            4 {'2-way Set-Associative'}
            5 {'4-way Set-Associative'}
            6 {'Fully Associative'}
            7 {'8-way Set-Associative'}
            8 {'16-way Set-Associative'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-AttributesCode {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Queued'}
            2 {'Direct'}
            4 {'Default'}
            8 {'Shared'}
            16 {'Network'}
            32 {'Hidden'}
            64 {'Local'}
            128 {'EnableDevQ'}
            256 {'KeepPrintedJobs'}
            512 {'DoCompleteFirst'}
            1024 {'WorkOffline'}
            2048 {'EnableBIDI'}
            4096 {'RAW Only'}
            8192 {'Published'}
            default {'Invalid Code'}
        }
    }

    Return
}

function Get-Availability {

    param ([uint16] $Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Running or Full Power'}
            4 {'Warning'}
            5 {'In Test'}
            6 {'Not Applicable'}
            7 {'Power Off'}
            8 {'Off Line'}
            9 {'Off Duty'}
            10 {'Degraded'}
            11 {'Not Installed'}
            12 {'Install Error'}
            13 {'Power Save - Unknown'}
            14 {'Power Save - Low Power Mode'}
            15 {'Power Save - Standby'}
            16 {'Power Cycle'}
            17 {'Power Save - Warning'}
            18 {'Pause'}
            19 {'Not Ready'}
            20 {'Not Configured'}
            21 {'Quiesced - Device is Quiet'}
            default {'Invalid or No Code'}
        }
    }
    Return
}

Function Get-BatteryStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other - The battery is discharging'}
            2 {'Unknown - The system has access to AC so no battery is being discharged. However, the battery is not necessarily charging.'}
            3 {'Fully Charged'}
            4 {'Low'}
            5 {'Critical'}
            6 {'Charging'}
            7 {'Charging and High'}
            8 {'Charging and Low'}
            9 {'Charging and Critical'}
            10 {'Undefined'}
            11 {'Partially Charged'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-BiosCharacteristicsCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Reserved'}
            1 {'Reserved'}
            2 {'Unknown'}
            3 {'BIOS Characteristics Not Supported'}
            4 {'ISA is supported'}
            5 {'MCA is supported'}
            6 {'EISA is supported'}
            7 {'PCI is supported'}
            8 {'PC Card (PCMCIA) is supported'}
            9 {'Plug and Play is supported'}
            10 {'APM is supported'}
            11 {'BIOS is Upgradeable (Flash)'}
            12 {'BIOS shadowing is allowed'}
            13 {'VL-VESA is supported'}
            14 {'ESCD support is available'}
            15 {'Boot from CD is supported'}
            16 {'Selectable Boot is supported'}
            17 {'BIOS ROM is socketed'}
            18 {'Boot From PC Card (PCMCIA) is supported'}
            19 {'EDD (Enhanced Disk Drive) Specification is supported'}
            20 {'Int 13h - Japanese Floppy for NEC 9800 1.2mb (3.5\", 1k Bytes/Sector, 360 RPM) is supported'}
            21 {'Int 13h - Japanese Floppy for Toshiba 1.2mb (3.5\", 360 RPM) is supported'}
            22 {'Int 13h - 5.25\" / 360 KB Floppy Services are supported'}
            23 {'Int 13h - 5.25\" /1.2MB Floppy Services are supported'}
            24 {'Int 13h - 3.5\" / 720 KB Floppy Services are supported'}
            25 {'Int 13h - 3.5\" / 2.88 MB Floppy Services are supported'}
            26 {'Int 5h, Print Screen Service is supported'}
            27 {'Int 9h, 8042 Keyboard services are supported'}
            28 {'Int 14h, Serial Services are supported'}
            29 {'Int 17h, printer services are supported'}
            30 {'Int 10h, CGA/Mono Video Services are supported'}
            31 {'NEC PC-98'}
            32 {'ACPI supported'}
            33 {'USB Legacy is supported'}
            34 {'AGP is supported'}
            35 {'I2O boot is supported'}
            36 {'LS-120 boot is supported'}
            37 {'ATAPI ZIP Drive boot is supported'}
            38 {'1394 boot is supported'}
            39 {'Smart Battery supported'}
            40 {'Reserved for BIOS vendor'}
            41 {'Reserved for BIOS vendor'}
            42 {'Reserved for BIOS vendor'}
            43 {'Reserved for BIOS vendor'}
            44 {'Reserved for BIOS vendor'}
            45 {'Reserved for BIOS vendor'}
            46 {'Reserved for BIOS vendor'}
            47 {'Reserved for BIOS vendor'}
            48 {'Reserved for system vendor'}
            49 {'Reserved for system vendor'}
            50 {'Reserved for system vendor'}
            51 {'Reserved for system vendor'}
            52 {'Reserved for system vendor'}
            53 {'Reserved for system vendor'}
            54 {'Reserved for system vendor'}
            55 {'Reserved for system vendor'}
            56 {'Reserved for system vendor'}
            57 {'Reserved for system vendor'}
            58 {'Reserved for system vendor'}
            59 {'Reserved for system vendor'}
            60 {'Reserved for system vendor'}
            61 {'Reserved for system vendor'}
            62 {'Reserved for system vendor'}
            63 {'Reserved for system vendor'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-BusType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            -1 {'Undefined'}
            0 {'Internal'}
            1 {'ISA'}
            2 {'EISA'}
            3 {'MicroChannel'}
            4 {'TurboChannel'}
            5 {'PCI Bus'}
            6 {'VME Bus'}
            7 {'NuBus'}
            8 {'PCMCIA Bus'}
            9 {'C Bus'}
            10 {'MPI Bus'}
            11 {'MPSA Bus'}
            12 {'Internal Processor'}
            13 {'Internal Power Bus'}
            14 {'PNP ISA Bus'}
            15 {'PNP Bus'}
            16 {'Maximum Interface Type'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-CacheType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Instruction'}
            4 {'Data'}
            5 {'Unified'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ChassisType {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Desktop'}
            4 {'Low Profile Desktop'}
            5 {'Pizza Box'}
            6 {'Mini Tower'}
            7 {'Tower'}
            8 {'Portable'}
            9 {'Laptop'}
            10 {'Notebook'}
            11 {'Hand Held'}
            12 {'Docking Station'}
            13 {'All in One'}
            14 {'Sub Notebook'}
            15 {'Space-Saving'}
            16 {'Lunch Box'}
            17 {'Main System Chassis'}
            18 {'Expansion Chassis'}
            19 {'SubChassis'}
            20 {'Bus Expansion Chassis'}
            21 {'Peripheral Chassis'}
            22 {'Storage Chassis'}
            23 {'Rack Mount Chassis'}
            24 {'Sealed-Case PC'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Chemistry {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Lead Acid'}
            4 {'Nickel Cadmium'}
            5 {'Nickel Metal Hydride'}
            6 {'Lithium-ion'}
            7 {'Zinc air'}
            8 {'Lithium Polymer'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Color {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Monochrome (true black)'}
            2 {'Color'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Compression {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Disabled'}
            1 {'Enabled'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ConfigManagerErrorCode {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'This device is working properly.'}
            1 {'This device is not configured correctly.'}
            2 {'Windows cannot load the driver for this device.'}
            3 {'The driver for this device might be corrupted, or your system may be running low on memory or other resources.'}
            4 {'This device is not working properly. One of its drivers or your registry might be corrupted.'}
            5 {'The driver for this device needs a resource that Windows cannot manage.'}
            6 {'The boot configuration for this device conflicts with other devices.'}
            7 {'Cannot filter.'}
            8 {'The driver loader for the device is missing.'}
            9 {'This device is not working properly because the controlling firmware is reporting the resources for the device incorrectly.'}
            10 {'This device cannot start.'}
            11 {'This device failed.'}
            12 {'This device cannot find enough free resources that it can use.'}
            13 {"Windows cannot verify this device's resources."}
            14 {'This device cannot work properly until you restart your computer.'}
            15 {'This device is not working properly because there is probably a re-enumeration problem.'}
            16 {'Windows cannot identify all the resources this device uses.'}
            17 {'This device is asking for an unknown resource type.'}
            18 {'Reinstall the drivers for this device.'}
            19 {'Failure using the VxD loader.'}
            20 {'Your registry might be corrupted.'}
            21 {'System failure: Try changing the driver for this device. If that does not work, see your hardware documentation. Windows is removing this device.'}
            22 {'This device is disabled.'}
            23 {"System failure: Try changing the driver for this device. If that doesn't work, see your hardware documentation."}
            24 {'This device is not present, is not working properly, or does not have all its drivers installed.'}
            25 {'Windows is still setting up this device.'}
            26 {'Windows is still setting up this device.'}
            27 {'This device does not have valid log configuration.'}
            28 {'The drivers for this device are not installed.'}
            29 {'This device is disabled because the firmware of the device did not give it the required resources.'}
            30 {'This device is using an Interrupt Request (IRQ) resource that another device is using.'}
            31 {'This device is not working properly because Windows cannot load the drivers required for this device.'}
            deafult {'Invalid Code'}
        }
    }

    Return
}

Function Get-CpuStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'CPU Enabled'}
            2 {'CPU Disabled by User via BIOS Setup'}
            3 {'CPU Disabled By BIOS (POST Error)'}
            4 {'CPU is Idle'}
            5 {'Reserved'}
            6 {'Reserved'}
            7 {'Other'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-CurrentCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Color Printing'}
            3 {'Duplex Printing'}
            4 {'Copies'}
            5 {'Collation'}
            6 {'Stapling'}
            7 {'Transparency Printing'}
            8 {'Punch'}
            9 {'Cover'}
            10 {'Bind'}
            11 {'Black and White Printing'}
            12 {'One Sided'}
            13 {'Two Sided Long Edge'}
            14 {'Two Sided Short Edge'}
            15 {'Portrait'}
            16 {'Landscape'}
            17 {'Reverse Portrait'}
            18 {'Reverse Landscape'}
            19 {'Quality High'}
            20 {'Quality Normal'}
            21 {'Quality Low'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-CurrentLanguage {

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

Function Get-CurrentScanMode {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Interlaced'}
            4 {'Non Interlaced'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-CurrentSRAM {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Other'}
            1 {'Unknown'}
            2 {'Non-Burst'}
            3 {'Burst'}
            4 {'Pipeline Burst'}
            5 {'Synchronous'}
            6 {'Asynchronous'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DataExecutionPreventionSupportPolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Always Off'}
            1 {'Always On'}
            2 {'Opt In'}
            3 {'Opt Out'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DefaultCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Color Printing'}
            3 {'Duplex Printing'}
            4 {'Copies'}
            5 {'Collation'}
            6 {'Stapling'}
            7 {'Transparency Printing'}
            8 {'Punch'}
            9 {'Cover'}
            10 {'Bind'}
            11 {'Black and White Printing'}
            12 {'One Sided'}
            13 {'Two Sided Long Edge'}
            14 {'Two Sided Short Edge'}
            15 {'Portrait'}
            16 {'Landscape'}
            17 {'Reverse Portrait'}
            18 {'Reverse Landscape'}
            19 {'Quality High'}
            20 {'Quality Normal'}
            21 {'Quality Low'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DefaultLanguage {

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

Function Get-DetectedErrorState {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'No Error'}
            3 {'Low Paper'}
            4 {'No Paper'}
            5 {'Low Toner'}
            6 {'No Toner'}
            7 {'Door Open'}
            8 {'Jammed'}
            9 {'Offline'}
            10 {'Service Requested'}
            11 {'Output Bin Full'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DeviceInterface {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Serial'}
            4 {'PS/2'}
            5 {'Infrared'}
            6 {'HP-HIL'}
            7 {'Bus Mouse'}
            8 {'ADB (Apple Desktop Bus)'}
            160 {'Bus mouse DB-9'}
            161 {'Bus mouse micro-DIN'}
            162 {'USB'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DitherType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'No Dithering'}
            2 {'Coarse Brush'}
            3 {'Fine Brush'}
            4 {'Line Art'}
            5 {'Grayscale'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-DriveType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'No Root Directory'}
            2 {'Removable Disk'}
            3 {'Local Disk'}
            4 {'Network Drive'}
            5 {'Compact Disc'}
            6 {'RAM Disk'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ECC {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Does not support hardware error corrention (ECC)'}
            1 {'Supports hardware error corrention (ECC)'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ErrorAccess {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Read'}
            4 {'Write'}
            5 {'Partial Write'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ErrorCorrectType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'None'}
            4 {'Parity'}
            5 {'Single-bit ECC'}
            6 {'Multi-bit ECC'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ErrorDataOrder {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Least Significant Byte First'}
            2 {'Most Significant Byte First'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ErrorGranularity {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Device level'}
            4 {'Memory partition level'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ErrorInfo {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'OK'}
            4 {'Bad Read'}
            5 {'Parity Error'}
            6 {'Single-Bit Error'}
            7 {'Double-Bit Error'}
            8 {'Multi-Bit Error'}
            9 {'Nibble Error'}
            10 {'Checksum Error'}
            11 {'CRC Error'}
            12 {'Corrected single-bit error'}
            13 {'Corrected error'}
            14 {'Uncorrectable error'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ExtendedDetectedErrorState {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'No Error'}
            3 {'Low Paper'}
            4 {'No Paper'}
            5 {'Low Toner'}
            6 {'No Toner'}
            7 {'Door Open'}
            8 {'Jammed'}
            9 {'Service Requested'}
            10 {'Output Bin Full'}
            11 {'Paper Problem'}
            12 {'Cannot Print Page'}
            13 {'User Intervention Required'}
            14 {'Out of Memory'}
            15 {'Server Unknown'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ExtendedPrinterStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Idle'}
            4 {'Printing'}
            5 {'Warming Up'}
            6 {'Stopped Printing'}
            7 {'Offline'}
            8 {'Paused'}
            9 {'Error'}
            10 {'Busy'}
            11 {'Not Available'}
            12 {'Waiting'}
            13 {'Processing'}
            14 {'Initialization'}
            15 {'Power Save'}
            16 {'Pending Deletion'}
            17 {'I/O Active'}
            18 {'Manual Feed'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Family {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'8086'}
            4 {'80286'}
            5 {'80386 - Intel386(TM) Processor'}
            6 {'80486 - Intel486(TM) Processor'}
            7 {'8087'}
            8 {'80287'}
            9 {'80387'}
            10 {'80487'}
            11 {'Pentium(R) brand'}
            12 {'Pentium(R) Pro'}
            13 {'Pentium(R) II'}
            14 {'Pentium(R) processor with MMX(TM) technology'}
            15 {'Celeron(TM)'}
            16 {'Pentium(R) II Xeon(TM)'}
            17 {'Pentium(R) III'}
            18 {'M1 Family'}
            19 {'M2 Family'}
            20 {'Intel(R) Celeron(R) M processor'}
            21 {'Intel(R) Pentium(R) 4 HT processor'}
            24 {'K5 Family - AMD Duron(TM) Processor Family'}
            25 {'K6 Family'}
            26 {'K6-2'}
            27 {'K6-3'}
            28 {'AMD Athlon(TM) Processor Family'}
            29 {'AMD(R) Duron(TM) Processor'}
            30 {'AMD29000 Family'}
            31 {'K6-2+'}
            32 {'Power PC Family'}
            33 {'Power PC 601'}
            34 {'Power PC 603'}
            35 {'Power PC 603+'}
            36 {'Power PC 604'}
            37 {'Power PC 620'}
            38 {'Power PC X704'}
            39 {'Power PC 750'}
            40 {'Intel(R) Core(TM) Duo Processor'}
            41 {'Intel(R) Core(TM) Duo Mobile Processor'}
            42 {'Intel(R) Core(TM) Solo Mobile Processor'}
            43 {'Intel(R) Atom(TM) Processor'}
            48 {'Alpha Family'}
            49 {'Alpha 21064'}
            50 {'Alpha 21066'}
            51 {'Alpha 21164'}
            52 {'Alpha 21164PC'}
            53 {'Alpha 21164a'}
            54 {'Alpha 21264'}
            55 {'Alpha 21364'}
            56 {'AMD Turion(TM) II Ultra Dual-Core Mobile M Processor Family'}
            57 {'AMD Turion(TM) II Dual-Core Mobile M Processor Family'}
            58 {'AMD Athlon(TM) II Dual-Core Mobile M Processor Family'}
            59 {'AMD Opteron(TM) 6100 Series Processor'}
            60 {'AMD Opteron(TM) 4100 Series Processor'}
            61 {'AMD Opteron(TM) 6200 Series Processor'}
            62 {'AMD Opteron(TM) 4200 Series Processor'}
            63 {'AMD FX(TM) Series Processor'}
            64 {'MIPS Family'}
            65 {'MIPS R4000'}
            66 {'MIPS R4200'}
            67 {'MIPS R4400'}
            68 {'MIPS R4600'}
            69 {'MIPS R10000'}
            70 {'AMD C-Series Processor'}
            71 {'AMD E-Series Processor'}
            72 {'AMD A-Series Processor'}
            73 {'AMD G-Series Processor'}
            74 {'AMD Z-Series Processor'}
            80 {'SPARC Family'}
            81 {'SuperSPARC'}
            82 {'microSPARC II'}
            83 {'microSPARC IIep'}
            84 {'UltraSPARC'}
            85 {'UltraSPARC II'}
            86 {'UltraSPARC IIi'}
            87 {'UltraSPARC III'}
            88 {'UltraSPARC IIIi'}
            96 {'68040'}
            97 {'68xxx Family'}
            98 {'68000'}
            99 {'68010'}
            100 {'68020'}
            101 {'68030'}
            112 {'Hobbit Family'}
            120 {'Crusoe(TM) TM5000 Family'}
            121 {'Crusoe(TM) TM3000 Family'}
            122 {'Efficeon(TM) TM8000 Family'}
            128 {'Weitek'}
            130 {'Itanium(TM) Processor'}
            131 {'AMD Athlon(TM) 64 Processor Family'}
            132 {'AMD Opteron(TM) Family'}
            133 {'AMD Sempron(TM) Processor Family'}
            134 {'AMD Turion(TM) 64 Mobile Technology'}
            135 {'Dual-Core AMD Opteron(TM) Processor Family'}
            136 {'AMD Athlon(TM) 64 X2 Dual-Core Processor Family'}
            137 {'AMD Turion(TM) 64 X2 Mobile Technology'}
            138 {'Quad-Core AMD Opteron(TM) Processor Family'}
            139 {'Third-Generation AMD Opteron(TM) Processor Family'}
            140 {'AMD Phenom(TM) FX Quad-Core Processor Family'}
            141 {'AMD Phenom(TM) X4 Quad-Core Processor Family'}
            142 {'AMD Phenom(TM) X2 Dual-Core Processor Family'}
            143 {'AMD Athlon(TM) X2 Dual-Core Processor Family'}
            144 {'PA-RISC Family'}
            145 {'PA-RISC 8500'}
            146 {'PA-RISC 8000'}
            147 {'PA-RISC 7300LC'}
            148 {'PA-RISC 7200'}
            149 {'PA-RISC 7100LC'}
            150 {'PA-RISC 7100'}
            160 {'V30 Family'}
            161 {'Quad-Core Intel(R) Xeon(R) processor 3200 Series'}
            162 {'Dual-Core Intel(R) Xeon(R) processor 3000 Series'}
            163 {'Quad-Core Intel(R) Xeon(R) processor 5300 Series'}
            164 {'Dual-Core Intel(R) Xeon(R) processor 5100 Series'}
            165 {'Dual-Core Intel(R) Xeon(R) processor 5000 Series'}
            166 {'Dual-Core Intel(R) Xeon(R) processor LV'}
            167 {'Dual-Core Intel(R) Xeon(R) processor ULV'}
            168 {'Dual-Core Intel(R) Xeon(R) processor 7100 Series'}
            169 {'Quad-Core Intel(R) Xeon(R) processor 5400 Series'}
            170 {'Quad-Core Intel(R) Xeon(R) processor'}
            171 {'Dual-Core Intel(R) Xeon(R) processor 5200 Series'}
            172 {'Dual-Core Intel(R) Xeon(R) processor 7200 Series'}
            173 {'Quad-Core Intel(R) Xeon(R) processor 7300 Series'}
            174 {'Quad-Core Intel(R) Xeon(R) processor 7400 Series'}
            175 {'Multi-Core Intel(R) Xeon(R) processor 7400 Series'}
            176 {'Pentium(R) III Xeon(TM)'}
            177 {'Pentium(R) III Processor with Intel(R) SpeedStep(TM) Technology'}
            178 {'Pentium(R) 4'}
            179 {'Intel(R) Xeon(TM)'}
            180 {'AS400 Family'}
            181 {'Intel(R) Xeon(TM) Processor MP'}
            182 {'AMD AthlonXP(TM) Family'}
            183 {'AMD AthlonMP(TM) Family'}
            184 {'Intel(R) Itanium(R) 2'}
            185 {'Intel Pentium M Processor'}
            186 {'Intel(R) Celeron(R) D processor'}
            187 {'Intel(R) Pentium(R) D processor'}
            188 {'Intel(R) Pentium(R) Processor Extreme Edition'}
            189 {'Intel(R) Core(TM) Solo Processor'}
            190 {'K7'}
            191 {'Intel(R) Core(TM)2 Duo Processor'}
            192 {'Intel(R) Core(TM)2 Solo processor'}
            193 {'Intel(R) Core(TM)2 Extreme processor'}
            194 {'Intel(R) Core(TM)2 Quad processor'}
            195 {'Intel(R) Core(TM)2 Extreme mobile processor'}
            196 {'Intel(R) Core(TM)2 Duo mobile processor'}
            197 {'Intel(R) Core(TM)2 Solo mobile processor'}
            198 {'Intel Core™ i7-2760QM'}
            199 {'Dual-Core Intel(R) Celeron(R) Processor'}
            200 {'IBM390 Family'}
            201 {'G4'}
            202 {'G5'}
            203 {'G6'}
            204 {'z/Architecture Base'}
            205 {'Intel(R) Core(TM) i5 processor'}
            206 {'Intel(R) Core(TM) i3 processor'}
            210 {'VIA C7(TM)-M Processor Family'}
            211 {'VIA C7(TM)-D Processor Family'}
            212 {'VIA C7(TM) Processor Family'}
            213 {'VIA Eden(TM) Processor Family'}
            214 {'Multi-Core Intel(R) Xeon(R) processor'}
            215 {'Dual-Core Intel(R) Xeon(R) processor 3xxx Series'}
            216 {'Quad-Core Intel(R) Xeon(R) processor 3xxx Series'}
            217 {'VIA Nano(TM) Processor Family'}
            218 {'Dual-Core Intel(R) Xeon(R) processor 5xxx Series'}
            219 {'Quad-Core Intel(R) Xeon(R) processor 5xxx Series'}
            221 {'Dual-Core Intel(R) Xeon(R) processor 7xxx Series'}
            222 {'Quad-Core Intel(R) Xeon(R) processor 7xxx Series'}
            223 {'Multi-Core Intel(R) Xeon(R) processor 7xxx Series'}
            224 {'Multi-Core Intel(R) Xeon(R) processor 3400 Series'}
            228 {'AMD Opteron(TM) 3000 Series Processor'}
            229 {'AMD Sempron(TM) II Processor Family'}
            230 {'Embedded AMD Opteron(TM) Quad-Core Processor Family'}
            231 {'AMD Phenom(TM) Triple-Core Processor Family'}
            232 {'AMD Turion(TM) Ultra Dual-Core Mobile Processor Family'}
            233 {'AMD Turion(TM) Dual-Core Mobile Processor Family'}
            234 {'AMD Athlon(TM) Dual-Core Processor Family'}
            235 {'AMD Sempron(TM) SI Processor Family'}
            236 {'AMD Phenom(TM) II Processor Family'}
            237 {'AMD Athlon(TM) II Processor Family'}
            238 {'Six-Core AMD Opteron(TM) Processor Family'}
            239 {'AMD Sempron(TM) M Processor Family'}
            250 {'i860'}
            251 {'i960'}
            260 {'SH-3'}
            261 {'SH-4'}
            280 {'ARM'}
            281 {'StrongARM'}
            300 {'6x86'}
            301 {'MediaGX'}
            302 {'MII'}
            320 {'WinChip'}
            350 {'DSP'}
            500 {'Video Processor'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-FileSystemFlagsEx {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Case Sensitive Search'}
            2 {'Case Preserved Names'}
            4 {'Unicode On Disk'}
            8 {'Persistent ACLs'}
            16 {'File Compression'}
            32 {'Volume Quotas'}
            64 {'Supports Sparse Files'}
            128 {'Supports Reparse Points'}
            256 {'Supports Remote Storage'}
            16384 {'Supports Long Names'}
            32768 {'Volume Is Compressed'}
            524289 {'Read Only Volume'}
            65536 {'Supports Object IDS'}
            131072 {'Supports Encryption'}
            262144 {'Supports Named Streams'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ForegroundApplicationBoost {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'None'}
            1 {'Minimum'}
            2 {'Maximum'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-FormFactor {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'SIP'}
            3 {'DIP'}
            4 {'ZIP'}
            5 {'SOJ'}
            6 {'Proprietary'}
            7 {'SIMM'}
            8 {'DIMM'}
            9 {'TSOP'}
            10 {'PGA'}
            11 {'RIMM'}
            12 {'SODIMM'}
            13 {'SRIMM'}
            14 {'SMD'}
            15 {'SSMP'}
            16 {'QFP'}
            17 {'TQFP'}
            18 {'SOIC'}
            19 {'LCC'}
            20 {'PLCC'}
            21 {'BGA'}
            22 {'FPBGA'}
            23 {'LGA'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Handedness {

    param ([uint16]$Code)

    if ($Code -ne ''){

    switch ($Code){
        0 {'Unknown'}
        1 {'Not Applicable'}
        2 {'Right Handed Operation'}
        3 {'Left Handed Operation'}
        default {'Invalid Code'}
    }
    }

    Return
}

Function Get-ICMIntent {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Saturation'}
            2 {'Contrast'}
            3 {'Exact Color'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ICMMethod {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Disabled'}
            2 {'Windows'}
            3 {'Device Driver'}
            4 {'Device'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-IGMPLevel {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'No Multicast'}
            1 {'IP Multicast'}
            2 {'IP & IGMP multicast'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-InterleavePosition {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Noninterleaved'}
            1 {'First position'}
            2 {'Second position'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-IPXFrameType {

    param ([uint32[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Ethernet II'}
            1 {'Ethernet 802.3'}
            2 {'Ethernet 802.2'}
            3 {'Ethernet SNAP'}
            255 {'Auto'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-IPXMediaType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Ethernet'}
            2 {'Token ring'}
            3 {'FDDI'}
            8 {'ARCNET'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-LanguagesSupported {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

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

Function Get-LargeSystemCache {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Optimize for Applications'}
            1 {'Optimize for System Performance'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Layout {
    param ([String] $Code)

    if ($Code -ne ''){

        Switch ($Code){
            '0000041c' {'Albanian'}
            '00000401' {'Arabic (101)'}
            '00010401' {'Arabic (102)'}
            '00020401' {'Arabic (102) AZERTY'}
            '0000042b' {'Armenian Eastern'}
            '0002042b' {'Armenian Phonetic'}
            '0003042b' {'Armenian Typewriter'}
            '0001042b' {'Armenian Western'}
            '0000044d' {'Assamese - Inscript'}
            '0001042c' {'Azerbaijani (Standard)'}
            '0000082c' {'Azerbaijani Cyrillic'}
            '0000042c' {'Azerbaijani Latin'}
            '0000046d' {'Bashkir'}
            '00000423' {'Belarusian'}
            '0001080c' {'Belgian (Comma)'}
            '00000813' {'Belgian (Period)'}
	        '0000080c' {'Belgian French'}
	        '00000445' {'Bangla (Bangladesh)'}
	        '00020445' {'Bangla (India)'}
	        '00010445' {'Bangla (India - Legacy)'}
	        '0000201a' {'Bosnian (Cyrillic)'}
	        '000b0c00' {'Buginese'}
	        '0030402' {'Bulgarian'}
	        '00010402' {'Bulgarian (Latin)'}
	        '00020402' {'Bulgarian (phonetic layout)'}
	        '00040402' {'Bulgarian (phonetic traditional)'}
	        '00000402' {'Bulgarian (Typewriter)'}
	        '00001009' {'Canadian French'}
	        '00000c0c' {'Canadian French (Legacy)'}
	        '00011009' {'Canadian Multilingual Standard'}
            '0000085f' {'Central Atlas Tamazight'}
            '00000429' {'Central Kurdish'}
            '0000045c' {'Cherokee Nation'}
            '0001045c' {'Cherokee Nation Phonetic'}
            '00000804' {'Chinese (Simplified) - US Keyboard'}
            '00000404' {'Chinese (Traditional) - US Keyboard'}
            '00000c04' {'Chinese (Traditional, Hong Kong S.A.R.)'}
            '00001404' {'Chinese (Traditional Macao S.A.R.) US Keyboard'}
            '00001004' {'Chinese (Simplified, Singapore) - US keyboard'}
            '0000041a' {'Croatian'}
            '00000405' {'Czech'}
            '00010405' {'Czech (QWERTY)'}
            '00020405' {'Czech Programmers'}
            '00000406' {'Danish'}
            '00000439' {'Devanagari-INSCRIPT'}
            '00000465' {'Divehi Phonetic'}
            '00010465' {'Divehi Typewriter'}
            '00000413' {'Dutch'}
            '00000C51' {'Dzongkha'}
            '00000425' {'Estonian'}
            '00000438' {'Faeroese'}
            '0000040b' {'Finnish'}
            '0001083b' {'Finnish with Sami'}
            '0000040c' {'French'}
            '00120c00' {'Futhark'}
            '00000437' {'Georgian'}
            '00020437' {'Georgian (Ergonomic)'}
            '00010437' {'Georgian (QWERTY)'}
            '00030437' {'Georgian Ministry of Education and Science Schools'}
            '00040437' {'Georgian (Old Alphabets)'}
            '00000407' {'German'}
            '00010407' {'German (IBM)'}
            '000c0c00' {'Gothic'}
            '00000408' {'Greek'}
            '00010408' {'Greek (220)'}
            '00030408' {'Greek (220) Latin'}
            '00020408' {'Greek (319)'}
            '00040408' {'Greek (319) Latin'}
            '00050408' {'Greek Latin'}
            '00060408' {'Greek Polytonic'}
            '0000046f' {'Greenlandic'}
            '00000474' {'Guarani'}
            '00000447' {'Gujarati'}
            '00000468' {'Hausa'}
            '0000040d' {'Hebrew'}
            '00010439' {'Hindi Traditional'}
            '0000040e' {'Hungarian'}
            '0001040e' {'Hungarian 101-key'}
            '0000040f' {'Icelandic'}
            '00000470' {'Igbo'}
            '000004009' {'India'}
            '0000085d' {'Inuktitut - Latin'}
            '0001045d' {'Inuktitut - Naqittaut'}
            '00001809' {'Irish'}
            '00000410' {'Italian'}
            '00010410' {'Italian (142)'}
            '00000411' {'Japanese'}
            '00110c00' {'Javanese'}
            '0000044b' {'Kannada'}
            '0000043f' {'Kazakh'}
            '00000453' {'Khmer'}
            '00010453' {'Khmer (NIDA)'}
            '00000412' {'Korean'}
            '00000440' {'Kyrgyz Cyrillic'}
            '00000454' {'Lao'}
            '0000080a' {'Latin American'}
            '00020426' {'Latvian (Standard)'}
            '00010426' {'Latvian (Legacy)'}
            '00070c00' {'Lisu (Basic)'}
            '00080c00' {'Lisu (Standard)'}
            '00010427' {'Lithuanian'}
            '00000427' {'Lithuanian IBM'}
            '00020427' {'Lithuanian Standard'}
            '0000046e' {'Luxembourgish'}
            '0000042f' {'Macedonia (FYROM)'}
            '0001042f' {'Macedonia (FYROM) - Standard'}
            '0000044c' {'Malayalam'}
            '0000043a' {'Maltese 47-Key'}
            '0001043a' {'Maltese 48-key'}
            '00000481' {'Maori'}
            '0000044e' {'Marathi'}
            '00000850' {'Mongolian (Mongolian Script - Legacy)'}
            '00020850' {'Mongolian (Mongolian Script - Standard)'}
            '00000450' {'Mongolian Cyrillic'}
            '00010c00' {'Myanmar'}
            '00090c00' {'N ko'}
            '00000461' {'Nepali'}
            '00020c00' {'New Tai Lue'}
	        '00000414' {'Norwegian'}
	        '0000043b' {'Norwegian with Sami'}
	        '00000448' {'Odia'}
	        '000d0c00' {'Ol Chiki'}
	        '000f0c00' {'Old Italic'}
	        '000e0c00' {'Osmanya'}
	        '00000463' {'Pashto (Afghanistan)'}
	        '0x00000429' {'Persian'}
	        '00050429' {'Persian (Standard)'}
	        '000a0c00' {'Phags-pa'}
	        '00010415' {'Polish (214)'}
	        '00000415' {'Polish (Programmers)'}
	        '00000816' {'Portuguese'}
	        '00000416' {'Portuguese (Brazilian ABNT)'}
	        '00010416' {'Portuguese (Brazilian ABNT2)'}
	        '00000446' {'Punjabi'}
	        '00000418' {'Romanian (Legacy)'}
	        '00020418' {'Romanian (Programmers)'}
	        '00010418' {'Romanian (Standard)'}
            '00000419' {'Russian'}
            '00020419' {'Russian - Mnemonic'}
            '00010419' {'Russian (Typewriter)'}
            '00000485' {'Sakha'}
            '0002083b' {'Sami Extended Finland-Sweden'}
            '0001043b' {'Sami Extended Norway'}
            '00011809' {'Scottish Gaelic'}
            '00000c1a' {'Serbian (Cyrillic)'}
            '0000081a' {'Serbian (Latin)'}
            '0000046c' {'Sesotho sa Leboa'}
            '00000432' {'Setswana'}
            '0000045b' {'Sinhala'}
            '0001045b' {'Sinhala - wij 9'}
            '0000041b' {'Slovak'}
            '0001041b' {'Slovak (QWERTY)'}
            '00000424' {'Slovenian'}
            '00100c00' {'Sora'}
            '0001042e' {'Sorbian Extended'}
            '0002042e' {'Sorbian Standard'}
            '0000042e' {'Sorbian Standard (Legacy)'}
            '0000040a' {'Spanish'}
            '0001040a' {'Spanish Variation'}
            '0000041d' {'Swedish'}
            '0000083b' {'Swedish with Sami'}
            '0000100c' {'Swiss French'}
            '00000807' {'Swiss German'}
            '0000045a' {'Syriac'}
            '0001045a' {'Syriac Phonetic'}
            '00030c00' {'Tai Le'}
            '00000428' {'Tajik'}
            '00000449' {'Tamil'}
            '00010444' {'Tatar'}
            '00000444' {'Tatar (Legacy)'}
            '0000044a' {'Telugu'}
            '0000041e' {'Thai Kedmanee'}
            '0002041e' {'Thai Kedmanee (non-ShiftLock)'}
            '0001041e' {'Thai Pattachote'}
            '0003041e' {'Thai Pattachote (non-ShiftLock)'}
            '00010451' {'Tibetan (PRC - Standard)'}
            '00000451' {'Tibetan (PRC - Legacy)'}
            '00050c00' {'Tifinagh (Basic)'}
            '00060c00' {'Tifinagh (Full)'}
            '0001041f' {'Turkish F'}
            '0000041f' {'Turkish Q'}
            '00000442' {'Turkmen'}
            '0x00010408' {'Uyghur'}
            '00000480' {'Uyghur (Legacy)'}
            '00000422' {'Ukrainian'}
            '00020422' {'Ukrainian (Enhanced)'}
            '00000809' {'United Kingdom'}
            '00000452' {'United Kingdom Extended'}
            '00010409' {'United States - Dvorak'}
            '00020409' {'United States - International'}
            '00030409' {'United States - Dvorak for left hand'}
            '00040409' {'United States - Dvorak for right hand'}
            '00000409' {'United States - English'}
            '00000420' {'Urdu'}
            '00010480' {'Uyghur'}
            '00000843' {'Uzbek Cyrillic'}
            '0000042a' {'Vietnamese'}
            '00000488' {'Wolof'}
            '0x00000485' {'Yakut'}
            '0000046a' {'Yoruba'}
            Deafult {'Invalid Code'}
        }
    }

    Return
}

Function Get-LengthCM {

    param ([float]$Inches)

    if ($Inches -ne ''){[math]::round($Inches * 2.54,2)}

    Return
}

Function Get-Level {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Primary'}
            4 {'Secondary'}
            5 {'Tertiary'}
            6 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Locale {
    param ([String] $Code)

    if ($Code -ne ''){

        Switch ($Code){
            '0436' {'Afrikaans - South Africa'}
            '041c' {'Albanian - Albania'}
            '0484' {'Alsatian - France'}
            '045e' {'Amharic - Ethiopia'}
            '1401' {'Arabic - Algeria'}
            '3c01' {'Arabic - Bahrain'}
            '0c01' {'Arabic - Egypt'}
            '0801' {'Arabic - Iraq'}
            '2c01' {'Arabic - Jordan'}
            '3401' {'Arabic - Kuwait'}
            '3001' {'Arabic - Lebanon'}
            '1001' {'Arabic - Libya'}
            '1801' {'Arabic - Morocco'}
            '2001' {'Arabic - Oman'}
            '4001' {'Arabic - Qatar'}
            '0401' {'Arabic - Saudi Arabia'}
            '2801' {'Arabic - Syria'}
            '1c01' {'Arabic - Tunisia'}
            '3801' {'Arabic - U.A.E.'}
            '2401' {'Arabic - Yemen'}
            '042b' {'Armenian - Armenia'}
            '044d' {'Assamese - India'}
            '082c' {'Azerbaijani - Azerbaijan (Cyrillic)'}
            '042c' {'Azerbaijani - Azerbaijan (Latin)'}
            '0845' {'Bangla (Bangladesh)'}
            '0445' {'Bangla - India (Bengali Script)'}
            '046d' {'Bashkir - Russia'}
            '042d' {'Basque - Basque'}
            '0423' {'Belarusian - Belarus'}
            '201a' {'Bosnian - Bosnia and Herzegovina (Cyrillic)'}
            '141a' {'Bosnian - Bosnia and Herzegovina (Latin)'}
            '047e' {'Breton - France'}
            '0402' {'Bulgarian - Bulgaria'}
            '0455' {'Burmese - Myanmar'}
            '0403' {'Catalan - Catalan'}
            '040c' {'Central Atlas Tamazight (Latin) - Algeria'}
            '085f' {'Central Atlas Tamazight (Latin) - Algeria'}
            '105f' {'Central Atlas Tamazight (Tifinagh) - Morocco'}
            '0492' {'Central Kurdish (Iraq)'}
            '045c' {'Cherokee (Cherokee, United States)'}
            '0804' {'Chinese - PRC'}
            '0404' {'Chinese - Taiwan'}
            '0483' {'Corsican - France'}
            '101a' {'Croatian - Bosnia and Herzegovina'}
            '041a' {'Croatian - Croatia'}
            '0405' {'Czech - Czech Republic'}
            '0406' {'Danish - Denmark'}
            '048c' {'Dari - Afghanistan'}
            '0465' {'Divehi - Maldives'}
            '0813' {'Dutch - Belgium'}
            '0413' {'Dutch - Netherlands'}
            '0c51' {'Dzongkha'}
            '0c09' {'English - Australia'}
            '2809' {'English - Belize'}
            '1009' {'English - Canada'}
            '2409' {'English - Caribbean'}
            '4009' {'English - India'}
            '1809' {'English - Ireland'}
            '2009' {'English - Jamaica'}
            '4409' {'English - Malaysia'}
            '1409' {'English - New Zealand'}
            '3409' {'English - Philippines'}
            '4809' {'English - Singapore'}
            '1c09' {'English - South Africa'}
            '2c09' {'English - Trinidad'}
            '0809' {'English - Great Britain'}
            '0409' {'English - United States'}
            '3009' {'English - Zimbabwe'}
            '0425' {'Estonian - Estonia'}
            '0438' {'Faroese - Faroe Islands'}
            '0464' {'Filipino - Philippines'}
            '040b' {'Finnish - Finland'}
            '080c' {'French - Belgium'}
            '0c0c' {'French - Canada'}
            '040c' {'French - France'}
            '140c' {'French - Luxembourg'}
            '180c' {'French - Monaco'}
            '100c' {'French - Switzerland'}
            '0462' {'Frisian - Netherlands'}
            '0867' {'Fulah (Latin, Senegal)'}
            '0456' {'Galician - Galician'}
            '0437' {'Georgian - Georgia'}
            '0c07' {'German - Austria'}
            '0407' {'German - Germany'}
            '1407' {'German - Liechtenstein'}
            '1007' {'German - Luxembourg'}
            '0807' {'German - Switzerland'}
            '0408' {'Greek - Greece'}
            '046f' {'Greenlandic - Greenland'}
            '0474' {'Guarani - Paraguay'}
            '0447' {'Gujarati - India (Gujarati Script)'}
            '0468' {'Hausa (Latin) - Nigeria'}
            '0475' {'Hawaiian - United States'}
            '040d' {'Hebrew - Israel'}
            '0439' {'Hindi - India'}
            '040e' {'Hungarian - Hungary'}
            '040f' {'Icelandic - Iceland'}
            '0470' {'Igbo - Nigeria'}
            '243b' {'Inari Sami - Finland'}
            '0421' {'Indonesian - Indonesia'}
            '085d' {'Inuktitut (Latin) - Canada'}
            '045d' {'Inuktitut (Syllabics) - Canada'}
            '083c' {'Irish - Ireland'}
            '0434' {'isiXhosa / Xhosa - South Africa'}
            '0435' {'isiZulu / Zulu - South Africa'}
            '0410' {'Italian - Italy'}
            '0810' {'Italian - Switzerland'}
            '0411' {'Japanese - Japan'}
            '0c00' {'Javanese (Latin) - Indonesia'}
            '044b' {'Kannada - India (Kannada Script)'}
            '043f' {'Kazakh - Kazakhstan'}
            '0453' {'Khmer - Cambodia'}
            '0486' {"K'iche - Guatemala"}
            '0487' {'Kinyarwanda - Rwanda'}
            '0457' {'Konkani - India'}
            '0412' {'Korean(Extended Wansung) - Korea'}
            '0440' {'Kyrgyz - Kyrgyzstan'}
            '0454' {'Lao - Lao PDR'}
            '0426' {'Latvian - Standard'}
            '0427' {'Lithuanian - Lithuania'}
            '082e' {'Lower Sorbian - Germany'}
            '103b' {'Lule Sami - Norway'}
            '143b' {'Lule Sami - Sweden'}
            '046e' {'Luxembourgish - Luxembourg'}
            '042f' {'Macedonian - F.Y.R.O.M'}
            '083e' {'Malay - Brunei'}
            '043e' {'Malay - Malaysia'}
            '044c' {'Malayalam - India (Malayalam Script)'}
            '043a' {'Maltese - Malta'}
            '0481' {'Maori - New Zealand'}
            '047a' {'Mapudungun - Chile'}
            '044e' {'Marathi - India'}
            '047c' {'Mohawk - Mohawk'}
            '0450' {'Mongolian (Cyrillic)'}
            '0c50' {'Mongolian (Mongolian) - Mongolia'}
            '0850' {'Mongolian (Mongolian– PRC – Standard)'}
            '0c00' {"N'ko – Guinea"}
            '0461' {'Nepali - Federal Democratic Republic of Nepal'}
            '0c3b' {'Northern Sami - Finland'}
            '043b' {'Northern Sami - Norway'}
            '083b' {'Northern Sami - Sweden'}
            '0414' {'Norwegian - Norway (Bokmål)'}
            '0814' {'Norwegian - Norway (Nynorsk)'}
            '0482' {'Occitan - France'}
            '0448' {'Odia - India (Odia Script)'}
            '0463' {'Pashto - Afghanistan'}
            '0429' {'Persian'}
            '0415' {'Polish - Poland'}
            '0416' {'Portuguese - Brazil'}
            '0816' {'Portuguese - Portugal'}
            '0446' {'Punjabi - India (Gurmukhi Script)'}
            '0846' {'Punjabi (Islamic Republic of Pakistan)'}
            '046b' {'Quechua - Bolivia'}
            '086b' {'Quechua - Ecuador'}
            '0c6b' {'Quechua - Peru'}
            '0418' {'Romanian - Romania'}
            '0417' {'Romansh - Switzerland'}
            '0419' {'Russian - Russia'}
            '0485' {'Sakha - Russia'}
            '044f' {'Sanskrit - India'}
            '0491' {'Scottish Gaelic - Great Britain'}
            '1c1a' {'Serbian - Bosnia and Herzegovina (Cyrillic)'}
            '181a' {'Serbian - Bosnia and Herzegovina (Latin)'}
            '301a' {'Serbian - Montenegro (Cyrillic)'}
            '2c1a' {'Serbian - Montenegro (Latin)'}
            '281a' {'Serbian - Serbia (Cyrillic)'}
            '241a' {'Serbian - Serbia (Latin)'}
            '0c1a' {'Serbian - Serbia and Montenegro (Former) (Cyrillic)'}
            '081a' {'Serbian - Serbia and Montenegro (Former) (Latin)'}
            '046c' {'Sesotho sa Leboa / Northern Sotho - South Africa'}
            '0832' {'Setswana / Tswana - Botswana'}
            '0432' {'Setswana / Tswana - South Africa'}
            '0c00' {'Shona – Zimbabwe'}
            '0859' {'Sindhi (Islamic Republic of Pakistan)'}
            '045b' {'Sinhala - Sri Lanka'}
            '203b' {'Skolt Sami - Finland'}
            '041b' {'Slovak - Slovakia'}
            '0424' {'Slovenian - Slovenia'}
            '183b' {'Southern Sami - Norway'}
            '1c3b' {'Southern Sami - Sweden'}
            '2c0a' {'Spanish - Argentina'}
            '200a' {'Spanish - Bolivarian Republic of Venezuela'}
            '400a' {'Spanish - Bolivia'}
            '340a' {'Spanish - Chile'}
            '240a' {'Spanish - Colombia'}
            '140a' {'Spanish - Costa Rica'}
            '1c0a' {'Spanish - Dominican Republic'}
            '300a' {'Spanish - Ecuador'}
            '440a' {'Spanish - El Salvador'}
            '100a' {'Spanish - Guatemala'}
            '480a' {'Spanish - Honduras'}
            '580a' {'Spanish - Latin America'}
            '080a' {'Spanish - Mexico'}
            '4c0a' {'Spanish - Nicaragua'}
            '180a' {'Spanish - Panama'}
            '3c0a' {'Spanish - Paraguay'}
            '280a' {'Spanish - Peru'}
            '500a' {'Spanish - Commonwealth of Puerto Rico'}
            '0c0a' {'Spanish - Spain (International Sort)'}
            '040a' {'Spanish - Spain (Traditional Sort)'}
            '540a' {'Spanish - United States'}
            '380a' {'Spanish - Uruguay'}
            '0c00' {'Standard Moroccan Tamazight - Morocco'}
            '0441' {'Swahili - Kenya'}
            '081d' {'Swedish - Finland'}
            '041d' {'Swedish - Sweden'}
            '045a' {'Syriac - Syria'}
            '0428' {'Tajik - Tajikistan'}
            '0449' {'Tamil - India'}
            '0849' {'Tamil - Sri Lanka'}
            '0444' {'Tatar – Russia (Standard)'}
            '044a' {'Telugu - India (Telugu Script)'}
            '041e' {'Thai - Thailand'}
            '0451' {'Tibetan - PRC'}
            '0473' {'Tigrinya (Ethiopia)'}
            '041f' {'Turkish - Turkey'}
            '0442' {'Turkmen - Turkmenistan'}
            '0422' {'Ukrainian - Ukraine'}
            '042e' {'Upper Sorbian - Germany'}
            '0820' {'Urdu – India'}
            '0420' {'Urdu (Islamic Republic of Pakistan)'}
            '0480' {'Uyghur - PRC'}
            '0843' {'Uzbek - Uzbekistan (Cyrillic)'}
            '0443' {'Uzbek - Uzbekistan (Latin)'}
            '0803' {'Valencian - Valencia'}
            '042a' {'Vietnamese - Vietnam'}
            '0452' {'Welsh - Great Britain'}
            '0488' {'Wolof - Senegal'}
            '0478' {'Yi - PRC'}
            '046a' {'Yoruba - Nigeria'}
            Deafult {'Invalid Code'}
        }
    }

    Return
}

Function Get-Location {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Internal'}
            1 {'External'}
            2 {'Reserved'}
            3 {'Unknown'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-LogicalDiskMediaType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Format is unknown'}
            1 {'5 1/4-Inch Floppy Disk - 1.2 MB - 512 bytes/sector'}
            2 {'3 1/2-Inch Floppy Disk - 1.44 MB - 512 bytes/sector'}
            3 {'3 1/2-Inch Floppy Disk - 2.88 MB - 512 bytes/sector'}
            4 {'3 1/2-Inch Floppy Disk - 20.8 MB - 512 bytes/sector'}
            5 {'3 1/2-Inch Floppy Disk - 720 KB - 512 bytes/sector'}
            6 {'5 1/4-Inch Floppy Disk - 360 KB - 512 bytes/sector'}
            7 {'5 1/4-Inch Floppy Disk - 320 KB - 512 bytes/sector'}
            8 {'5 1/4-Inch Floppy Disk - 320 KB - 1024 bytes/sector'}
            9 {'5 1/4-Inch Floppy Disk - 180 KB - 512 bytes/sector'}
            10 {'5 1/4-Inch Floppy Disk - 160 KB - 512 bytes/sector'}
            11 {'Removable media other than floppy'}
            12 {'Fixed hard disk media'}
            13 {'3 1/2-Inch Floppy Disk - 120 MB - 512 bytes/sector'}
            14 {'3 1/2-Inch Floppy Disk - 640 KB - 512 bytes/sector'}
            15 {'5 1/4-Inch Floppy Disk - 640 KB - 512 bytes/sector'}
            16 {'5 1/4-Inch Floppy Disk - 720 KB - 512 bytes/sector'}
            17 {'3 1/2-Inch Floppy Disk - 1.2 MB - 512 bytes/sector'}
            18 {'3 1/2-Inch Floppy Disk - 1.23 MB - 1024 bytes/sector'}
            19 {'5 1/4-Inch Floppy Disk - 1.23 MB - 1024 bytes/sector'}
            20 {'3 1/2-Inch Floppy Disk - 128 MB - 512 bytes/sector'}
            21 {'3 1/2-Inch Floppy Disk - 230 MB - 512 bytes/sector'}
            22 {'8-Inch Floppy Disk - 256 KB - 128 bytes/sector'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-MarkingTechnology {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Electrophotographic LED'}
            4 {'Electrophotographic Laser'}
            5 {'Electrophotographic Other'}
            6 {'Impact Moving Head Dot Matrix 9pin'}
            7 {'Impact Moving Head Dot Matrix 24pin'}
            8 {'Impact Moving Head Dot Matrix Other'}
            9 {'Impact Moving Head Fully Formed'}
            10 {'Impact Band'}
            11 {'Impact Other'}
            12 {'Inkjet Aqueous'}
            13 {'Inkjet Solid'}
            14 {'Inkjet Other'}
            15 {'Pen'}
            16 {'Thermal Transfer'}
            17 {'Thermal Sensitive'}
            18 {'Thermal Diffusion'}
            19 {'Thermal Other'}
            20 {'Electroerosion'}
            21 {'Electrostatic'}
            22 {'Photographic Microfiche'}
            23 {'Photographic Imagesetter'}
            24 {'Photographic Other'}
            25 {'Ion Deposition'}
            26 {'eBeam'}
            27 {'Typesetter'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-MemoryErrorCorrection {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'None'}
            4 {'Parity'}
            5 {'Single-bit ECC'}
            6 {'Multi-bit ECC'}
            7 {'CRC'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-MemoryType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'DRAM'}
            3 {'Synchronous DRAM'}
            4 {'Cache DRAM'}
            5 {'EDO'}
            6 {'EDRAM'}
            7 {'VRAM'}
            8 {'SRAM'}
            9 {'RAM'}
            10 {'ROM'}
            11 {'Flash'}
            12 {'EEPROM'}
            13 {'FEPROM'}
            14 {'EPROM'}
            15 {'CDRAM'}
            16 {'3DRAM'}
            17 {'SDRAM'}
            18 {'SGRAM'}
            19 {'RDRAM'}
            20 {'DDR'}
            21 {'DDR2'}
            22 {'BRAM'}
            23 {'FB-DIMM'}
            24 {'DDR3'}
            25 {'FBD2'}
            26 {'DDR4'}
            27 {'LPDDR'}
            28 {'LPDDR2'}
            29 {'LPDDR3'}
            30 {'LPDDR4'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-NetConnectionStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Disconnected'}
            1 {'Connecting'}
            2 {'Connected'}
            3 {'Disconnecting'}
            4 {'Hardware Not Present'}
            5 {'Hardware Disabled'}
            6 {'Hardware Malfunction'}
            7 {'Media Disconnected'}
            8 {'Authenticating'}
            9 {'Authentication Succeeded'}
            10 {'Authentication Failed'}
            11 {'Invalid Address'}
            12 {'Credentials Required'}
            {13..65535 -contains $Code} {'Other'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-OperatingSystemSKU {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Undefined'}
            1 {'Ultimate Edition'}
            2 {'Home Basic Edition'}
            3 {'Home Premium Edition'}
            4 {'Enterprise Edition'}
            6 {'Business Edition'}
            7 {'Windows Server Standard Edition (Desktop Experience installation)'}
            8 {'Windows Server Datacenter Edition (Desktop Experience installation)'}
            9 {'Small Business Server Edition'}
            10 {'Enterprise Server Edition'}
            11 {'Starter Edition'}
            12 {'Datacenter Server Core Edition'}
            13 {'Standard Server Core Edition'}
            14 {'Enterprise Server Core Edition'}
            17 {'Web Server Edition'}
            19 {'Home Server Edition'}
            20 {'Storage Express Server Edition'}
            21 {'Windows Storage Server Standard Edition (Desktop Experience installation)'}
            22 {'Windows Storage Server Workgroup Edition (Desktop Experience installation)'}
            23 {'Storage Enterprise Server Edition'}
            24 {'Server For Small Business Edition'}
            25 {'Small Business Server Premium Edition'}
            27 {'Windows Enterprise Edition'}
            28 {'Windows Ultimate Edition'}
            29 {'Windows Server Web Server Edition (Server Core installation)'}
            36 {'Windows Server Standard Edition without Hyper-V'}
            37 {'Windows Server Datacenter Edition without Hyper-V (full installation)'}
            38 {'Windows Server Enterprise Edition without Hyper-V (full installation)'}
            39 {'Windows Server Datacenter Edition without Hyper-V (Server Core installation)'}
            40 {'Windows Server Standard Edition without Hyper-V (Server Core installation)'}
            41 {'Windows Server Enterprise Edition without Hyper-V (Server Core installation)'}
            42 {'Microsoft Hyper-V Server'}
            43 {'Storage Server Express Edition (Server Core installation)'}
            44 {'Storage Server Standard Edition (Server Core installation)'}
            45 {'Storage Server Workgroup Edition (Server Core installation)'}
            46 {'Storage Server Enterprise Edition (Server Core installation)'}
            50 {'Windows Server Essentials (Desktop Experience installation)'}
            63 {'Small Business Server Premium (Server Core installation)'}
            64 {'Windows Compute Cluster Server without Hyper-V'}
            97 {'Windows RT'}
            101 {'Windows Home'}
            103 {'Windows Professional with Media Center'}
            104 {'Windows Mobile'}
            123 {'Windows IoT (Internet of Things) Core'}
            143 {'Windows Server Datacenter Edition (Nano Server installation)'}
            144 {'Windows Server Standard Edition (Nano Server installation)'}
            147 {'Windows Server Datacenter Edition (Server Core installation)'}
            148 {'Windows Server Standard Edition (Server Core installation)'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-Orientation {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Portrait'}
            2 {'Landscape'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-OSLanguage {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1025 {'Arabic (Saudi Arabia)'}
            1026 {'Bulgarian (Bulgaria)'}
            3076 {'Chinese (Hong Kong SAR)'}
            2052 {'Chinese (PRC)'}
            1028 {'Chinese (Taiwan)'}
            1050 {'Croatian (Croatia)'}
            1029 {'Czech (Czech Republic)'}
            1030 {'Danish (Denmark)'}
            1043 {'Dutch (Netherlands)'}
            1033 {'English (United States)'}
            2057 {'English (United Kingdom)'}
            1061 {'Estonian (Estonia)'}
            1035 {'Finnish (Finland)'}
            3084 {'French (Canada)'}
            1036 {'French (France)'}
            1031 {'German (Germany)'}
            1032 {'Greek (Greece)'}
            1037 {'Hebrew (Israel)'}
            1038 {'Hungarian (Hungary)'}
            1040 {'Italian (Italy)'}
            1041 {'Japanese (Japan)'}
            1042 {'Korean (Korea)'}
            1062 {'Latvian (Latvia)'}
            1063 {'Lithuanian (Lithuania)'}
            1044 {'Norwegian, Bokmål (Norway)'}
            1045 {'Polish (Poland)'}
            1046 {'Portuguese (Brazil)'}
            2070 {'Portuguese (Portugal)'}
            1048 {'Romanian (Romania)'}
            1049 {'Russian (Russia)'}
            2074 {'Serbian (Latin, Serbia)'}
            9242 {'Serbian (Latin, Serbia)'}
            1051 {'Slovak (Slovakia)'}
            1060 {'Slovenian (Slovenia)'}
            2058 {'Spanish (Mexico)'}
            3082 {'Spanish (Spain)'}
            1053 {'Swedish (Sweden)'}
            1054 {'Thai (Thailand)'}
            1055 {'Turkish (Turkey)'}
            1058 {'Ukrainian (Ukraine)'}
            1078 {'Afrikaans (South Africa)'}
            1052 {'Albanian (Albania)'}
            1118 {'Amharic (Ethiopia)'}
            1067 {'Armenian (Armenia)'}
            1101 {'Assamese (India)'}
            1068 {'Azerbaijan'}
            2117 {'Bangla (Bangladesh)'}
            1069 {'Basque (Basque)'}
            1059 {'Belarusian'}
            1093 {'Bangla (India)'}
            5146 {'Bosnian (Latin)'}
            1027 {'Catalan'}
            1170 {'Central Kurdish'}
            1116 {'Cherokee'}
            1164 {'Dari'}
            1124 {'Filipino'}
            1110 {'Galician'}
            1079 {'Georgian (Georgia)'}
            1095 {'Gujarati (India)'}
            1128 {'Hausa (Latin, Nigeria)'}
            1081 {'Hindi (India)'}
            1039 {'Icelandic (Iceland)'}
            1136 {'Igbo (Nigeria)'}
            1057 {'Indonesian (Indonesia)'}
            2141 {'Inuktitut (Latin, Canada)'}
            2108 {'Irish (Ireland)'}
            1076 {'isiXhosa (South Africa)'}
            1077 {'isiZulu (South Africa)'}
            1099 {'Kannada (India)'}
            1087 {'Kazakh (Kazakhstan)'}
            1107 {'Khmer (Cambodia)'}
            1158 {"K'iche' (Guatemala)"}
            1159 {'Kinyarwanda'}
            1089 {'Kiswahili (Kenya)'}
            1111 {'Konkani (India)'}
            1088 {'Kyrgyz (Kyrgyzstan)'}
            1108 {'Lao (Laos)'}
            1134 {'Luxembourgish (Luxembourg)'}
            1071 {'Macedonian (FYROM)'}
            1086 {'Malay (Malaysia, Brunei, and Singapore)'}
            1100 {'Malayalam (India)'}
            1082 {'Maltese (Malta)'}
            1153 {'Maori (New Zealand)'}
            1102 {'Marathi (India)'}
            1104 {'Mongolian (Cyrillic)'}
            1121 {'Nepali (Federal Democratic Republic of Nepal)'}
            2068 {'Norwegian, Nynorsk (Norway)'}
            1096 {'Odia (India)'}
            1065 {'Persian'}
            1094 {'Punjabi (India)'}
            2118 {'Punjabi (Arabic)'}
            3179 {'Quechua (Peru)'}
            1169 {'Scottish Gaelic'}
            7194 {'Serbian (Cyrillic, Bosnia and Herzegovina)'}
            3098 {'Serbian (Cyrillic, Serbia)'}
            10266 {'Serbian (Cyrillic, Serbia)'}
            1132 {'Sesotho sa Leboa (South Africa)'}
            1074 {'Setswana (South Africa)'}
            2137 {'Sindhi (Arabic)'}
            1115 {'Sinhala (Sri Lanka)'}
            1064 {'Tajik (Cyrillic)'}
            1097 {'Tamil (India)'}
            1092 {'Tatar (Russia)'}
            1098 {'Telugu (India)'}
            1139 {'Tigrinya'}
            1090 {'Turkmen'}
            1056 {'Urdu'}
            1152 {'Uyghur'}
            1091 {'Uzbek (Latin)'}
            2051 {'Valencian'}
            1066 {'Vietnamese'}
            1106 {'Welsh (Great Britain)'}
            1160 {'Wolof'}
            1130 {'Yoruba (Nigeria)'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-OSProductSuite {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Microsoft Small Business Server was once installed, but may have been upgraded to another version of Windows.'}
            2 {'Windows Server 2008 Enterprise is installed.'}
            4 {'Windows BackOffice components are installed.'}
            8 {'Communication Server is installed.'}
            16 {'Terminal Services is installed.'}
            32 {'Microsoft Small Business Server is installed with the restrictive client license.'}
            64 {'Windows Embedded is installed.'}
            128 {'A Datacenter edition is installed.'}
            256 {'Terminal Services is installed, but only one interactive session is supported.'}
            512 {'Windows Home Edition is installed.'}
            1024 {'Web Server Edition is installed.'}
            8192 {'Storage Server Edition is installed.'}
            16384 {'Compute Cluster Edition is installed.'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-OSType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'MACOS'}
            3 {'ATTUNIX'}
            4 {'DGUX'}
            5 {'DECNT'}
            6 {'Digital Unix'}
            7 {'OpenVMS'}
            8 {'HPUX'}
            9 {'AIX'}
            10 {'MVS'}
            11 {'OS400'}
            12 {'OS/2'}
            13 {'JavaVM'}
            14 {'MSDOS'}
            15 {'WIN3x'}
            16 {'WIN95'}
            17 {'WIN98'}
            18 {'WINNT'}
            19 {'WINCE'}
            20 {'NCR3000'}
            21 {'NetWare'}
            22 {'OSF'}
            23 {'DC/OS'}
            24 {'Reliant UNIX'}
            25 {'SCO UnixWare'}
            26 {'SCO OpenServer'}
            27 {'Sequent'}
            28 {'IRIX'}
            29 {'Solaris'}
            30 {'SunOS'}
            31 {'U6000'}
            32 {'ASERIES'}
            33 {'TandemNSK'}
            34 {'TandemNT'}
            35 {'BS2000'}
            36 {'LINUX'}
            37 {'Lynx'}
            38 {'XENIX'}
            39 {'VM/ESA'}
            40 {'Interactive UNIX'}
            41 {'BSDUNIX'}
            42 {'FreeBSD'}
            43 {'NetBSD'}
            44 {'GNU Hurd'}
            45 {'OS9'}
            46 {'MACH Kernel'}
            47 {'Inferno'}
            48 {'QNX'}
            49 {'EPOC'}
            50 {'IxWorks'}
            51 {'VxWorks'}
            52 {'MiNT'}
            53 {'BeOS'}
            54 {'HP MPE'}
            55 {'NextStep'}
            56 {'PalmPilot'}
            57 {'Rhapsody'}
            58 {'Windows 2000'}
            59 {'Dedicated'}
            60 {'OS/390'}
            61 {'VSE'}
            62 {'TPF'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PaperSizesSupported {

    param ([uint16[]]$Code)

    if ($Code -ne ''){

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
            default {'Invalid Code'}
        }
    }

    Return
}

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

Function Get-PhysicalMemoryArrayUse {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Reserved'}
            1 {'Other'}
            2 {'Unknown'}
            3 {'System memory'}
            4 {'Video memory'}
            5 {'Flash memory'}
            6 {'Non-volatile RAM'}
            7 {'Cache memory'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PointingType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Mouse'}
            4 {'Track Ball'}
            5 {'Track Point'}
            6 {'Glide Point'}
            7 {'Touch Pad'}
            8 {'Touch Screen'}
            9 {'Optical Sensor'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PowerManagementCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Not Supported'}
            2 {'Disabled'}
            3 {'Enabled'}
            4 {'Power Saving Modes Entered Automatically'}
            5 {'Power State Settable'}
            6 {'Power Cycling Supported'}
            7 {'Timed Power On Supported'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PowerManagementCapabilitiesCode {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Not Supported'}
            2 {'Disabled'}
            3 {'Enabled'}
            4 {'Power Saving Modes Entered Automatically'}
            5 {'Power State Settable'}
            6 {'Power Cycling Supported'}
            7 {'Timed Power On Supported'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PrinterMediaType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Standard'}
            2 {'Transparency'}
            3 {'Glossy'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PrinterState {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Idle'}
            1 {'Paused'}
            2 {'Error'}
            3 {'Pending Deletion'}
            4 {'Paper Jam'}
            5 {'Paper Out'}
            6 {'Manual Feed'}
            7 {'Paper Problem'}
            8 {'Offline'}
            9 {'I/O Active'}
            10 {'Busy'}
            11 {'Printing'}
            12 {'Output Bin Full'}
            13 {'Not Available'}
            14 {'Waiting'}
            15 {'Processing'}
            16 {'Initialization'}
            17 {'Warming Up'}
            18 {'Toner Low'}
            19 {'No Toner'}
            20 {'Page Punt'}
            21 {'User Intervention Required'}
            22 {'Out of Memory'}
            23 {'Door Open'}
            24 {'Server_Unknown'}
            25 {'Power Save'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PrinterStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Idle'}
            4 {'Printing'}
            5 {'Warmup'}
            6 {'Stopped Printing'}
            7 {'Offline'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-PrintQuality {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            -1 {'Draft'}
            -2 {'Low'}
            -3 {'Medium'}
            -4 {'High'}
            default {"$Code"}
        }
    }

    Return
}

Function Get-ProcessorType {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Central Processor'}
            4 {'Math Processor'}
            5 {'DSP Processor'}
            6 {'Video Processor'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ProductType {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Work Station'}
            2 {'Domain Controller'}
            3 {'Server'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ProtectionManagement {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Unprotected'}
            4 {'Protected'}
            5 {'Protected through SCC (SCSI-3 Controller Command)'}
            6 {'Protected through SCC-2 (SCSI-3 Controller Command)'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ProtocolSupported {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'EISA'}
            4 {'ISA'}
            5 {'PCI'}
            6 {'ATA/ATAPI'}
            7 {'Flexible Diskette'}
            8 {'1496'}
            9 {'SCSI Parallel Interface'}
            10 {'SCSI Fibre Channel Protocol'}
            11 {'SCSI Serial Bus Protocol'}
            12 {'SCSI Serial Bus Protocol-2 (1394)'}
            13 {'SCSI Serial Storage Architecture'}
            14 {'VESA'}
            15 {'PCMCIA'}
            16 {'Universal Serial Bus'}
            17 {'Parallel Protocol'}
            18 {'ESCON'}
            19 {'Diagnostic'}
            20 {'I2C'}
            21 {'Power'}
            22 {'HIPPI'}
            23 {'MultiBus'}
            24 {'VME'}
            25 {'IPI'}
            26 {'IEEE-488'}
            27 {'RS232'}
            28 {'IEEE 802.3 10BASE5'}
            29 {'IEEE 802.3 10BASE2'}
            30 {'IEEE 802.3 1BASE5'}
            31 {'IEEE 802.3 10BROAD36'}
            32 {'IEEE 802.3 100BASEVG'}
            33 {'IEEE 802.5 Token-Ring'}
            34 {'ANSI X3T9.5 FDDI'}
            35 {'MCA'}
            36 {'ESDI'}
            37 {'IDE'}
            38 {'CMD'}
            39 {'ST506'}
            40 {'DSSI'}
            41 {'QIC2'}
            42 {'Enhanced ATA/IDE'}
            43 {'AGP'}
            44 {'TWIRP (two-way infrared)'}
            45 {'FIR (fast infrared)'}
            46 {'SIR (serial infrared)'}
            47 {'IrBus'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ReadPolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Read'}
            4 {'Read-Ahead'}
            5 {'Read and Read-Ahead'}
            6 {'Determination Per I/O'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ReplacementPolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Least Recently Used (LRU)'}
            4 {'First In First Out (FIFO)'}
            5 {'Last In First Out (LIFO)'}
            6 {'Least Frequently Used (LFU)'}
            7 {'Most Frequently Used (MFU)'}
            8 {'Data Dependent Multiple Algorithms'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ReportSetMarksStatus {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Disabled'}
            1 {'Enabled'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-SecurityBreach {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'No Breach'}
            4 {'Breach Attempted'}
            5 {'Breach Successful'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-SecurityStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'None'}
            4 {'External interface locked out'}
            5 {'External interface enabled'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-ServicePhilosophy {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'Service From Top'}
            3 {'Service From Front'}
            4 {'Service From Back'}
            5 {'Service From Side'}
            6 {'Sliding Trays'}
            7 {'Removable Sides'}
            8 {'Moveable'}
            default {'Invalid Code'}
        }
    }
    Return
}

Function Get-SizeGB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1GB,2)}

    Return
}

Function Get-SizeKB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1KB,2)}

    Return
}

Function Get-SizeMB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1MB,2)}

    Return
}

Function Get-SizePB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1PB,2)}

    Return
}

Function Get-SizeTB {

    param ([uint64]$Size)

    if ($Size -ne ''){[math]::round($Size / 1TB,2)}

    Return
}

Function Get-SoftwareElementState {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Deployable'}
            1 {'Installable'}
            2 {'Executable'}
            3 {'Running'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-SpeedGbpsConversion {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000000000,2)}

    Return
}

Function Get-SpeedKbpsConversion {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000,2)}

    Return
}

Function Get-SpeedMbpsConversion {

    param ([uint64]$Speed)

    if ($Speed -ne ''){[math]::round($Speed / 1000000,2)}

    Return
}

Function Get-StatusInfo {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Enabled'}
            4 {'Disabled'}
            5 {'Not Applicable'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-SupportedSRAM {

    param ([uint16[]]$Code)

    if ($Code.Count -ne 0){

        switch ($Code){
            0 {'Other'}
            1 {'Unknown'}
            2 {'Non-Burst'}
            3 {'Burst'}
            4 {'Pipeline Burst'}
            5 {'Synchronous'}
            6 {'Asynchronous'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-TargetOperatingSystem {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'MACOS'}
            3 {'ATTUNIX'}
            4 {'DGUX'}
            5 {'DECNT'}
            6 {'Digital Unix'}
            7 {'OpenVMS'}
            8 {'HPUX'}
            9 {'AIX'}
            10 {'MVS'}
            11 {'OS400'}
            12 {'OS/2'}
            13 {'JavaVM'}
            14 {'MSDOS'}
            15 {'WIN3x'}
            16 {'WIN95'}
            17 {'WIN98'}
            18 {'WINNT'}
            19 {'WINCE'}
            20 {'NCR3000'}
            21 {'NetWare'}
            22 {'OSF'}
            23 {'DC/OS'}
            24 {'Reliant UNIX'}
            25 {'SCO UnixWare'}
            26 {'SCO OpenServer'}
            27 {'Sequent'}
            28 {'IRIX'}
            29 {'Solaris'}
            30 {'SunOS'}
            31 {'U6000'}
            32 {'ASERIES'}
            33 {'TandemNSK'}
            34 {'TandemNT'}
            35 {'BS2000'}
            36 {'LINUX'}
            37 {'Lynx'}
            38 {'XENIX'}
            39 {'VM/ESA'}
            40 {'Interactive UNIX'}
            41 {'BSDUNIX'}
            42 {'FreeBSD'}
            43 {'NetBSD'}
            44 {'GNU Hurd'}
            45 {'OS9'}
            46 {'MACH Kernel'}
            47 {'Inferno'}
            48 {'QNX'}
            49 {'EPOC'}
            50 {'IxWorks'}
            51 {'VxWorks'}
            52 {'MiNT'}
            53 {'BeOS'}
            54 {'HP MPE'}
            55 {'NextStep'}
            56 {'PalmPilot'}
            57 {'Rhapsody'}
            58 {'Windows 2000'}
            59 {'Dedicated'}
            60 {'VSE'}
            61 {'TPF (61)'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-TcpipNetbiosOption {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'EnableNetbiosViaDhcp'}
            1 {'EnableNetbios'}
            2 {'DisableNetbios'}
            default {'Invalid Code'}
        }
    }
    Return
}

Function Get-TTOption {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Bitmap - Prints TrueType fonts as graphics'}
            2 {'Download - Downloads TrueType fonts as soft fonts'}
            3 {'Substitute - Substitutes device fonts for TrueType fonts'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-TypeDetail {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            '1' {'Reserved'}
            '2' {'Other'}
            '4' {'Unknown'}
            '8' {'Fast-paged'}
            '16' {'Static column'}
            '32' {'Pseudo-static'}
            '64' {'RAMBUS'}
            '128' {'Synchronous'}
            '256' {'CMOS'}
            '512' {'EDO'}
            '1024' {'Window DRAM'}
            '2048' {'Cache DRAM'}
            '4096' {'Non-volatile'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-UpgradeMethod {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            '1' {'Other'}
            '2' {'Unknown'}
            '3' {'Daughter Board'}
            '4' {'ZIF Socket'}
            '5' {'Replacement/Piggy Back'}
            '6' {'None'}
            '7' {'LIF Socket'}
            '8' {'Slot 1'}
            '9' {'Slot 2'}
            '10' {'370 Pin Socket'}
            '11' {'Slot A'}
            '12' {'Slot M'}
            '13' {'Socket 423'}
            '14' {'Socket A (Socket 462)'}
            '15' {'Socket 478'}
            '16' {'Socket 754'}
            '17' {'Socket 940'}
            '18' {'Socket 939'}
            '19' {'Socket mPGA604'}
            '20' {'Socket LGA771'}
            '21' {'Socket LGA775'}
            '22' {'Socket S1'}
            '23' {'Socket AM2'}
            '24' {'Socket F (1207)'}
            '25' {'Socket LGA1366'}
            '26' {'Socket G34'}
            '27' {'Socket AM3'}
            '28' {'Socket C32'}
            '29' {'Socket LGA1156'}
            '30' {'Socket LGA1567'}
            '31' {'Socket PGA988A'}
            '32' {'Socket BGA1288'}
            '33' {'rPGA988B'}
            '34' {'BGA1023'}
            '35' {'BGA1224'}
            '36' {'LGA1155'}
            '37' {'LGA1356'}
            '38' {'LGA2011'}
            '39' {'Socket FS1'}
            '40' {'Socket FS2'}
            '41' {'Socket FM1'}
            '42' {'Socket FM2'}
            '43' {'Socket LGA2011-3'}
            '44' {'Socket LGA1356-3'}
            '45' {'Socket LGA1150'}
            '46' {'Socket BGA1168'}
            default {'Invalid Code'}
        }
    }

    Return
}

Function Get-VideoArchitecture {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'CGA'}
            4 {'EGA'}
            5 {'VGA'}
            6 {'SVGA'}
            7 {'MDA'}
            8 {'HGC'}
            9 {'MCGA'}
            10 {'8514A'}
            11 {'XGA'}
            12 {'Linear Frame Buffer'}
            160 {'PC-98'}
            default {'Invalid Code'}
        }
    }

    Return
}

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

Function Get-VoltageCap {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'5'}
            2 {'3.3'}
            4 {'2.9'}
            default {'Invalid Code'}
        }
    }
    Return
}

Function Get-WeightGram {

    param ([float]$Pounds)

    if ($Pounds -ne ''){[math]::round($Pounds * 453.592,2)}

    Return
}

Function Get-WeightKg {

    param ([float]$Pounds)

    if ($Pounds -ne ''){[math]::round($Pounds / 2.205,2)}

    Return
}

Function Get-WritePolicy {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Write Back'}
            4 {'Write Through'}
            5 {'Varies with Address'}
            6 {'Determination Per I/O'}
            default {'Invalid Code'}
        }
    }
    Return
}