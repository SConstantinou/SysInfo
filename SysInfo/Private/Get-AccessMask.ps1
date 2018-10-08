Function Get-AccessMask {

    param ([uint32]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'FILE_READ_DATA (file) or FILE_LIST_DIRECTORY (directory)'}
            2 {'FILE_WRITE_DATA (file) or FILE_ADD_FILE (directory)'}
            4 {'FILE_APPEND_DATA (file) or FILE_ADD_SUBDIRECTORY'}
            8 {'FILE_READ_EA'}
            16 {'FILE_WRITE_EA'}
            32 {'FILE_EXECUTE (file) or FILE_TRAVERSE (directory)'}
            64 {'FILE_DELETE_CHILD (directory)'}
            128 {'FILE_READ_ATTRIBUTES'}
            256 {'FILE_WRITE_ATTRIBUTES'}
            65536 {'DELETE'}
            131072 {'READ_CONTROL'}
            262144 {'WRITE_DAC'}
            524288 {'WRITE_OWNER'}
            1048576 {'SYNCHRONIZE'}
            18809343 {'ACCESS_SYSTEM_SECURITY'}
            default {'Invalid Code'}
        }
    }

    Return
}