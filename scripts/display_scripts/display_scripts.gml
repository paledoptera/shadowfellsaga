/**
 * @function set_resolution
 *
 * @param {number} _design_value - The width or height of the designed resolution.
 * @param {boolean} [_is_design_value_vertical=false] - When true, the `_design_value` is considered as height; 
 *					when false, as width.
 * @param {boolean} [_is_orientation_vertical=false] - When true, the screen orientation is considered as portrait; 
 *					when false, as landscape.
 * @param {boolean} [_resize_all_rooms=false] - When true, rooms will be resized to the resulting value.
 * @param {number} [_scale] - The scale factor applied to the game window to better fit the monitor. 
 *					This argument is ignored on non-Windows and non-MacOS builds.
 * @param {number} [_override_other_value] - Overrides the value other than the `_design_value` argument for a custom aspect ratio. 
 *					For example, if the width was provided as _design_value, the _override_other_value will override the height. 
 *					This is useful when you want to test your project in various aspect ratios.
 *					This argument is ignored on non-Windows and non-MacOS builds.
 * 
 * @description Sets and stores the resulted resolution in `global.ideal_width` and `global.ideal_height` variables. 
 *
 * @example 
 * set_resolution(640); 
 * set_resolution(480, true, true); 
 * set_resolution(640, undefined, undefined, true, undefined, 480);
 * 
 * @see https://harpwood.itch.io/advanced-resolution-manager for more information and tutorials about this script.
 * 
 * 
 * @author Written by Gkri (Harpwood studio)
 * Based on code written by Pixelated_Pope
 * @license MIT License https://opensource.org/licenses/MIT
 */



function set_resolution(_design_value, _is_design_value_vertical = false, _is_orientation_vertical = false, _resize_all_rooms = false, _scale = undefined, _overide_other_value = undefined) {
	

	if _scale == undefined then _scale = 1;
	
	//detect os_type only if is GMS2 IDE approprate
	var _os_type = undefined;
	_os_type = os_type == os_windows ? os_windows : os_macosx;	
	
	// The design value is either the design width or height. Every calculation in build with Test -> VM get a temporary scaling
	var _desing_width	= os_type == _os_type ? _design_value * _scale : _design_value;
	var _desing_height	= os_type == _os_type ? _design_value * _scale : _design_value;

	var _real_width, _real_height, _aspect_ratio, _ideal_width, _ideal_height;

	if _is_orientation_vertical 
	{
		//dirty way to get portait orientation for os_windows/os_macosx
		_real_width		= os_type == _os_type ? display_get_height()  * _scale : display_get_width(); 
		_real_height	= os_type == _os_type ? display_get_width()	* _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ? round(_ideal_height * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width = round(_ideal_height * _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width / _aspect_ratio);
		}
	
	}
	else
	{
		_real_width		= os_type == _os_type ? display_get_width()  * _scale : display_get_width();
		_real_height	= os_type == _os_type ? display_get_height() * _scale : display_get_height();
		_aspect_ratio	= _real_width >= _real_height ? _real_height / _real_width : _real_width / _real_height;
	
	
		if _is_design_value_vertical	//The design value is reffering to vertical so we calculate the horizontal 
		{
			_ideal_height = _desing_height;
			if os_type == _os_type then _ideal_width = _overide_other_value == undefined ?  round(_ideal_height / _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_width =  round(_ideal_height / _aspect_ratio);
		}
		else							//and vice versa
		{
			_ideal_width = _desing_width;
			if os_type == _os_type then _ideal_height = _overide_other_value == undefined ? round(_ideal_width * _aspect_ratio) : _overide_other_value * _scale;
			else _ideal_height = round(_ideal_width * _aspect_ratio);
		}
	}
	
	//make the results more pixel perfect friendly
	if _ideal_width & 1 then _ideal_width++;
	if _ideal_height & 1 then _ideal_height++;

	if _resize_all_rooms //apply resolution results to all rooms?
	{
		for (var i = 0; i < room_last; i++) 
		{
			if room_exists(i)
			{
				room_set_width(i, _ideal_width);
				room_set_height(i, _ideal_height);
			}
		}
	}

	application_surface_enable(false);  // false as default behaviour 
	window_set_size(_ideal_width, _ideal_height);
	surface_resize(application_surface, _real_width, _real_height);

	//remove the temporary scaling if building with Test -> VM and apply results in global vars for further use
	global.ideal_width = os_type == _os_type ? _ideal_width / _scale : _ideal_width;
	global.ideal_height = os_type == _os_type ? _ideal_height / _scale : _ideal_height;

	
}

/**
 * @function set_camera
 *
 * @param {number} x1 - The left position of the camera view.
 * @param {number} y1 - The top position of the camera view.
 * @param {number} x2 - The right position of the camera view.
 * @param {number} y2 - The bottom position of the camera view.
 *
 * @description	Defines the view area of view_camera[0] as a rectangle defined by x1,y1,x2,y2. 
 *				This is a very basic camera script for the sake of simplicity. If you need 
 *				more complex camera functionality, you will have to implement it yourself.
 *
 * @example	set_camera(0, 0, global.ideal_width, global.ideal_height);
 *
 * @author	Written by Gkri (Harpwood studio)
 * @license	MIT License https://opensource.org/licenses/MIT
 */

function set_camera(x1, y1, x2, y2) {
		
		view_enabled = true;
		view_visible[0] = true;
		view_wport[0] = x2; 
		view_hport[0] = y2; 
	
		view_camera[0] = camera_create_view(x1, y1, view_wport[0], view_hport[0], 0, -1, -1, -1, 0, 0);
}

/**
 * @function set_gui_size
 * 
 * @param {number} [_width] - The width of the GUI layer. If omitted, it will be calculated to fit the game's resolution, based on _height.
 * @param {number} [_height] - The height of the GUI layer. If omitted, it will be calculated to fit the game's resolution based on _width.
 * 
 * @description	Defines the GUI layers size. If both arguments are omitted, the GUI layers size will be the same as the game's resolution. 
 *				If either argument is omitted, it will be calculated to fit the current aspect ratio of the game's resolution.
 *
 * @example		set_gui_size();
 *				set_gui_size(global.ideal_width);
 *				set_gui_size(, global.ideal_height);
 *
 * @see			https://harpwood.itch.io/advanced-resolution-manager for more information.
 * 
 * @author		Written by Gkri (Harpwood studio)
 * @license		MIT License https://opensource.org/licenses/MIT
 */

function set_gui_size(_width = undefined, _height = undefined) {

	
	if _width == undefined and _height == undefined
	{
		_width = global.ideal_width;
		_height = global.ideal_height;
	}
	if _width == undefined then _width = global.ideal_width * _height / HEIGHT;
	if _height == undefined then _height = global.ideal_height * _width / global.ideal_width;
	display_set_gui_size(_width, _height);
		
	global.width_gui = _width;
	global.height_gui = _height;
	
}

/**
 * Converts a length in inches to the equivalent length in pixels, based on the current display's DPI.
 * @param {number} inches - The length in inches to convert to pixels.
 * @returns {number} The equivalent length in pixels.
 *
 * @author		Written by Gkri (Harpwood studio)
 * @license		MIT License https://opensource.org/licenses/MIT
 */
function display_inches_to_pixel(inches) {
    return max(display_get_dpi_x(), display_get_dpi_y()) * inches;
}

/**
 * Converts a length in centimeters to the equivalent length in pixels, based on the current display's DPI.
 * @param {number} cm - The length in centimeters to convert to pixels.
 * @returns {number} The equivalent length in pixels.
 *
 * @author		Written by Gkri (Harpwood studio)
 * @license		MIT License https://opensource.org/licenses/MIT
 */
function display_centimeters_to_pixel(cm) {
    return max(display_get_dpi_x(), display_get_dpi_y()) * cm / 2.54;
}

/**
 * Calculates the diagonal length of the display in inches based on the display's width, height, and DPI values.
 *
 * @returns {number} The diagonal length of the display in inches.
 */
function display_get_diagonal_inches()
{
   	return sqrt(sqr(display_get_width()) + sqr(display_get_height())) / max(display_get_dpi_x(), display_get_dpi_y());
}

