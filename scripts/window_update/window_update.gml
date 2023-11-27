/// Run internally inside of alarm[1] of obj_gamehandler, this simply adjust certain properties of the
// Window depending on the value of global.windowmode and global.border
// NOTE: Fullscreen functionality to be deprecated and replaced with default GMS2 fullscreen switching

function window_update(){
 if (global.windowmode == 3)
    {
        if (!window_get_fullscreen())
        {
            if (os_type == os_linux && (!global.window_init))
				ctrl_global.alarm[1] = 30
            else
                window_set_fullscreen(true)
        }
        return;
    }
    else if window_get_fullscreen()
    {
        window_set_fullscreen(false)
        GAME.alarm[1] = 30
        return;
    }
    var w = window_get_width()
    var h = window_get_height()
    var recenter = 0
    switch global.windowmode
    {
        case 0:
            if (global.border == 0)
            {
                var targetAddW = 0
                var targetAddH = 0
            }
            else
            {
                targetAddW = 320
                targetAddH = 60
            }
            if (w != (targetAddW + 640) || h != (targetAddH + 480))
            {
                window_set_size((targetAddW + 640), (targetAddH + 480))
                recenter = 1
            }
            break
        case 1:
            var scale = window_calculate_bestfit()
            if (global.border == 0)
            {
                targetAddW = 0
                targetAddH = 0
            }
            else
            {
                targetAddW = (320 * scale)
                targetAddH = (60 * scale)
            }
            if (w != (targetAddW + global.window_bestfit_w) && h != (targetAddH + global.window_bestfit_h))
            {
                window_set_size((targetAddW + global.window_bestfit_w), (targetAddH + global.window_bestfit_h))
                recenter = 1
            }
            break
        case 2:
            if (global.border == 0)
            {
                targetAddW = 0
                targetAddH = 0
            }
            else
            {
                targetAddW = 640
                targetAddH = 120
            }
            if (w != (targetAddW + 1280) || h != (targetAddH + 960))
            {
                window_set_size((targetAddW + 1280), (targetAddH + 960))
                recenter = 1
            }
            break
    }

    if recenter
        ctrl_global.alarm[0] = 2
    return;
}

function window_calculate_bestfit() 
{
    var dw = (display_get_width() * 0.85)
    var dh = (display_get_height() * 0.85)
    var finalmultiplier = 1
    var multiplier = 1.5
    while (multiplier < 6)
    {
        var tw = (multiplier * 640)
        var th = (multiplier * 480)
        if (global.border != 0)
        {
            tw += floor((multiplier * 320))
            th += floor((multiplier * 60))
        }
        if (dw > tw && dh > th)
        {
            if (frac(tw) == 0 && frac(th) == 0)
                finalmultiplier = multiplier
            multiplier += 0.5
            continue
        }
        else
            break
    }
    global.window_bestfit_w = (640 * finalmultiplier)
    global.window_bestfit_h = (480 * finalmultiplier)
    return finalmultiplier;
}