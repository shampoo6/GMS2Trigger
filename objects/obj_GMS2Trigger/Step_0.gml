/// @description 碰撞检测
if !target {
	show_debug_message("trigger target is noone");
	return;
}

var _other = id;
with(target) {
	switch _other.mode {
		case TriggerMode.CollisionMask:
			if !_other.intersect {
				if place_meeting(x, y, _other) {
					_other.intersect = true;
					gms2ESSendEvent("onTriggerEnter" + string(_other), _other);
				}
			} else {
				if !place_meeting(x, y, _other) {
					_other.intersect = false;
					gms2ESSendEvent("onTriggerOut" + string(_other), _other);
				}
			}
			break;
		case TriggerMode.Rectangle:
			var sx1 = x - sprite_xoffset;
			var sy1 = y - sprite_yoffset;
			var sx2 = sx1 + sprite_width;
			var sy2 = sy1 + sprite_height;
			var dx1 = _other.x - _other.sprite_xoffset;
			var dy1 = _other.y - _other.sprite_yoffset;
			var dx2 = dx1 + _other.sprite_width;
			var dy2 = dy1 + _other.sprite_height;
			var before = _other.intersect;
			_other.intersect = rectangle_in_rectangle(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2);
			switch(before) {
				case 0:
				if _other.intersect == 1 {
					gms2ESSendEvent("onTriggerIn" + string(_other), _other);
				} else if _other.intersect == 2 {
					gms2ESSendEvent("onTriggerEnter" + string(_other), _other);
				}
				break;
				case 1:
				if _other.intersect == 0 {
					gms2ESSendEvent("onTriggerOut" + string(_other), _other);
				} else if _other.intersect == 2 {
					gms2ESSendEvent("onTriggerLeave" + string(_other), _other);
				}
				break;
				case 2:
				if _other.intersect == 0 {
					gms2ESSendEvent("onTriggerOut" + string(_other), _other);
				} else if _other.intersect == 1 {
					gms2ESSendEvent("onTriggerIn" + string(_other), _other);
				}
				break;
			}
			break;
		case TriggerMode.Point:
			var before = _other.intersect;
			_other.intersect = position_meeting(x, y, _other);
			if before {
				if !_other.intersect {
					gms2ESSendEvent("onTriggerOut" + string(_other), _other);
				}
			} else {
				if _other.intersect {
					gms2ESSendEvent("onTriggerIn" + string(_other), _other);
				}
			}
			break;
	}
}
