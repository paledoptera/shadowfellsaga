if (layer_exists("Background_PARALLAX_1"))
{
	layer_x("Background_PARALLAX_1",(ctrl_camera.x/3)+finetune_x1);
	layer_y("Background_PARALLAX_1",(ctrl_camera.y/3)+finetune_y1);	

}

if (layer_exists("Background_PARALLAX_2"))
{
	layer_x("Background_PARALLAX_2",(ctrl_camera.x/3)+(ctrl_camera.x/3)+finetune_x2);
	layer_y("Background_PARALLAX_2",(ctrl_camera.y/3)+(ctrl_camera.y/3)+finetune_y2);	
}

if (layer_exists("Background_PARALLAX_3"))
{
	layer_x("Background_PARALLAX_3",(ctrl_camera.x/5)+(ctrl_camera.x/5)+(ctrl_camera.x/5)+(ctrl_camera.x/5)+finetune_x3);
	layer_y("Background_PARALLAX_3",(ctrl_camera.y/5)+(ctrl_camera.y/5)+(ctrl_camera.y/5)+(ctrl_camera.y/5)+finetune_y3);
}




