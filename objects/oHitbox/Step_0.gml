///@description hit detection

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,oEntity,_hitByAttack,false);

if (_hits > 0){
	for (var i = 0; i < _hits; i++){
		
		// if not yet hit, then...
		var _hitID = _hitByAttack[| i];
		if instance_exists(_hitID) and !array_contains(hit_array, _hitID){
			array_push(hit_array, _hitID);
			
			var _hitConfirm = false;
			with (_hitID) {
				// Whatever happens to the enemy / object goes here
				if (other.owner != id) and (other.fixate != id) {
					// Hit has connected
					_hitConfirm = true;
					hspd *= other.kb_hx;
					vspd *= other.kb_vx;
					hspd += other.kb_h;
					vspd += other.kb_v;
					hp = max(hp - other.damage, 0);
					hitstun = min(hitstun + other.hitstun, 200);
					hitstop += other.hitstop;
					
					
					
				}
			}
			
			if (_hitConfirm == true) {
				if instance_exists(fixate) {
					fixate.hitstop = recoilHitstop;
				}
			}
		}
	}
}
ds_list_destroy(_hitByAttack);


