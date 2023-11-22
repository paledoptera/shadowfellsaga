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

run_pressed = input_check_pressed("run")
run = input_check("run")
run_released = input_check_released("run")

interact_pressed = input_check_pressed("action")
interact = input_check("action")
interact_released = input_check_released("action")

cancel_pressed = input_check_pressed("cancel")
cancel = input_check("cancel")
cancel_released = input_check_released("cancel")

menu_pressed = input_check_pressed("menu")
menu = input_check("menu")
menu_released = input_check_released("menu")

swap1_pressed = input_check_pressed("swap1")
swap1 = input_check("swap1")
swap1_released = input_check_released("swap1")

swap2_pressed = input_check_pressed("swap2")
swap2 = input_check("swap2")
swap2_released = input_check_released("swap2")

movement_dir = input_direction(0, "left","right","up","down");

target = "overworld";
if instance_exists(obj_savemenu) {target = "savemenu"}