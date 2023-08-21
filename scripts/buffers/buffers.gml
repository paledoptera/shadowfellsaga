#region Write Value to Buffer
///@arg buffer
///@arg map
function buffer_write_val(argument0, argument1) 
{
    var type = -1
    if is_array(argument1)
        type = 5
    else if is_bool(argument1)
        type = 3
    else if is_int64(argument1)
    {
        type = 4
        if (argument1 < 0)
            show_error("Int64 cannot be written to file as negative", 1)
    }
    else if (is_int32(argument1) || is_int(argument1))
        type = 0
    else if is_string(argument1)
        type = 1
    else if is_real(argument1)
        type = 2
    if (type != 0)
        buffer_write(argument0, buffer_u8, type)
    switch type
    {
        case 5:
            var len = array_length(argument1)
            buffer_write(argument0, buffer_u32, len)
            for (var i = 0; i < len; i++)
                buffer_write_val(argument0, argument1[i])
            break
        case 3:
            buffer_write(argument0, buffer_bool, argument1)
            break
        case 2:
            buffer_write(argument0, buffer_f64, argument1)
            break
        case 0:
            if (argument1 <= 32767 && argument1 >= -32768)
            {
                if (argument1 <= 127 && argument1 >= -128)
                {
                    buffer_write(argument0, buffer_u8, 7)
                    buffer_write(argument0, buffer_s8, argument1)
                }
                else
                {
                    buffer_write(argument0, buffer_u8, 6)
                    buffer_write(argument0, buffer_s16, argument1)
                }
            }
            else
            {
                buffer_write(argument0, buffer_u8, 0)
                buffer_write(argument0, buffer_s32, argument1)
            }
            break
        case 4:
            buffer_write(argument0, buffer_u64, argument1)
            break
        case 1:
            buffer_write(argument0, buffer_string, argument1)
            break
    }
    return;
}
#endregion
#region Read Value from Buffer
///@arg buffer
function buffer_read_val(argument0) 
{
    var buffSize = buffer_get_size(argument0)
    if ((buffer_tell(argument0) + 1) >= buffSize)
        return undefined;
    var type = buffer_read(argument0, buffer_u8)
    switch type
    {
        case 5:
            if ((buffer_tell(argument0) + 4) >= buffSize)
                return undefined;
            var len = buffer_read(argument0, buffer_u32)
            var arr = array_create(len)
            for (var i = 0; i < len; i++)
                arr[i] = buffer_read_val(argument0)
            return undefined;
        case 3:
            if ((buffer_tell(argument0) + 1) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 2:
            if ((buffer_tell(argument0) + 8) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 0:
            if ((buffer_tell(argument0) + 4) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 4:
            if ((buffer_tell(argument0) + 8) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 1:
            if ((buffer_tell(argument0) + 1) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 6:
            if ((buffer_tell(argument0) + 2) >= buffSize)
            {
                return undefined;
            }
            return undefined;
        case 7:
            if ((buffer_tell(argument0) + 1) >= buffSize)
            {
                return undefined;
            }
            return undefined;
    }

    return undefined;
}
#endregion