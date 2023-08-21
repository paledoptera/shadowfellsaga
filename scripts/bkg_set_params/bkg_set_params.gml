///@arg bkg_id - ID the Background to modify, must be a string
///@arg sprite - Sprite Index to set to the background 
///@arg htile - Whether or not the background will tile horizontally
///@arg vtile - Whether or not the background will tile vertically
///@arg stretch - Whether or not the background will stretch
///@arg offset_x - The offset along the x-axis that the background should have
///@arg offset_y - The offset along the y-axis that the background should have
///@arg horzspeed - Speed at which the background moves horizontally
///@arg vertspeed - Speed at which the background moves vertically
function bkg_set_params(bkg_id,sprite,htile=false,vtile=false,stretch=false,offset_x,offset_y,horzspeed,vertspeed){
	layer_background_get_id(bkg_id);
	if(layer_background_get_id(bkg_id)!=""){
		layer_background_sprite(bkg_id,sprite);
		layer_background_htiled(bkg_id,htile);
		layer_background_vtiled(bkg_id,vtile);
		layer_background_stretch(bkg_id,stretch);
		layer_hspeed(bkg_id,horzspeed);
		layer_vspeed(bkg_id,vertspeed);
		layer_x(bkg_id,offset_x);
		layer_y(bkg_id,offset_y);
	}

}