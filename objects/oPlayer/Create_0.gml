//dir
facing = 1;

//speeds
hspd = 0;
vspd = 0;

//gravity / ground check
grav = 0.18; // 0.165
onground = 0;

//jump
jumpSpd = 4.2;  // 3.59
highJumpSpd = 5;
jumped = 0;
jumpCut = 1;

//Accel & Traction
accel = 0;
traction = 0;

accelGround = 0.1; //og 0.1
accelAir = 0.075;

tractionGround = 0.1;
tractionAir = 0.04;

//Max Speed
topSpdTimer = 20;
maxSpd = 0;

maxRunSpd = 2; // og 2
maxWalkSpd = 1.5; // og 1.75

hspd_pixel = 0;
vspd_pixel = 0;

jumpBufferFrames = 10; // make 4 later
jumpBuffer = 0;

coyoteTimeFrames = 10; // make 5 later
coyoteTime = 0;

animIdle = true; // So the idle frames don't get messed up

spdDust = false; //idk if this is the best solution for dust particles atm

state = DRACSTATE.IDLE; // Drac status: hungry

attackHit = ds_list_create(); // detect violence

lockDir = false; // Lock direction if true
lockMove = false; // Lock horizontal input if true
lockJump = false; // Lock horizontal input if true

flickerTimer = 0; // For after images

highJump = false; // For high jump anim


enum DRACSTATE {
	
	IDLE,
	TAIL_WHIP,
	STOMP,
	CARRY
	
}
