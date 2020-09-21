/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("W")) {
	y -= 128 * delta_time * 0.000001;
}
if keyboard_check(ord("S")) {
	y += 128 * delta_time * 0.000001;
}
if keyboard_check(ord("A")) {
	x -= 128 * delta_time * 0.000001;
}
if keyboard_check(ord("D")) {
	x += 128 * delta_time * 0.000001;
}
