/// @description Insert description here
// You can write your code in this editor
var scale = 1;
var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0]);

window_set_size(w * scale, h * scale);
display_set_gui_size(w * scale, h * scale);

alarm[0] = 1;