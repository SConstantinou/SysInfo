Function Get-OSLanguage 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-OSLanguage -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint32]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      1025 
      {
        'Arabic (Saudi Arabia)'
      }
      1026 
      {
        'Bulgarian (Bulgaria)'
      }
      3076 
      {
        'Chinese (Hong Kong SAR)'
      }
      2052 
      {
        'Chinese (PRC)'
      }
      1028 
      {
        'Chinese (Taiwan)'
      }
      1050 
      {
        'Croatian (Croatia)'
      }
      1029 
      {
        'Czech (Czech Republic)'
      }
      1030 
      {
        'Danish (Denmark)'
      }
      1043 
      {
        'Dutch (Netherlands)'
      }
      1033 
      {
        'English (United States)'
      }
      2057 
      {
        'English (United Kingdom)'
      }
      1061 
      {
        'Estonian (Estonia)'
      }
      1035 
      {
        'Finnish (Finland)'
      }
      3084 
      {
        'French (Canada)'
      }
      1036 
      {
        'French (France)'
      }
      1031 
      {
        'German (Germany)'
      }
      1032 
      {
        'Greek (Greece)'
      }
      1037 
      {
        'Hebrew (Israel)'
      }
      1038 
      {
        'Hungarian (Hungary)'
      }
      1040 
      {
        'Italian (Italy)'
      }
      1041 
      {
        'Japanese (Japan)'
      }
      1042 
      {
        'Korean (Korea)'
      }
      1062 
      {
        'Latvian (Latvia)'
      }
      1063 
      {
        'Lithuanian (Lithuania)'
      }
      1044 
      {
        'Norwegian, Bokmål (Norway)'
      }
      1045 
      {
        'Polish (Poland)'
      }
      1046 
      {
        'Portuguese (Brazil)'
      }
      2070 
      {
        'Portuguese (Portugal)'
      }
      1048 
      {
        'Romanian (Romania)'
      }
      1049 
      {
        'Russian (Russia)'
      }
      2074 
      {
        'Serbian (Latin, Serbia)'
      }
      9242 
      {
        'Serbian (Latin, Serbia)'
      }
      1051 
      {
        'Slovak (Slovakia)'
      }
      1060 
      {
        'Slovenian (Slovenia)'
      }
      2058 
      {
        'Spanish (Mexico)'
      }
      3082 
      {
        'Spanish (Spain)'
      }
      1053 
      {
        'Swedish (Sweden)'
      }
      1054 
      {
        'Thai (Thailand)'
      }
      1055 
      {
        'Turkish (Turkey)'
      }
      1058 
      {
        'Ukrainian (Ukraine)'
      }
      1078 
      {
        'Afrikaans (South Africa)'
      }
      1052 
      {
        'Albanian (Albania)'
      }
      1118 
      {
        'Amharic (Ethiopia)'
      }
      1067 
      {
        'Armenian (Armenia)'
      }
      1101 
      {
        'Assamese (India)'
      }
      1068 
      {
        'Azerbaijan'
      }
      2117 
      {
        'Bangla (Bangladesh)'
      }
      1069 
      {
        'Basque (Basque)'
      }
      1059 
      {
        'Belarusian'
      }
      1093 
      {
        'Bangla (India)'
      }
      5146 
      {
        'Bosnian (Latin)'
      }
      1027 
      {
        'Catalan'
      }
      1170 
      {
        'Central Kurdish'
      }
      1116 
      {
        'Cherokee'
      }
      1164 
      {
        'Dari'
      }
      1124 
      {
        'Filipino'
      }
      1110 
      {
        'Galician'
      }
      1079 
      {
        'Georgian (Georgia)'
      }
      1095 
      {
        'Gujarati (India)'
      }
      1128 
      {
        'Hausa (Latin, Nigeria)'
      }
      1081 
      {
        'Hindi (India)'
      }
      1039 
      {
        'Icelandic (Iceland)'
      }
      1136 
      {
        'Igbo (Nigeria)'
      }
      1057 
      {
        'Indonesian (Indonesia)'
      }
      2141 
      {
        'Inuktitut (Latin, Canada)'
      }
      2108 
      {
        'Irish (Ireland)'
      }
      1076 
      {
        'isiXhosa (South Africa)'
      }
      1077 
      {
        'isiZulu (South Africa)'
      }
      1099 
      {
        'Kannada (India)'
      }
      1087 
      {
        'Kazakh (Kazakhstan)'
      }
      1107 
      {
        'Khmer (Cambodia)'
      }
      1158 
      {
        "K'iche' (Guatemala)"
      }
      1159 
      {
        'Kinyarwanda'
      }
      1089 
      {
        'Kiswahili (Kenya)'
      }
      1111 
      {
        'Konkani (India)'
      }
      1088 
      {
        'Kyrgyz (Kyrgyzstan)'
      }
      1108 
      {
        'Lao (Laos)'
      }
      1134 
      {
        'Luxembourgish (Luxembourg)'
      }
      1071 
      {
        'Macedonian (FYROM)'
      }
      1086 
      {
        'Malay (Malaysia, Brunei, and Singapore)'
      }
      1100 
      {
        'Malayalam (India)'
      }
      1082 
      {
        'Maltese (Malta)'
      }
      1153 
      {
        'Maori (New Zealand)'
      }
      1102 
      {
        'Marathi (India)'
      }
      1104 
      {
        'Mongolian (Cyrillic)'
      }
      1121 
      {
        'Nepali (Federal Democratic Republic of Nepal)'
      }
      2068 
      {
        'Norwegian, Nynorsk (Norway)'
      }
      1096 
      {
        'Odia (India)'
      }
      1065 
      {
        'Persian'
      }
      1094 
      {
        'Punjabi (India)'
      }
      2118 
      {
        'Punjabi (Arabic)'
      }
      3179 
      {
        'Quechua (Peru)'
      }
      1169 
      {
        'Scottish Gaelic'
      }
      7194 
      {
        'Serbian (Cyrillic, Bosnia and Herzegovina)'
      }
      3098 
      {
        'Serbian (Cyrillic, Serbia)'
      }
      10266 
      {
        'Serbian (Cyrillic, Serbia)'
      }
      1132 
      {
        'Sesotho sa Leboa (South Africa)'
      }
      1074 
      {
        'Setswana (South Africa)'
      }
      2137 
      {
        'Sindhi (Arabic)'
      }
      1115 
      {
        'Sinhala (Sri Lanka)'
      }
      1064 
      {
        'Tajik (Cyrillic)'
      }
      1097 
      {
        'Tamil (India)'
      }
      1092 
      {
        'Tatar (Russia)'
      }
      1098 
      {
        'Telugu (India)'
      }
      1139 
      {
        'Tigrinya'
      }
      1090 
      {
        'Turkmen'
      }
      1056 
      {
        'Urdu'
      }
      1152 
      {
        'Uyghur'
      }
      1091 
      {
        'Uzbek (Latin)'
      }
      2051 
      {
        'Valencian'
      }
      1066 
      {
        'Vietnamese'
      }
      1106 
      {
        'Welsh (Great Britain)'
      }
      1160 
      {
        'Wolof'
      }
      1130 
      {
        'Yoruba (Nigeria)'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
