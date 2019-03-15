Function Get-Locale 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Locale -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>
  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][String] $Code)

  if ($Code -ne '')
  {
    Switch ($Code){
      '0436' 
      {
        'Afrikaans - South Africa'
      }
      '041c' 
      {
        'Albanian - Albania'
      }
      '0484' 
      {
        'Alsatian - France'
      }
      '045e' 
      {
        'Amharic - Ethiopia'
      }
      '1401' 
      {
        'Arabic - Algeria'
      }
      '3c01' 
      {
        'Arabic - Bahrain'
      }
      '0c01' 
      {
        'Arabic - Egypt'
      }
      '0801' 
      {
        'Arabic - Iraq'
      }
      '2c01' 
      {
        'Arabic - Jordan'
      }
      '3401' 
      {
        'Arabic - Kuwait'
      }
      '3001' 
      {
        'Arabic - Lebanon'
      }
      '1001' 
      {
        'Arabic - Libya'
      }
      '1801' 
      {
        'Arabic - Morocco'
      }
      '2001' 
      {
        'Arabic - Oman'
      }
      '4001' 
      {
        'Arabic - Qatar'
      }
      '0401' 
      {
        'Arabic - Saudi Arabia'
      }
      '2801' 
      {
        'Arabic - Syria'
      }
      '1c01' 
      {
        'Arabic - Tunisia'
      }
      '3801' 
      {
        'Arabic - U.A.E.'
      }
      '2401' 
      {
        'Arabic - Yemen'
      }
      '042b' 
      {
        'Armenian - Armenia'
      }
      '044d' 
      {
        'Assamese - India'
      }
      '082c' 
      {
        'Azerbaijani - Azerbaijan (Cyrillic)'
      }
      '042c' 
      {
        'Azerbaijani - Azerbaijan (Latin)'
      }
      '0845' 
      {
        'Bangla (Bangladesh)'
      }
      '0445' 
      {
        'Bangla - India (Bengali Script)'
      }
      '046d' 
      {
        'Bashkir - Russia'
      }
      '042d' 
      {
        'Basque - Basque'
      }
      '0423' 
      {
        'Belarusian - Belarus'
      }
      '201a' 
      {
        'Bosnian - Bosnia and Herzegovina (Cyrillic)'
      }
      '141a' 
      {
        'Bosnian - Bosnia and Herzegovina (Latin)'
      }
      '047e' 
      {
        'Breton - France'
      }
      '0402' 
      {
        'Bulgarian - Bulgaria'
      }
      '0455' 
      {
        'Burmese - Myanmar'
      }
      '0403' 
      {
        'Catalan - Catalan'
      }
      '040c' 
      {
        'Central Atlas Tamazight (Latin) - Algeria'
      }
      '085f' 
      {
        'Central Atlas Tamazight (Latin) - Algeria'
      }
      '105f' 
      {
        'Central Atlas Tamazight (Tifinagh) - Morocco'
      }
      '0492' 
      {
        'Central Kurdish (Iraq)'
      }
      '045c' 
      {
        'Cherokee (Cherokee, United States)'
      }
      '0804' 
      {
        'Chinese - PRC'
      }
      '0404' 
      {
        'Chinese - Taiwan'
      }
      '0483' 
      {
        'Corsican - France'
      }
      '101a' 
      {
        'Croatian - Bosnia and Herzegovina'
      }
      '041a' 
      {
        'Croatian - Croatia'
      }
      '0405' 
      {
        'Czech - Czech Republic'
      }
      '0406' 
      {
        'Danish - Denmark'
      }
      '048c' 
      {
        'Dari - Afghanistan'
      }
      '0465' 
      {
        'Divehi - Maldives'
      }
      '0813' 
      {
        'Dutch - Belgium'
      }
      '0413' 
      {
        'Dutch - Netherlands'
      }
      '0c51' 
      {
        'Dzongkha'
      }
      '0c09' 
      {
        'English - Australia'
      }
      '2809' 
      {
        'English - Belize'
      }
      '1009' 
      {
        'English - Canada'
      }
      '2409' 
      {
        'English - Caribbean'
      }
      '4009' 
      {
        'English - India'
      }
      '1809' 
      {
        'English - Ireland'
      }
      '2009' 
      {
        'English - Jamaica'
      }
      '4409' 
      {
        'English - Malaysia'
      }
      '1409' 
      {
        'English - New Zealand'
      }
      '3409' 
      {
        'English - Philippines'
      }
      '4809' 
      {
        'English - Singapore'
      }
      '1c09' 
      {
        'English - South Africa'
      }
      '2c09' 
      {
        'English - Trinidad'
      }
      '0809' 
      {
        'English - Great Britain'
      }
      '0409' 
      {
        'English - United States'
      }
      '3009' 
      {
        'English - Zimbabwe'
      }
      '0425' 
      {
        'Estonian - Estonia'
      }
      '0438' 
      {
        'Faroese - Faroe Islands'
      }
      '0464' 
      {
        'Filipino - Philippines'
      }
      '040b' 
      {
        'Finnish - Finland'
      }
      '080c' 
      {
        'French - Belgium'
      }
      '0c0c' 
      {
        'French - Canada'
      }
      '040c' 
      {
        'French - France'
      }
      '140c' 
      {
        'French - Luxembourg'
      }
      '180c' 
      {
        'French - Monaco'
      }
      '100c' 
      {
        'French - Switzerland'
      }
      '0462' 
      {
        'Frisian - Netherlands'
      }
      '0867' 
      {
        'Fulah (Latin, Senegal)'
      }
      '0456' 
      {
        'Galician - Galician'
      }
      '0437' 
      {
        'Georgian - Georgia'
      }
      '0c07' 
      {
        'German - Austria'
      }
      '0407' 
      {
        'German - Germany'
      }
      '1407' 
      {
        'German - Liechtenstein'
      }
      '1007' 
      {
        'German - Luxembourg'
      }
      '0807' 
      {
        'German - Switzerland'
      }
      '0408' 
      {
        'Greek - Greece'
      }
      '046f' 
      {
        'Greenlandic - Greenland'
      }
      '0474' 
      {
        'Guarani - Paraguay'
      }
      '0447' 
      {
        'Gujarati - India (Gujarati Script)'
      }
      '0468' 
      {
        'Hausa (Latin) - Nigeria'
      }
      '0475' 
      {
        'Hawaiian - United States'
      }
      '040d' 
      {
        'Hebrew - Israel'
      }
      '0439' 
      {
        'Hindi - India'
      }
      '040e' 
      {
        'Hungarian - Hungary'
      }
      '040f' 
      {
        'Icelandic - Iceland'
      }
      '0470' 
      {
        'Igbo - Nigeria'
      }
      '243b' 
      {
        'Inari Sami - Finland'
      }
      '0421' 
      {
        'Indonesian - Indonesia'
      }
      '085d' 
      {
        'Inuktitut (Latin) - Canada'
      }
      '045d' 
      {
        'Inuktitut (Syllabics) - Canada'
      }
      '083c' 
      {
        'Irish - Ireland'
      }
      '0434' 
      {
        'isiXhosa / Xhosa - South Africa'
      }
      '0435' 
      {
        'isiZulu / Zulu - South Africa'
      }
      '0410' 
      {
        'Italian - Italy'
      }
      '0810' 
      {
        'Italian - Switzerland'
      }
      '0411' 
      {
        'Japanese - Japan'
      }
      '0c00' 
      {
        'Javanese (Latin) - Indonesia'
      }
      '044b' 
      {
        'Kannada - India (Kannada Script)'
      }
      '043f' 
      {
        'Kazakh - Kazakhstan'
      }
      '0453' 
      {
        'Khmer - Cambodia'
      }
      '0486' 
      {
        "K'iche - Guatemala"
      }
      '0487' 
      {
        'Kinyarwanda - Rwanda'
      }
      '0457' 
      {
        'Konkani - India'
      }
      '0412' 
      {
        'Korean(Extended Wansung) - Korea'
      }
      '0440' 
      {
        'Kyrgyz - Kyrgyzstan'
      }
      '0454' 
      {
        'Lao - Lao PDR'
      }
      '0426' 
      {
        'Latvian - Standard'
      }
      '0427' 
      {
        'Lithuanian - Lithuania'
      }
      '082e' 
      {
        'Lower Sorbian - Germany'
      }
      '103b' 
      {
        'Lule Sami - Norway'
      }
      '143b' 
      {
        'Lule Sami - Sweden'
      }
      '046e' 
      {
        'Luxembourgish - Luxembourg'
      }
      '042f' 
      {
        'Macedonian - F.Y.R.O.M'
      }
      '083e' 
      {
        'Malay - Brunei'
      }
      '043e' 
      {
        'Malay - Malaysia'
      }
      '044c' 
      {
        'Malayalam - India (Malayalam Script)'
      }
      '043a' 
      {
        'Maltese - Malta'
      }
      '0481' 
      {
        'Maori - New Zealand'
      }
      '047a' 
      {
        'Mapudungun - Chile'
      }
      '044e' 
      {
        'Marathi - India'
      }
      '047c' 
      {
        'Mohawk - Mohawk'
      }
      '0450' 
      {
        'Mongolian (Cyrillic)'
      }
      '0c50' 
      {
        'Mongolian (Mongolian) - Mongolia'
      }
      '0850' 
      {
        'Mongolian (Mongolian- PRC - Standard)'
      }
      '0c00' 
      {
        "N'ko - Guinea"
      }
      '0461' 
      {
        'Nepali - Federal Democratic Republic of Nepal'
      }
      '0c3b' 
      {
        'Northern Sami - Finland'
      }
      '043b' 
      {
        'Northern Sami - Norway'
      }
      '083b' 
      {
        'Northern Sami - Sweden'
      }
      '0414' 
      {
        'Norwegian - Norway (Bokmål)'
      }
      '0814' 
      {
        'Norwegian - Norway (Nynorsk)'
      }
      '0482' 
      {
        'Occitan - France'
      }
      '0448' 
      {
        'Odia - India (Odia Script)'
      }
      '0463' 
      {
        'Pashto - Afghanistan'
      }
      '0429' 
      {
        'Persian'
      }
      '0415' 
      {
        'Polish - Poland'
      }
      '0416' 
      {
        'Portuguese - Brazil'
      }
      '0816' 
      {
        'Portuguese - Portugal'
      }
      '0446' 
      {
        'Punjabi - India (Gurmukhi Script)'
      }
      '0846' 
      {
        'Punjabi (Islamic Republic of Pakistan)'
      }
      '046b' 
      {
        'Quechua - Bolivia'
      }
      '086b' 
      {
        'Quechua - Ecuador'
      }
      '0c6b' 
      {
        'Quechua - Peru'
      }
      '0418' 
      {
        'Romanian - Romania'
      }
      '0417' 
      {
        'Romansh - Switzerland'
      }
      '0419' 
      {
        'Russian - Russia'
      }
      '0485' 
      {
        'Sakha - Russia'
      }
      '044f' 
      {
        'Sanskrit - India'
      }
      '0491' 
      {
        'Scottish Gaelic - Great Britain'
      }
      '1c1a' 
      {
        'Serbian - Bosnia and Herzegovina (Cyrillic)'
      }
      '181a' 
      {
        'Serbian - Bosnia and Herzegovina (Latin)'
      }
      '301a' 
      {
        'Serbian - Montenegro (Cyrillic)'
      }
      '2c1a' 
      {
        'Serbian - Montenegro (Latin)'
      }
      '281a' 
      {
        'Serbian - Serbia (Cyrillic)'
      }
      '241a' 
      {
        'Serbian - Serbia (Latin)'
      }
      '0c1a' 
      {
        'Serbian - Serbia and Montenegro (Former) (Cyrillic)'
      }
      '081a' 
      {
        'Serbian - Serbia and Montenegro (Former) (Latin)'
      }
      '046c' 
      {
        'Sesotho sa Leboa / Northern Sotho - South Africa'
      }
      '0832' 
      {
        'Setswana / Tswana - Botswana'
      }
      '0432' 
      {
        'Setswana / Tswana - South Africa'
      }
      '0c00' 
      {
        'Shona - Zimbabwe'
      }
      '0859' 
      {
        'Sindhi (Islamic Republic of Pakistan)'
      }
      '045b' 
      {
        'Sinhala - Sri Lanka'
      }
      '203b' 
      {
        'Skolt Sami - Finland'
      }
      '041b' 
      {
        'Slovak - Slovakia'
      }
      '0424' 
      {
        'Slovenian - Slovenia'
      }
      '183b' 
      {
        'Southern Sami - Norway'
      }
      '1c3b' 
      {
        'Southern Sami - Sweden'
      }
      '2c0a' 
      {
        'Spanish - Argentina'
      }
      '200a' 
      {
        'Spanish - Bolivarian Republic of Venezuela'
      }
      '400a' 
      {
        'Spanish - Bolivia'
      }
      '340a' 
      {
        'Spanish - Chile'
      }
      '240a' 
      {
        'Spanish - Colombia'
      }
      '140a' 
      {
        'Spanish - Costa Rica'
      }
      '1c0a' 
      {
        'Spanish - Dominican Republic'
      }
      '300a' 
      {
        'Spanish - Ecuador'
      }
      '440a' 
      {
        'Spanish - El Salvador'
      }
      '100a' 
      {
        'Spanish - Guatemala'
      }
      '480a' 
      {
        'Spanish - Honduras'
      }
      '580a' 
      {
        'Spanish - Latin America'
      }
      '080a' 
      {
        'Spanish - Mexico'
      }
      '4c0a' 
      {
        'Spanish - Nicaragua'
      }
      '180a' 
      {
        'Spanish - Panama'
      }
      '3c0a' 
      {
        'Spanish - Paraguay'
      }
      '280a' 
      {
        'Spanish - Peru'
      }
      '500a' 
      {
        'Spanish - Commonwealth of Puerto Rico'
      }
      '0c0a' 
      {
        'Spanish - Spain (International Sort)'
      }
      '040a' 
      {
        'Spanish - Spain (Traditional Sort)'
      }
      '540a' 
      {
        'Spanish - United States'
      }
      '380a' 
      {
        'Spanish - Uruguay'
      }
      '0c00' 
      {
        'Standard Moroccan Tamazight - Morocco'
      }
      '0441' 
      {
        'Swahili - Kenya'
      }
      '081d' 
      {
        'Swedish - Finland'
      }
      '041d' 
      {
        'Swedish - Sweden'
      }
      '045a' 
      {
        'Syriac - Syria'
      }
      '0428' 
      {
        'Tajik - Tajikistan'
      }
      '0449' 
      {
        'Tamil - India'
      }
      '0849' 
      {
        'Tamil - Sri Lanka'
      }
      '0444' 
      {
        'Tatar - Russia (Standard)'
      }
      '044a' 
      {
        'Telugu - India (Telugu Script)'
      }
      '041e' 
      {
        'Thai - Thailand'
      }
      '0451' 
      {
        'Tibetan - PRC'
      }
      '0473' 
      {
        'Tigrinya (Ethiopia)'
      }
      '041f' 
      {
        'Turkish - Turkey'
      }
      '0442' 
      {
        'Turkmen - Turkmenistan'
      }
      '0422' 
      {
        'Ukrainian - Ukraine'
      }
      '042e' 
      {
        'Upper Sorbian - Germany'
      }
      '0820' 
      {
        'Urdu - India'
      }
      '0420' 
      {
        'Urdu (Islamic Republic of Pakistan)'
      }
      '0480' 
      {
        'Uyghur - PRC'
      }
      '0843' 
      {
        'Uzbek - Uzbekistan (Cyrillic)'
      }
      '0443' 
      {
        'Uzbek - Uzbekistan (Latin)'
      }
      '0803' 
      {
        'Valencian - Valencia'
      }
      '042a' 
      {
        'Vietnamese - Vietnam'
      }
      '0452' 
      {
        'Welsh - Great Britain'
      }
      '0488' 
      {
        'Wolof - Senegal'
      }
      '0478' 
      {
        'Yi - PRC'
      }
      '046a' 
      {
        'Yoruba - Nigeria'
      }
      Deafult 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
