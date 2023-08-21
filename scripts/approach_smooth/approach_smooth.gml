function approach_smooth(){
   var val = argument[0]
    var target = argument[1]
    var spd = argument[2]
    var smallest_diff = (argument_count == 4 ? argument[3] : 0.001)
    var diff = (target - val)
    if (abs(diff) <= smallest_diff)
        return target;
    else
        return (val + (diff * spd));
}