/// @description Done
if (done)
{
    instance_destroy();
}

if (keyboard_check_pressed(ord("R"))) game_restart();

///Detect input
input = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_face1);

