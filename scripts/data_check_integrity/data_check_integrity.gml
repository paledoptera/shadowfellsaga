function data_check_integrity(){
	  if (global.osflavor != 1 && os_type != os_macosx)
    {
        if ((!directory_exists("data")) || (!directory_exists("data/mus"))) //|| (!directory_exists("data/lang")))
            return 0;
    }
    global.integrity_fail = ""
    var musicList = ["cooking","flavor","serioustrousle","sheriff","voyage"]
    var l = array_length(musicList)
    for (var i = 0; i < l; i++)
    {
        if (!(file_exists(((global.musfpath + musicList[i]) + ".ogg"))))
        {
            global.integrity_fail = musicList[i]
            return 0;
        }
    }
	/*var langList=["lang_en_ch1"]
	 l = array_length(langList)
    for (i = 0; i < l; i++)
    {
        if (!(file_exists(((global.localizationfpath + langList[i] + ".json")))))
        {
            global.integrity_fail = langList[i];
            return 0;
        }
    }*/
    return 1;	
}