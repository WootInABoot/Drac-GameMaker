image_xscale = oPlayer.image_xscale;
image_speed = 1.2;
visible = false;

attackHit = ds_list_create();

damage = 1;
hitstun = 200;
hitstop = 6;
recoilHitstop = 6;

owner = noone // instance that owns hbx
fixate = noone // instance that hbx snaps to
kb_h = 0 //horizontal knockback
kb_v = 0 //vertical knockback
kb_hx = 1; // horizontal kb multiplier
kb_vx = 1; // vertical kb multiplier
hit_array = [];

