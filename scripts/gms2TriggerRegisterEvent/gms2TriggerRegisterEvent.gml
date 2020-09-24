// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gms2TriggerRegisterEvent(trigger){
	with(trigger) {
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
	}
}