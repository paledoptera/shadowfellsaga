///@arg bkg_id - The background to modify
///@arg enabled - Is the background able to be seen?
function bkg_set_visible(bkg_id, enabled){
	return layer_background_visible(bkg_id, enabled);
}