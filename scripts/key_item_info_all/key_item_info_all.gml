function key_item_info_all(){
    for (i = 0; i < 12; i += 1)
    {
        keyitemid = global.keyid[i]
        key_item_info(keyitemid)
        global.keyitemnameb[i] = itemnameb
        global.keyitemdescb[i] = itemdescb
        global.keyitemusable[i] = usable
    }
    return;
}