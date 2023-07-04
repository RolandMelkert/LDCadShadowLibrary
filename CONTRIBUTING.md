# Thank you for considering contributing

This document will try to help you get ready to contribute to the LDCad Shadow Library. The main goal will be to make life easier for both you and the Library maintainer.

## Introduction

This document will help you get started, but before you do please realize it will need alot of patience and precision.

The library is made out of human readable/editable text (.dat) files, but you most likely don't want to edit those as is.

The easiest why of working with shadow files is right inside LDCad itself. Below you'll find a section about setting up a descent workflow.

Once you got one or more new / changed .dat file(s) you are ready to submit them, the're multiple ways of doing this (in descending profitability):

1. Clone the github repo and push your changes
2. Post additions, changes, problems, suggestions on: https://forums.ldraw.org/thread-23807.html
3. E-Mail additions/changes to the LDCad author.

## LDCad
As mentioned the best way to edit shadow files is inside LDCad itself. This section will help you setup a workable environment for this.

### Using the latest shadow library
By default LDCad comes with a packed version of the library inside offLibShadow.csl (located in the shadow/offLib folder)

You can edit the content of those files inside LDCad like normal but you won't be able to safe anything afterwards.

So first step is to unpack offLibShadow.csl somewhere or fetch a fresh copy of the githup repo and use that instead of offLibShadow.csl

The .csl file is just a renamed zip so you can use your favorite unzip program to extract it contents (rename it to zip first if needed).

Once you got a folder with parts and p folders in it, move it somewhere logical. Just be sure to avoid a virtual (cloud) drive as it might be extremely slow. And keep it outside any normal LDraw library location.

Next you (re)start LDCad (1.7 Beta 1 or later) to adjust it's configuration.

Open the LDraw search paths dialog (prefs/LDraw/Search (library) paths) and select the official library line in the search order section.

It's shadow option should point to offLibShadow.csl, change it to wherever you placed the library root folder (use the browse folder button).

You will need to restart LDCad to activate the changes.

### Enabling part editing
Next we need to enable some of the shadow editing tools, which are disabled by default, for this you open the "Prefs/Editing/Part" menu.

Enable its "Part (shadow) editing" and "Auto shadow header" options and click "Shadow header options...".

In the dialog choose "Official" as format and Type your full name (or github username) and be sure to leave "Delete empty files on disk" checked.

When done accept the changes, they will be applied without the need for a restart.

### The part editor

The biggest change will be the presence of a 'wrench' icon when the mouse hovers over a part inside partbin (just like for submodels). Just click any of them (e.g. 60475b.dat, Brick  1 x  1 with Clip) to start editing its shadow.

When first starting a part edit session LDCad might nag about the library location being zipped, but it should also note the shadow files will be savable (unlike when you used the .csl file). Just check 'don't show again' option if it happens.

Editing parts is much like normal model editing as you can select / move things using the mouse and a property dialog (enter key) to change details for the selection.

But inside parts you are only allowed to move shadow content at the current level (nesting is not available for parts).

### Opening a source window

While fully possible it is kinda hard to edit shadow information using the default layout of LDCad, so the next thing to do is make some changes to it.

Most important thing will be adding a source window. For this use "View/New source window", I usually dock it to the right.

The source window will (by default) automatically scroll to shadow content for newly opened part edit sessions. This is indicated by the "--===Start of shadowfile: ...." line.

This will be visible even if there is no shadow file on disk for the corresponding LDraw library flle.

### Adding shadow information

You'll probably thinking "How about adding stuff?". This is done using a special part bin group called "LDCad meta's". You'll find it as part of the top level "Special parts" group (colored crosses icon). It's the blue wire frame of a stud one.

Personally I like to keep that one open in a second part bin window docked at the bottom of the screen. But you could just as easily assign a view to it in the default bin.

Explaining all meta's and their (many many) options is somewhat of task and fall outside the scope of this short introduction.

It is best to learn by example, just look for a similar part with existing information to get ideas. You can also search and ask questions about shadow editing on https://forums.ldraw.org

## Tips

### Basic guide rules
- Use a transparent working color to see part shapes/place holder wire frames better.
- Don't add meta's to toplevel parts when they use subparts. Double click on things to go deeper into the part, and add new meta's only to the deepst level still containing the target 'shape'.
- Use a fine grid.
- Make use of the editors 2D view mode (v)

### Angles
Use plenty of digits for sin/cos values,
  or it WILL affect snapping precision in the y direction of the info.

for example:
45 deg sin: 0.70710678
60 deg sin: 0.86602544

### Rotation
All info points into the negative Y-axis when at rest.
 some alternative ori values are:

Neg Y (base)  1 0 0 0 1 0 0 0 1
Pos Y         1 0 0 0 -1 0 0 0 -1

Neg X         0 1 0 -1 0 0 0 0 1
Pos X         0 -1 0 1 0 0 0 0 1

Neg Z         1 0 0 0 0 -1 0 1 0
Pos Z         1 0 0 0 0 1 0 -1 0

## Meta properties


### ID's

Some primitive shadow files use ID's on some of the meta's, this way the information can dropped from higher parts if needed. The currently used ID's are:

- **aStud**: Antistud (stud4od.dat).
- **axle**: Axle (axle.dat).
- **axleDuplo**: Duplo technic axle.
- **axleHole**: Axle hole  (axlehole.dat).
- **axleHole2**: Axle hole type 2 (axl2hole.dat).
- **axleHole3**: Axle hole type 3 (axl3hole.dat).
- **axleHoleDuplo**: Duplo technic axle hole.
- **conn4**: Technic pin without the base (connect4.dat).
- **connhol3**: Technic connector one sided hole (connhol3.dat).
- **connhole**: Technic connector hole (connhole.dat).
- **dragonBodyL**: Animal Dragon specific.
- **dragonBodyR**: Animal Dragon specific.
- **dupStud**: Duplo stud.
- **elecHole**: Electic pin hole.
- **elecPin**: Electic pin.
- **elecSck**: Old (4.5v) electric pin.
- **flexEnd**: Flex hose segment primitive.
- **flexSeg**: Flex hose segment end primitive.
- **fpin10**: Technic pin (confric10.dat).
- **fpin11**: Technic pin (confric11.dat).
- **motorcyclewindshield**: 4482 motor cycle window.
- **pin8**: Technic pin (connect8.dat).
- **stud2**: Stud (stud2.dat).
- **stud3**: Stud (stud3.dat).
- **studC**: Stud (stud.dat and variants).
- **studDuplo**: Duplo stud and variants.
- **studO**: stud2.dat (open stud) and variants.
- **wpAxHole**: Wheel pin (axle) hole.



### Groups

Some off beat shapes use group names to prevent unwanted matches, the currently used groups are:

- **bikeWheel**: Bicycle wheel.
- **bionicleChain**: Chain segment.
- **boat**: Boat segment connection.
- **boatMotor**: Boat motor connection.
- **bucketArm**: Excavator arm bucket.
- **bumper**: Technic brick bumper connection.
- **clkRot**: Click rotation connection.
- **coffin**: Minifig coffin connection.
- **compass**: Minifig compass needle/disc.
- **cow**: Animal cow specific.
- **craneArmW16**: Slim technic beam based crane arm.
- **craneArmW20**: Normal technic beam based crane arm.
- **diffHouse**: Technic differential housing.
- **door**: Generic door / frame connection.
- **door-1-3-4**: Specific door / frame connection.
- **dragon**: Animal dragon specific.
- **dragonHead**: Animal dragon specific.
- **dragonTail**: Animal dragon specific.
- **drawer**: Minifig drawer cabinet.
- **drivingRing1**: Technic axle joiner transaction slider connection.
- **drivingRing2**: Technic axle joiner transaction slider connection.
- **dupFigArm**: Duplo figure arm.
- **dupFigHead**: Duplo figure head.
- **dupFigHips**: Duplo figure hips.
- **dupFigTorso**: Duplo figure torso.
- **duploLevCross**: Duplo train crossing road block.
- **duploTrain**: Duplo train rail connection.
- **elec**: 4.5 electric plug/hole.
- **elecDblPin**: 4.5 double pin with stud in the middle.
- **fabHipBar**: Fabland figure hip/leg hinge bar.
- **fabLeg**: Fabland figure leg.
- **ferris**: Duplo ferris wheel.
- **figBike3Frame**: Bike left/right frame.
- **frdsHps**: Friends hips (gen and fgr).
- **glWnd_1x4x6**: 1x4x6 window glass.
- **glWnd_72x60**: Window glass.
- **glsCarRoof**: Car roof glass.
- **gun**: Minifig gun fingers connection.
- **helmBbl**: Minifig bubble helmet.
- **hemi-4x4**: 4x4 sphere parts.
- **hgBrA**: Brick hinge (e.g. 3831).
- **hgBrB**: Brick hinge with pin  (e.g. 652).
- **hgBrC**: Classic brick hinge (e.g. 3937).
- **hgPlA**: Hinge plate with the outer clips (e.g. 3597).
- **hgPlB**: Hinge plate with pin (e.g. 3149e).
- **hngHook**: Hinge hook.
- **horse**: Animal horse specific.
- **horseHead**: Animal horse specific.
- **horseRearLeft**: Animal horse specific.
- **horseRearRight**: Animal horse specific.
- **hoseReel2x2**: 2x2 hose reel.
- **hoseReel2x4**: 2x2 hose reel.
- **ironMask**: Minifig iron man mask visor.
- **jack**: Minifig car jack.
- **ladder4207**: Ladder.
- **lckHng**: Lock hinge (e.h. clh2)
- **lightStud**: Light bulp of light bricks.
- **linAct1**: Small Linear Actuator Slider.
- **linAct2**: Big Linear Actuator Slider.
- **linearActBody**: Technic linear actuator cylinder piston connection.
- **magGlass**: Minifig magnifying glass.
- **magnet**: Train magnet.
- **mast**: Boat mast connection.
- **mfSuitCase**: Minifig suitcase hinge.
- **nudge1**: Technic spindle nudged sphere (32494 & 92902).
- **nxtc**: NXT rj12 connector.
- **pfLight**: Power functions led.
- **pfc**: Powerfunction 'wide elec stud'.
- **pneuCyl**: Pneumatic cylinder extension guide.
- **pwrFnc2Plg**: Power functions 2 plug/socket.
- **rim42_31**: See rims.
- **rim47_31**: See rims.
- **sglWhlAxle**: Single wheel axle / clips connector.
- **sharkHead**: Animal shark specific.
- **shooter**: Spring shooter.
- **steerHold1**: Technic steering holder (2792 & 2791a).
- **steerHub1**: Technic steering arm/hub (e.g. 41894 & 41895).
- **techBallJnt**: Technic ball joint spheres.
- **techEngine**: Technic engine block/cylinder head connection.
- **techFigElbw**: Technic figure elbow.
- **techFigFoot**: Technic figure foot.
- **techFigHips**: Technic figure hips.
- **techFigKnee**: Technic figure knee.
- **techFigPel**: Technic figure pelvis.
- **techFigVis**: Technic figure visor clip.
- **techFlexEnd**: Pen at flex-system wire ends.
- **techGearRack**: Technic bendable gearrack connection.
- **techTrnTbl60**: Technic turntable #60.
- **techWhlCon1**: Click wheel connection (e.g. wheel 2998 + clip 2999).
- **trainAxle**: Assembled train axle.
- **trainMagnet**: Train magnet cylinder.
- **trainMagnetClip**: Train magnet clip.
- **traintrk**: 9V train track connection.
- **turnTablePin**: Turntable pin m/f.
- **turntable5x5**: Turntable connection.
- **uniJnt**: Universal joint connection.
- **visor**: Minifig visor.
- **win-1-2-2**: Specific window/glass connection.
- **win-1-2-266**: Specific window/glass connection.
- **win-1-4-3**: Specific window/glass connection.
- **winDome**: Windscreen dome connection.
- **winTrain**: Train glass.
- **wpAxHole**: Wheel pin with small wings.
- **z28Turntable**: Turntable connection.
- **z56TurnTableT1**: Turntable connection.



### Wheels

tyre/rimms are combinations of their shape parameters, in hopes they automatically perform 1 on n fitting without the need to resource all combo's.--
rimAA-BB: where AA is the smallest radius (where rubber meets metal), and BB is the distance between the ridges which keeps the tyre in between them, taken from the rubber insides.



## Snippets

0.5 connhole (there is no prim for it)
  0 !LDCAD SNAP_CYL [gender=F] [caps=none] [secs=R 8 2  R 6 6  R 8 2] [center=true] [slide=true]

Technic ballpoint
  0 !LDCAD SNAP_GEN [gender=M] [bounding=sph 12.7] [group=techBallJnt][match=size] [placement=free]

Technic ballsocket
  0 !LDCAD SNAP_GEN [gender=F] [bounding=sph 12.7] [group=techBallJnt][match=size] [placement=free]

Towball balljoint
  0 !LDCAD SNAP_GEN [gender=M] [bounding=sph 8] [match=size] [placement=free]

Towball socket
  0 !LDCAD SNAP_GEN [gender=F] [bounding=sph 8] [match=size] [placement=free]
