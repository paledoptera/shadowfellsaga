// Replaces a given default string with a localized version for your language
function str_set_loc(str,key){
	///@arg str - string as listed in the indexed key
	///@arg key - the json key to index
    if (!is_english())
        str = get_lang_string(key)
    return str;
	
}