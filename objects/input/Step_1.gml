up_pressed = input_check_pressed("up")
up = input_check("up") || input_is_analogue("up")
up_released = input_check_released("up")

down_pressed = input_check_pressed("down")
down = input_check("down") || input_is_analogue("down")
down_released = input_check_released("down")

left_pressed = input_check_pressed("left")
left = input_check("left") || input_is_analogue("left")
left_released = input_check_released("left")

right_pressed = input_check_pressed("right")
right = input_check("right") || input_is_analogue("right")
right_released = input_check_released("right")

interact_pressed = input_check_pressed("interact")
interact = input_check("interact")
interact_released = input_check_released("interact")

cancel_pressed = input_check_pressed("cancel")
cancel = input_check("cancel")
cancel_released = input_check_released("cancel")

forward_pressed = input_check_pressed("forward")
forward = input_check("forward")
forward_released = input_check_released("forward")

thought_pressed = input_check_pressed("thought")
thought = input_check("thought")
thought_released = input_check_released("thought")

menu_pressed = input_check_pressed("menu")
menu = input_check("menu")
menu_released = input_check_released("menu")

swap_l_pressed = input_check_pressed("swap_l")
swap_l = input_check("swap_l")
swap_l_released = input_check_released("swap_l")

swap_r_pressed = input_check_pressed("swap_r")
swap_r = input_check("swap_r")
swap_r_released = input_check_released("swap_r")

movement_dir = input_direction(0, "left","right","up","down");

target = "overworld";
if instance_exists(obj_savemenu) {target = "savemenu"}
if instance_exists(obj_cmenu) {target = "cmenu"}