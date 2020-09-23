/// @description Insert description here
// You can write your code in this editor

// 触发器是否使用碰撞盒进行判定
// 使用碰撞盒，只能触发onTriggerOut，onTriggerEnter这两个事件
// 不使用碰撞盒，能触发所有事件onTriggerEnter，onTriggerIn，onTriggerLeave，onTriggerOut
// 不使用碰撞盒时，碰撞检测会采用sprite的宽高作为盒子进行判定
//useCollisionMask = true;

// 是否相交
// 如果useCollisionMask为false，intersect就为real值
// 0：target在trigger外
// 1：target在trigger内
// 2：target和trigger相交

switch mode {
	case TriggerMode.CollisionMask:
	case TriggerMode.Point:
		intersect = false;
		break;
	case TriggerMode.Rectangle:
		intersect = 0;
		break;
}

#region 注册事件
// 存在触发对象就绑定事件
if target {
	// 初始化eventInfo
	if onTriggerEnter && mode != TriggerMode.Point {
		enterInfo = new EventInfo(target, onTriggerEnter);
		gms2ESAddEventListener("onTriggerEnter" + string(id), enterInfo);
	}
	if onTriggerIn && mode != TriggerMode.CollisionMask {
		InInfo = new EventInfo(target, onTriggerIn);
		gms2ESAddEventListener("onTriggerIn" + string(id), InInfo);
	}
	if onTriggerLeave && mode == TriggerMode.Rectangle {
		leaveInfo = new EventInfo(target, onTriggerLeave);
		gms2ESAddEventListener("onTriggerLeave" + string(id), leaveInfo);
	}
	if onTriggerOut {
		outInfo = new EventInfo(target, onTriggerOut);
		gms2ESAddEventListener("onTriggerOut" + string(id), outInfo);
	}
}
#endregion
