// Checks if global.lang is equal to english
// Used in lang load to provide debugging information and load other language files
function is_english(){
    return ((!variable_global_exists("lang")) || global.lang == "en");
}
