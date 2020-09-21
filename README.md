# GMS2Trigger
GMS2简易触发器










触发器应该有基本两个事件 onTriggerIn onTriggerOut
令：
- 指定触发对象为obj，obj的碰撞盒为obj.mask
- 指定触发器为trigger，触发器的碰撞盒为trigger.mask

触发条件
- onTriggerEnter：当obj在trigger外部，且obj.mask与trigger.mask相交时触发
- onTriggerIn：当obj.mask和trigger.mask从相交到obj完全进入trigger且不再相交时触发
- onTriggerLeave：当obj在trigger内部，且obj.mask与trigger.mask相交时触发
- onTriggerOut：当obj.mask和trigger.mask从相交到obj完全离开trigger且不再相交时触发

触发器采用什么方式检测碰撞？collision event只能检测碰撞发生时，不能用于检测进入和退出触发器
