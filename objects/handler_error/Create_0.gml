global._canskiproom=false;
var contactPre = "\n\nPlease contact this game's developers\nwith this message if you believe\nthis is an error."
var contact = (contactPre + "\n\nHold X for 4 seconds to erase your")
var r = (global.osflavor != 1 ? "\n\nPress R to restart the game, after\nyou have made sufficient\nchanges." : "\n\nPlease restart the game, after\nyou have made sufficient\nchanges.")
var sf = ("\nsave file. This will erase ALL\ncurrent progress except for\npersistent data." + r)
var pf = ("\npersistent save file. This will\nerase all data stored across\nevery save file." + r)
msg="";
msg2="";
hold=-1;
mode=-1;
scExists=-1;
switch global.gamebroke
{
    case 0:
    case 1:
    case 7:
		room_goto(1); // Nothing is wrong, continue as normal
        break;
    case 2:
        mode = 1
        hold = 0
        msg = (("Invalid header - corrupt save file." + contact) + sf)
        break;
    case 3:
        mode = 1
        hold = 0
        msg = (("Invalid version identifier - corrupt save file." + contact) + sf)
        break;
    case 4:
        mode = 1
        hold = 0
        msg = (("Invalid usage of reserved block - corrupt save file." + contact) + sf)
        break;
    case 5:
        mode = 2
        hold = 0
        msg = (("Invalid header - corrupt psave file." + contact) + pf)
        break;
    case 6:
        mode = 2
        hold = 0
        msg = (("Invalid version identifier - corrupt psave file." + contact) + pf)
        break
    case 8:;
        mode = 1
        msg = "This game is missing important data files\nand/or directories.\n\nPlease contact the game's developers\nwith this message if you believe\nthis is an error.\n\nTroubleshooting:\n- Make sure you *extracted* the game into a\n  folder on its own, not with other files.\n- Redownload the game, and make sure you copy\n  all the files that are necessary"
        if (os_type != os_macosx)
            msg += ", especially\n  the folder named \"data\"."
        else
            msg += "."
        if scExists
            msg += "\n- Note: The music file now playing was found."
        else
            msg += "\n- Note: Music file test not found."
        if (variable_global_exists("integrity_fail") && global.integrity_fail != "")
            msg += (("\n(failed on " + global.integrity_fail) + ")")
        break
    case 9:
        msgIdx = 0
        mode = 1
        hold = 0
        msg = "Big boner down the lane (Press R to Restart)."
        alarm[5] = 1800
        break;
    case 10:
        mode = 1
        hold = 0
        msg = ("The save data that was just downloaded\nwas corrupt. There is no save data to\nfall back on, so please restart the game." + contactPre)
        break;
    case 11:
        mode = 1
        msg = "The game crashed last time! Here's the internal\ninfo for that. Please send this to the\ndevelopers. "
        if (global.osflavor == 1)
            msg += "Restart to play normally."
        else
            msg += "Press R to restart normally."
        msg2 = ""
        var s = array_length(global.crash_data)
        for (var i = 0; i < s; i++)
            msg2 += (global.crash_data[i] + "\n")
        break;
}
