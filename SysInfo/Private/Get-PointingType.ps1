﻿Function Get-PointingType {

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