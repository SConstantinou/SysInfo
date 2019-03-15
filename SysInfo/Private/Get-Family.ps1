Function Get-Family 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Family -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      1 
      {
        'Other'
      }
      2 
      {
        'Unknown'
      }
      3 
      {
        '8086'
      }
      4 
      {
        '80286'
      }
      5 
      {
        '80386 - Intel386(TM) Processor'
      }
      6 
      {
        '80486 - Intel486(TM) Processor'
      }
      7 
      {
        '8087'
      }
      8 
      {
        '80287'
      }
      9 
      {
        '80387'
      }
      10 
      {
        '80487'
      }
      11 
      {
        'Pentium(R) brand'
      }
      12 
      {
        'Pentium(R) Pro'
      }
      13 
      {
        'Pentium(R) II'
      }
      14 
      {
        'Pentium(R) processor with MMX(TM) technology'
      }
      15 
      {
        'Celeron(TM)'
      }
      16 
      {
        'Pentium(R) II Xeon(TM)'
      }
      17 
      {
        'Pentium(R) III'
      }
      18 
      {
        'M1 Family'
      }
      19 
      {
        'M2 Family'
      }
      20 
      {
        'Intel(R) Celeron(R) M processor'
      }
      21 
      {
        'Intel(R) Pentium(R) 4 HT processor'
      }
      24 
      {
        'K5 Family - AMD Duron(TM) Processor Family'
      }
      25 
      {
        'K6 Family'
      }
      26 
      {
        'K6-2'
      }
      27 
      {
        'K6-3'
      }
      28 
      {
        'AMD Athlon(TM) Processor Family'
      }
      29 
      {
        'AMD(R) Duron(TM) Processor'
      }
      30 
      {
        'AMD29000 Family'
      }
      31 
      {
        'K6-2+'
      }
      32 
      {
        'Power PC Family'
      }
      33 
      {
        'Power PC 601'
      }
      34 
      {
        'Power PC 603'
      }
      35 
      {
        'Power PC 603+'
      }
      36 
      {
        'Power PC 604'
      }
      37 
      {
        'Power PC 620'
      }
      38 
      {
        'Power PC X704'
      }
      39 
      {
        'Power PC 750'
      }
      40 
      {
        'Intel(R) Core(TM) Duo Processor'
      }
      41 
      {
        'Intel(R) Core(TM) Duo Mobile Processor'
      }
      42 
      {
        'Intel(R) Core(TM) Solo Mobile Processor'
      }
      43 
      {
        'Intel(R) Atom(TM) Processor'
      }
      48 
      {
        'Alpha Family'
      }
      49 
      {
        'Alpha 21064'
      }
      50 
      {
        'Alpha 21066'
      }
      51 
      {
        'Alpha 21164'
      }
      52 
      {
        'Alpha 21164PC'
      }
      53 
      {
        'Alpha 21164a'
      }
      54 
      {
        'Alpha 21264'
      }
      55 
      {
        'Alpha 21364'
      }
      56 
      {
        'AMD Turion(TM) II Ultra Dual-Core Mobile M Processor Family'
      }
      57 
      {
        'AMD Turion(TM) II Dual-Core Mobile M Processor Family'
      }
      58 
      {
        'AMD Athlon(TM) II Dual-Core Mobile M Processor Family'
      }
      59 
      {
        'AMD Opteron(TM) 6100 Series Processor'
      }
      60 
      {
        'AMD Opteron(TM) 4100 Series Processor'
      }
      61 
      {
        'AMD Opteron(TM) 6200 Series Processor'
      }
      62 
      {
        'AMD Opteron(TM) 4200 Series Processor'
      }
      63 
      {
        'AMD FX(TM) Series Processor'
      }
      64 
      {
        'MIPS Family'
      }
      65 
      {
        'MIPS R4000'
      }
      66 
      {
        'MIPS R4200'
      }
      67 
      {
        'MIPS R4400'
      }
      68 
      {
        'MIPS R4600'
      }
      69 
      {
        'MIPS R10000'
      }
      70 
      {
        'AMD C-Series Processor'
      }
      71 
      {
        'AMD E-Series Processor'
      }
      72 
      {
        'AMD A-Series Processor'
      }
      73 
      {
        'AMD G-Series Processor'
      }
      74 
      {
        'AMD Z-Series Processor'
      }
      80 
      {
        'SPARC Family'
      }
      81 
      {
        'SuperSPARC'
      }
      82 
      {
        'microSPARC II'
      }
      83 
      {
        'microSPARC IIep'
      }
      84 
      {
        'UltraSPARC'
      }
      85 
      {
        'UltraSPARC II'
      }
      86 
      {
        'UltraSPARC IIi'
      }
      87 
      {
        'UltraSPARC III'
      }
      88 
      {
        'UltraSPARC IIIi'
      }
      96 
      {
        '68040'
      }
      97 
      {
        '68xxx Family'
      }
      98 
      {
        '68000'
      }
      99 
      {
        '68010'
      }
      100 
      {
        '68020'
      }
      101 
      {
        '68030'
      }
      112 
      {
        'Hobbit Family'
      }
      120 
      {
        'Crusoe(TM) TM5000 Family'
      }
      121 
      {
        'Crusoe(TM) TM3000 Family'
      }
      122 
      {
        'Efficeon(TM) TM8000 Family'
      }
      128 
      {
        'Weitek'
      }
      130 
      {
        'Itanium(TM) Processor'
      }
      131 
      {
        'AMD Athlon(TM) 64 Processor Family'
      }
      132 
      {
        'AMD Opteron(TM) Family'
      }
      133 
      {
        'AMD Sempron(TM) Processor Family'
      }
      134 
      {
        'AMD Turion(TM) 64 Mobile Technology'
      }
      135 
      {
        'Dual-Core AMD Opteron(TM) Processor Family'
      }
      136 
      {
        'AMD Athlon(TM) 64 X2 Dual-Core Processor Family'
      }
      137 
      {
        'AMD Turion(TM) 64 X2 Mobile Technology'
      }
      138 
      {
        'Quad-Core AMD Opteron(TM) Processor Family'
      }
      139 
      {
        'Third-Generation AMD Opteron(TM) Processor Family'
      }
      140 
      {
        'AMD Phenom(TM) FX Quad-Core Processor Family'
      }
      141 
      {
        'AMD Phenom(TM) X4 Quad-Core Processor Family'
      }
      142 
      {
        'AMD Phenom(TM) X2 Dual-Core Processor Family'
      }
      143 
      {
        'AMD Athlon(TM) X2 Dual-Core Processor Family'
      }
      144 
      {
        'PA-RISC Family'
      }
      145 
      {
        'PA-RISC 8500'
      }
      146 
      {
        'PA-RISC 8000'
      }
      147 
      {
        'PA-RISC 7300LC'
      }
      148 
      {
        'PA-RISC 7200'
      }
      149 
      {
        'PA-RISC 7100LC'
      }
      150 
      {
        'PA-RISC 7100'
      }
      160 
      {
        'V30 Family'
      }
      161 
      {
        'Quad-Core Intel(R) Xeon(R) processor 3200 Series'
      }
      162 
      {
        'Dual-Core Intel(R) Xeon(R) processor 3000 Series'
      }
      163 
      {
        'Quad-Core Intel(R) Xeon(R) processor 5300 Series'
      }
      164 
      {
        'Dual-Core Intel(R) Xeon(R) processor 5100 Series'
      }
      165 
      {
        'Dual-Core Intel(R) Xeon(R) processor 5000 Series'
      }
      166 
      {
        'Dual-Core Intel(R) Xeon(R) processor LV'
      }
      167 
      {
        'Dual-Core Intel(R) Xeon(R) processor ULV'
      }
      168 
      {
        'Dual-Core Intel(R) Xeon(R) processor 7100 Series'
      }
      169 
      {
        'Quad-Core Intel(R) Xeon(R) processor 5400 Series'
      }
      170 
      {
        'Quad-Core Intel(R) Xeon(R) processor'
      }
      171 
      {
        'Dual-Core Intel(R) Xeon(R) processor 5200 Series'
      }
      172 
      {
        'Dual-Core Intel(R) Xeon(R) processor 7200 Series'
      }
      173 
      {
        'Quad-Core Intel(R) Xeon(R) processor 7300 Series'
      }
      174 
      {
        'Quad-Core Intel(R) Xeon(R) processor 7400 Series'
      }
      175 
      {
        'Multi-Core Intel(R) Xeon(R) processor 7400 Series'
      }
      176 
      {
        'Pentium(R) III Xeon(TM)'
      }
      177 
      {
        'Pentium(R) III Processor with Intel(R) SpeedStep(TM) Technology'
      }
      178 
      {
        'Pentium(R) 4'
      }
      179 
      {
        'Intel(R) Xeon(TM)'
      }
      180 
      {
        'AS400 Family'
      }
      181 
      {
        'Intel(R) Xeon(TM) Processor MP'
      }
      182 
      {
        'AMD AthlonXP(TM) Family'
      }
      183 
      {
        'AMD AthlonMP(TM) Family'
      }
      184 
      {
        'Intel(R) Itanium(R) 2'
      }
      185 
      {
        'Intel Pentium M Processor'
      }
      186 
      {
        'Intel(R) Celeron(R) D processor'
      }
      187 
      {
        'Intel(R) Pentium(R) D processor'
      }
      188 
      {
        'Intel(R) Pentium(R) Processor Extreme Edition'
      }
      189 
      {
        'Intel(R) Core(TM) Solo Processor'
      }
      190 
      {
        'K7'
      }
      191 
      {
        'Intel(R) Core(TM)2 Duo Processor'
      }
      192 
      {
        'Intel(R) Core(TM)2 Solo processor'
      }
      193 
      {
        'Intel(R) Core(TM)2 Extreme processor'
      }
      194 
      {
        'Intel(R) Core(TM)2 Quad processor'
      }
      195 
      {
        'Intel(R) Core(TM)2 Extreme mobile processor'
      }
      196 
      {
        'Intel(R) Core(TM)2 Duo mobile processor'
      }
      197 
      {
        'Intel(R) Core(TM)2 Solo mobile processor'
      }
      198 
      {
        'Intel Core™ i7-2760QM'
      }
      199 
      {
        'Dual-Core Intel(R) Celeron(R) Processor'
      }
      200 
      {
        'IBM390 Family'
      }
      201 
      {
        'G4'
      }
      202 
      {
        'G5'
      }
      203 
      {
        'G6'
      }
      204 
      {
        'z/Architecture Base'
      }
      205 
      {
        'Intel(R) Core(TM) i5 processor'
      }
      206 
      {
        'Intel(R) Core(TM) i3 processor'
      }
      210 
      {
        'VIA C7(TM)-M Processor Family'
      }
      211 
      {
        'VIA C7(TM)-D Processor Family'
      }
      212 
      {
        'VIA C7(TM) Processor Family'
      }
      213 
      {
        'VIA Eden(TM) Processor Family'
      }
      214 
      {
        'Multi-Core Intel(R) Xeon(R) processor'
      }
      215 
      {
        'Dual-Core Intel(R) Xeon(R) processor 3xxx Series'
      }
      216 
      {
        'Quad-Core Intel(R) Xeon(R) processor 3xxx Series'
      }
      217 
      {
        'VIA Nano(TM) Processor Family'
      }
      218 
      {
        'Dual-Core Intel(R) Xeon(R) processor 5xxx Series'
      }
      219 
      {
        'Quad-Core Intel(R) Xeon(R) processor 5xxx Series'
      }
      221 
      {
        'Dual-Core Intel(R) Xeon(R) processor 7xxx Series'
      }
      222 
      {
        'Quad-Core Intel(R) Xeon(R) processor 7xxx Series'
      }
      223 
      {
        'Multi-Core Intel(R) Xeon(R) processor 7xxx Series'
      }
      224 
      {
        'Multi-Core Intel(R) Xeon(R) processor 3400 Series'
      }
      228 
      {
        'AMD Opteron(TM) 3000 Series Processor'
      }
      229 
      {
        'AMD Sempron(TM) II Processor Family'
      }
      230 
      {
        'Embedded AMD Opteron(TM) Quad-Core Processor Family'
      }
      231 
      {
        'AMD Phenom(TM) Triple-Core Processor Family'
      }
      232 
      {
        'AMD Turion(TM) Ultra Dual-Core Mobile Processor Family'
      }
      233 
      {
        'AMD Turion(TM) Dual-Core Mobile Processor Family'
      }
      234 
      {
        'AMD Athlon(TM) Dual-Core Processor Family'
      }
      235 
      {
        'AMD Sempron(TM) SI Processor Family'
      }
      236 
      {
        'AMD Phenom(TM) II Processor Family'
      }
      237 
      {
        'AMD Athlon(TM) II Processor Family'
      }
      238 
      {
        'Six-Core AMD Opteron(TM) Processor Family'
      }
      239 
      {
        'AMD Sempron(TM) M Processor Family'
      }
      250 
      {
        'i860'
      }
      251 
      {
        'i960'
      }
      260 
      {
        'SH-3'
      }
      261 
      {
        'SH-4'
      }
      280 
      {
        'ARM'
      }
      281 
      {
        'StrongARM'
      }
      300 
      {
        '6x86'
      }
      301 
      {
        'MediaGX'
      }
      302 
      {
        'MII'
      }
      320 
      {
        'WinChip'
      }
      350 
      {
        'DSP'
      }
      500 
      {
        'Video Processor'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
