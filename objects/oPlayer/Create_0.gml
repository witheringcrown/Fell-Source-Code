//general
state = states.idle;
halfwidth = 4;
feetheight = 6;
footstepsound = sndFootstepGrass;

//horizontal movement
acceleration = 0.2; //how fast the player accelerates when running
spd = 0; //how fast the player is running
maxspeed = 1.25; //the maximum speed the player can move when running
deceleration = 0.2; //how fast the player decelerates when running
hspd = 0; //how fast the player is moving on the x axis
xDirection = 1; //the direction the player is facing on the x axis

//Vertical Movement
initgrav = 18; //the normal acceleration due to gravity when not variable jumping
grav = initgrav; //acceleration due to gravity
jumpvelocity = 2.8; //the velocity the player is shot up when they press the jump button
variablejumprate = 2; //the rate at which gravity decreases when holding the jump button
vspd = 0; //how fast the player is moving on the y axis
maxjumptime = 0.2; //the maximum time the player can hold the jump button for a variable jump
jumptime = 0; //the time the player has held the jump button during a variable jump
maxjumps = 1; //the max amount of times the player can jump in the air
jumps = 1; //the amount of times the player can jump in the air
groundforgiveness = 6; //the amount of pixels to allow the player to jump before touching the ground.
coyotetime = 2; //the amount of frames to allow the player to jump after leaving a ledge.
walkofftime = 0; //the amount of frames since the player walked off a ledge.
cancoyote = false; //if the player can jump after walking off a ledge.
jumped = false; //if the player has jumped
maxfallvelocity = 3;

//Wall Jump
walljumpxvelocity = 2; //the velocity the player is shot out when they press the jump button
walljumpyvelocity = 4; //the velocity the player is shot up when they press the jump button
wallforgiveness = 4; //the amount of pixels to allow the player to jump before touching a wall.
wallmovetime = 0; //the amount of frames since the player was wall sliding.
maxwallmovetime = 6; //the amount of frames that the player can jump after moving away from a wall
slidegrav = 1; //the gravity the player experiences whern wall sliding
walljumptime = 0; //the time the player has wall jumped
maxwalljumptime = 0.2; //the time the player can wall jump
walldirection = 1; //the direction of the wall to walljump from
slidecutoff = 0.5;

//Dash
dashspeed = 5; //how fast the player dashes
maxdashtime = 0.1; //how long the player dashes
dashtime = 0; //how long the player has dashed
dashes = 0; //how many times the player can dash
maxdashes = 1; //how many times the player can dash in the air.

//Animation
sprite = sPlayerIdle;
spriteeyes = sPlayerIdleEyes;
rot = 0;
col = global.pplayer;
eyecol = global.pbackground;
idlesprite = sPlayerIdle;
idlespriteeyes = sPlayerIdleEyes;
runsprite = sPlayerRun;
runspriteeyes = sPlayerRunEyes;
jumpsprite = sPlayerJump;
jumpspriteeyes = sPlayerJumpEyes;
fallsprite = sPlayerFall;
fallspriteeyes = sPlayerFallEyes;
wallsprite = sPlayerWallSlide;
wallspriteeyes = sPlayerWallSlideEyes;

statestring = "Idle"

//Particles
parttime = 0;
partwalktime = 0.1;
partslidetime = 0.1;
partdashtime = 0.015;
ParticleSystem();