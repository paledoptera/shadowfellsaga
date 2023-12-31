// # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//								User-definable Macros
// # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// #							End of User Defines
// # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
FAST.feature( "FREN", "Render", (1 << 32 ) + ( 2 << 16 ) + 1, "06/22/2021" );

#macro RenderConfiguration	( __FAST_render_config__() )

function __FAST_render_config__() {
	static instance	= new ( function() constructor {
		static set_resolution	= function( _width, _height ) {
			render_width	= _width;
			render_height	= _height;
			
		}
		static set_max_scale	= function( _scale ) {
			max_scale	= _scale;
			
		}
		static set_overscan		= function( _width, _height ) {
			overscan_width	= _width;
			overscan_height	= _height;
			
		}
		static set_precision	= function( _prec ) {
			precision	= _prec;
			
		}
		static set_fullscreen	= function() {
			window_set_fullscreen( true );
			
		}
		static set_windowed	= function() {
			var _x	= ( display_get_width() - window_width ) div 2;
			var _y	= ( display_get_height()- window_height ) div 2;
			
			view_xport[ 0 ]	= 0;
			view_yport[ 0 ] = 0;
			
			window_set_rectangle( _x, _y, window_width, window_height );
			
			window_set_fullscreen( false );
			
		}
		static create_camera	= function( _width, _height, _ease ) {
			if ( _width == undefined ) { _width = render_width; }
			if ( _height== undefined ) { _height= render_height; }
			
			if ( camera != undefined ) { camera.destroy(); }
			
			camera	= new Camera( _width, _height );
			
			if ( _ease != undefined )
				camera.set_easing( _ease );
				
			return camera;
			
		}
		var _e	= new FrameEvent( FAST.ROOM_START, 0, function() {
			if ( render_width == undefined || render_height == undefined ) {
				render_width	= room_width;
				render_height	= room_height;
				
			}
			var _scale	= min( display_get_width() / render_width, display_get_height() / render_height );
			
			_scale	*= max_scale;
			_scale	-= ( _scale % 1 ) % precision;
			
			window_scale	= _scale;
			window_width	= render_width * window_scale;
			window_height	= render_height* window_scale;
			
			surface_resize( application_surface, render_width, render_height );
			
		}).once();
		__event	= new FrameEvent( FAST.ROOM_START, 0, function() {
			view_wport[ 0 ]		= render_width;
			view_hport[ 0 ]		= render_height;
			view_visible[ 0 ]	= true;
			
			view_enabled	= true;
			
			camera_set_view_size( view_camera[ 0 ], render_width, render_height );
			
			if ( window_get_fullscreen() )
				set_fullscreen();
			else
				set_windowed();
			
		});
		camera			= undefined;
		render_width	= undefined;
		render_height	= undefined;
		window_width	= 0;
		window_height	= 0;
		window_scale	= 1.0;
		max_scale		= 0.8;
		overscan_width	= 0;
		overscan_height	= 0;
		precision		= 1.0;
		
	})();
	return instance;
	
}
