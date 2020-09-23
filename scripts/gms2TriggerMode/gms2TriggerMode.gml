// @desc 触发器模式
enum TriggerMode {
	CollisionMask, // 使用目标的碰撞盒进行碰撞检测
	Rectangle, // 使用目标的sprite宽高矩形框进行碰撞检测
	Point // 使用点在触发器内部还是外部进行检测
}