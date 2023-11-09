function item_comment(target, str, font){
	var _xx = -1;
	switch(target){
		case  0:
			_xx=20;
		break;
		case 1:
			_xx=380;
		break;		
	}
	comment = instance_create(_xx,460,obj_commentwriter);
	comment.msg = str;
	comment.font = font;
	return;
}