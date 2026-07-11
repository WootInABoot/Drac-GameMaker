///@description hit detection

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,oEntity,_hitByAttack,false);

if (_hits > 0){
	for (var i = 0; i < _hits; i++){
		
		// if not yet hit, then...
		var _hitID = _hitByAttack[| i];
		if instance_exists(_hitID) and !array_contains(hit_array, _hitID){
			array_push(hit_array, _hitID);
			
			with (_hitID) {
				// Whatever happens to the enemy / object goes here
				show_debug_message("hit!");
				if (other.owner != id) and (other.fixate != id) {
					hspd *= other.kb_hx;
					vspd *= other.kb_vx;
					hspd += other.kb_h;
					vspd += other.kb_v;
				}
			}
		}
	}
}
ds_list_destroy(_hitByAttack);


