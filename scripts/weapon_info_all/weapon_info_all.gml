function weapon_info_all(){
    for (i = 0; i < 6; i += 1)
    {
        weapon = global.weapon[i]
        weapon_info(weaponid)
        global.weaponnameb[i] = weaponname
        global.weapondescb[i] = weapondesc
		global.weaponicon[i] = weaponsubimg
    }
    return;
}