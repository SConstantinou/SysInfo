function Get-Keyboard {

    $KeyboardLayout = @{
        '0000041c' = 'Albanian'
        '00000401' = 'Arabic (101)'
        '00010401' = 'Arabic (102)'
        '00020401' = 'Arabic (102) AZERTY'
        '0000042b' = 'Armenian Eastern'
        '0002042b' = 'Armenian Phonetic'
        '0003042b' = 'Armenian Typewriter'
        '0001042b' = 'Armenian Western'
        '0000044d' = 'Assamese - Inscript'
        '0001042c' = 'Azerbaijani (Standard)'
        '0000082c' = 'Azerbaijani Cyrillic'
        '0000042c' = 'Azerbaijani Latin'
        '0000046d' = 'Bashkir'
        '00000423' = 'Belarusian'
        '0001080c' = 'Belgian (Comma)'
        '00000813' = 'Belgian (Period)'
	    '0000080c' = 'Belgian French'
	    '00000445' = 'Bangla (Bangladesh)'
	    '00020445' = 'Bangla (India)'
	    '00010445' = 'Bangla (India - Legacy)'
	    '0000201a' = 'Bosnian (Cyrillic)'
	    '000b0c00' = 'Buginese'
	    '00030402' = 'Bulgarian'
	    '00010402' = 'Bulgarian (Latin)'
	    '00020402' = 'Bulgarian (phonetic layout)'
	    '00040402' = 'Bulgarian (phonetic traditional)'
	    '00000402' = 'Bulgarian (Typewriter)'
	    '00001009' = 'Canadian French'
	    '00000c0c' = 'Canadian French (Legacy)'
	    '00011009' = 'Canadian Multilingual Standard'
        '0000085f' = 'Central Atlas Tamazight'
        '00000429' = 'Central Kurdish'
        '0000045c' = 'Cherokee Nation'
        '0001045c' = 'Cherokee Nation Phonetic'
        '00000804' = 'Chinese (Simplified) - US Keyboard'
        '00000404' = 'Chinese (Traditional) - US Keyboard'
        '00000c04' = 'Chinese (Traditional, Hong Kong S.A.R.)'
        '00001404' = 'Chinese (Traditional Macao S.A.R.) US Keyboard'
        '00001004' = 'Chinese (Simplified, Singapore) - US keyboard'
        
        <#

Croatian	0x0000041a
Czech	0x00000405
Czech (QWERTY)	0x00010405
Czech Programmers	0x00020405
Danish	0x00000406
Devanagari-INSCRIPT	0x00000439
Divehi Phonetic	0x00000465
Divehi Typewriter	0x00010465
Dutch	0x00000413
Dzongkha	0x00000C51
Estonian	0x00000425
Faeroese	0x00000438
Finnish	0x0000040b
Finnish with Sami	0x0001083b
French	0x0000040c
Futhark	0x00120c00
Georgian	0x00000437
Georgian (Ergonomic)	0x00020437
Georgian (QWERTY)	0x00010437
Georgian Ministry of Education and Science Schools	0x00030437
Georgian (Old Alphabets)	0x00040437
German	0x00000407
German (IBM)	0x00010407
Gothic	0x000c0c00
Greek	0x00000408
Greek (220)	0x00010408
Greek (220) Latin	0x00030408
Greek (319)	0x00020408
Greek (319) Latin	0x00040408
Greek Latin	0x00050408
Greek Polytonic	0x00060408
Greenlandic	0x0000046f
Guarani	0x00000474
Gujarati	0x00000447
Hausa	0x00000468
Hebrew	0x0000040d
Hindi Traditional	0x00010439
Hungarian	0x0000040e
Hungarian 101-key	0x0001040e
Icelandic	0x0000040f
Igbo	0x00000470
India	0x000004009
Inuktitut - Latin	0x0000085d
Inuktitut - Naqittaut	0x0001045d
Irish	0x00001809
Italian	0x00000410
Italian (142)	0x00010410
Japanese	0x00000411
Javanese	0x00110c00
Kannada	0x0000044b
Kazakh	0x0000043f
Khmer	0x00000453
Khmer (NIDA)	0x00010453
Korean	0x00000412
Kyrgyz Cyrillic	0x00000440
Lao	0x00000454
Latin American	0x0000080a
Latvian (Standard)	0x00020426
Latvian (Legacy)	0x00010426
Lisu (Basic)	0x00070c00
Lisu (Standard)	0x00080c00
Lithuanian	0x00010427
Lithuanian IBM	0x00000427
Lithuanian Standard	0x00020427
Luxembourgish	0x0000046e
Macedonia (FYROM)	0x0000042f
Macedonia (FYROM) - Standard	0x0001042f
Malayalam	0x0000044c
Maltese 47-Key	0x0000043a
Maltese 48-key	0x0001043a
Maori	0x00000481
Marathi	0x0000044e
Mongolian (Mongolian Script - Legacy)	0x00000850
Mongolian (Mongolian Script - Standard)	0x00020850
Mongolian Cyrillic	0x00000450
Myanmar	0x00010c00
N'ko	0x00090c00
Nepali	0x00000461
New Tai Lue	0x00020c00
Norwegian	0x00000414
Norwegian with Sami	0x0000043b
Odia	0x00000448
Ol Chiki	0x000d0c00
Old Italic	0x000f0c00
Osmanya	0x000e0c00
Pashto (Afghanistan)	0x00000463
Persian	0x00000429
Persian (Standard)	0x00050429
Phags-pa	0x000a0c00
Polish (214)	0x00010415
Polish (Programmers)	0x00000415
Portuguese	0x00000816
Portuguese (Brazilian ABNT)	0x00000416
Portuguese (Brazilian ABNT2)	0x00010416
Punjabi	0x00000446
Romanian (Legacy)	0x00000418
Romanian (Programmers)	0x00020418
Romanian (Standard)	0x00010418
Russian	0x00000419
Russian - Mnemonic	0x00020419
Russian (Typewriter)	0x00010419
Sakha	0x00000485
Sami Extended Finland-Sweden	0x0002083b
Sami Extended Norway	0x0001043b
Scottish Gaelic	0x00011809
Serbian (Cyrillic)	0x00000c1a
Serbian (Latin)	0x0000081a
Sesotho sa Leboa	0x0000046c
Setswana	0x00000432
Sinhala	0x0000045b
Sinhala - wij 9	0x0001045b
Slovak	0x0000041b
Slovak (QWERTY)	0x0001041b
Slovenian	0x00000424
Sora	0x00100c00
Sorbian Extended	0x0001042e
Sorbian Standard	0x0002042e
Sorbian Standard (Legacy)	0x0000042e
Spanish	0x0000040a
Spanish Variation	0x0001040a
Swedish	0x0000041d
Swedish with Sami	0x0000083b
Swiss French	0x0000100c
Swiss German	0x00000807
Syriac	0x0000045a
Syriac Phonetic	0x0001045a
Tai Le	0x00030c00
Tajik	0x00000428
Tamil	0x00000449
Tatar	0x00010444
Tatar (Legacy)	0x00000444
Telugu	0x0000044a
Thai Kedmanee	0x0000041e
Thai Kedmanee (non-ShiftLock)	0x0002041e
Thai Pattachote	0x0001041e
Thai Pattachote (non-ShiftLock)	0x0003041e
Tibetan (PRC - Standard)	0x00010451
Tibetan (PRC - Legacy)	0x00000451
Tifinagh (Basic)	0x00050c00
Tifinagh (Full)	0x00060c00
Turkish F	0x0001041f
Turkish Q	0x0000041f
Turkmen	0x00000442
Uyghur	0x00010408
Uyghur (Legacy)	0x00000480
Ukrainian	0x00000422
Ukrainian (Enhanced)	0x00020422
United Kingdom	0x00000809
United Kingdom Extended	0x00000452
United States - Dvorak	0x00010409
United States - International	0x00020409
United States-Dvorak for left hand	0x00030409
United States-Dvorak for right hand	0x00040409
United States - English	0x00000409
Urdu	0x00000420
Uyghur	0x00010480
Uzbek Cyrillic	0x00000843
Vietnamese	0x0000042a
Wolof	0x00000488
Yakut	0x00000485
Yoruba	0x0000046a
#>
    }

    $Properties = 'Name','Description','Caption','PowerManagementCapabilities',
                  'PowerManagementSupported','Layout','NumberOfFunctionKeys',
                  'IsLocked','Status'

    $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties | Select-Object $Properties
    $Keyboard | ForEach-Object {$_.Layout = $KeyboardLayout["$($_.Layout)"]}
    
    Write-Output $Keyboard
}