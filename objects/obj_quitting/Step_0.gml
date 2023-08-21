quitting = keyboard_check(vk_escape)
if quitting
{
    alpha = clamp((alpha + 0.08), 0, 1)
    timer++
    if ((timer % 15) == 0)
    {
        image++
        if (image == 5)
            game_end();
    }
}
else
{
    timer = 0
    image = 0
    alpha = clamp((alpha - 0.16), 0, 1)
}
