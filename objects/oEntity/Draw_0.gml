draw_self();
if !global.devmode exit;
draw_set_color(c_white) // color white
draw_set_halign(fa_left) // align left / could also do valign
draw_set_font(fntBirdSeed)
var _x = x - 16
var _y = y - 32
draw_text(_x,_y,"hp "+string(hp) )
_y -= 12
draw_text(_x,_y,"hitstun "+string(hitstun) )
_y -= 12
draw_text(_x,_y,"hitstop "+string(hitstop) )