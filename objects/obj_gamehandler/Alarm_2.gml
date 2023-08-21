///@desc Basic Error Handling
if (global.gamebroke != -1)
    return;
if (global.timeseconds >= 4294967295)
{
    global.gamebroke = 0
    room_goto(STAGE_GAME_BROKE)
    return;
}
alarm[2] = room_speed