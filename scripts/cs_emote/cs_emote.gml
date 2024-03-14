// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cs_emote(instance,index,sound_to_play = snd_attention,time_in_seconds = 0.8,x_adjust = 0, y_adjust = 0){
if(CS.start_action = false)
{
	if(CS.start_action = false)
	{
		CS.action_info = "pause"
		CS.start_action = true
		CS.time_end_action = time_in_seconds;
		
		var spawn_x = instance.x;
		var spawn_y = instance.y;
		
		if instance = actor_papyrus {spawn_y = instance.y-90}
		
		var inst = instance_create(spawn_x,spawn_y,obj_emotionbubble);
		inst.image_index = index;
		inst.sound = sound_to_play;
		inst.time_end = time_in_seconds;
		inst.draw_x_adj = x_adjust;
		inst.draw_y_adj = y_adjust;
	}
	
}
}