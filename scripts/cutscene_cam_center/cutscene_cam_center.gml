function cutscene_cam_center(cam_obj=ctrl_camera){
	with(cam_obj){
		camera_state=cameraStates.CENTER;	
	}
	cutscene_end_action()
}