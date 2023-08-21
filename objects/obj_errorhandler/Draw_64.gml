draw_set_color(c_white)
 draw_set_font(fnt_main)
  draw_text(10, 10, msg)
    if keyboard_check_pressed(ord("R"))
    {
        obj_gamehandler.garbageTimer = 28
        game_restart()
    }
    if (global.gamebroke < 8 && hold != -1)
    {
        if (keyboard_check(ord("X")))
        {
            hold++
            if (hold >= 120)
            {
                hold = -1
                var success = 0
                if (mode == 1)
                {
                    var n = ("file" + string(global.filechoice))
                    if file_exists(n)
                    {
                        file_delete(n)
                        success = 1
                    }
                }
                else if file_exists("file9")
                {
                    file_delete("file9")
                    success = 1
                }
                if success
                    show_message_async("Data erased successfully.")
                else
                    show_message_async("Data failed to erase for some reason...")
            }
        }
        else
            hold = 0
    }
    else if (global.gamebroke == 11)
    {
        draw_set_font(fnt_main)
        draw_text_ext(10, 128, msg2, 16, 620)
    }