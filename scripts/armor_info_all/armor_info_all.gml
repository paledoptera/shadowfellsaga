function amor_info_all(){
    for (i = 0; i < 6; i += 1)
    {
        amorid = global.armor[i]
        armor_info(armorid)
        global.armornameb[i] = armorname
        global.armordesb[i] = armordesc
		global.armoricon[i] = armorsubimg
    }
    return;
}