# Thank you for considering contributing

This document will try to help you get ready to contribute to the LDCad Shadow Library. The main goal will be to make life easier for both you and the Library maintainer.

## Introduction

Before you get started please realize you will need lots of patience, precision and some fidling to define accurate shadow information.

It also requires a basic understanding of the LDraw format and the way LDraw.org library files are constructed.

Just like LDraw files the shadow library is made out of human readable/editable .dat (UTF8 text) files, but you most likely don't want to edit those as is.

LDCad will combine the LDraw.org and shadow content of the same name during loading before processing it as a single text file.

## How to contribute

There are multiple ways of contributing something to the library:

1. Fork the github repo, clone a local copy, make your changes in a new branch and when done create a push request with that branch.
2. Post additions, changes, problems, suggestions on: https://forums.ldraw.org/thread-23807.html
3. E-Mail additions/changes to the LDCad author.

The push request method is preferred as it will be easier to merge your changes. It also provides you with full credit.

To make merging of your content as easy as possible please follow and or be aware of the following rules:

- Shadows should always be written against the latest LDraw.org library (https://library.ldraw.org/updates?latest).
- Making shadow files for unofficial parts is permitted but be sure you are using a very recent version of ldrawunf.zip and the unofficial library comes last in the search order.
- Header should be formatted similar to all other shadow files.
- Besides a subset of header meta's only LDCad SNAP, MIRROR and HINTS metas are allowed.
- Any donated content will become part of the library using its global license (see LICENSE.md).
- Your Content might be rejected if it needs to many corrections.

## LDCad

The easiest way of working with shadow files is inside LDCad itself. This section will help you setup a basic environment to do this in.

### Using the latest shadow library

By default LDCad comes with a packed version of the library inside offLibShadow.csl (located in the shadow/offLib folder)

You can edit the content of those files inside LDCad like normal, but you won't be able to safe anything afterwards.

So the first step is to unpack offLibShadow.csl somewhere or fetch a fresh copy of the githup repo and use that instead of offLibShadow.csl.

The .csl file is just a renamed zip so you can use your favorite archive program to extract its contents (rename it to .zip first if needed).

Once you got a folder with parts and p folders in it, move it somewhere logical. Just be sure to avoid a virtual (cloud) drive as it might be extremely slow. And keep it outside any normal LDraw library location.

Next you start LDCad to adjust its configuration. Open the LDraw search paths dialog (prefs/LDraw/Search (library) paths) and select the official library line in the search order section.

Its shadow portion should point to offLibShadow.csl, change it to wherever you placed the library root folder (use the "browse folder" button).

When done you will need to restart LDCad to activate the changes.

### Enabling part editing

Next we need to enable the shadow editing tools (>=LDCad 1.7 Beta 1), for this you open the "Prefs/Editing/Part editing" menu.

Enable its "Part (shadow) editing" and "Auto shadow header" options and click "Shadow header options...".

In the new dialog choose "Official" as format, input your full name (or github username) and be sure to leave "Delete empty files on disk" checked.

When done accept the changes, they will be applied without the need for a restart.

### The part editor

The biggest change will be the presence of a 'wrench' icon when the mouse hovers over a part inside a partbin (Like it does with submodels). Click any of them (e.g. 60475b.dat, Brick  1 x  1 with Clip) to start editing its shadow.

When first starting a part edit session LDCad might nag about the library location being zipped, but it should also note the shadow files will be savable (unlike when you used the .csl file). Just check the 'don't show again' option if it happens.

Editing parts is much like normal model editing. You can select / move things using the mouse and a property dialog (enter key) to change details for the selection.

But inside parts you are only allowed to move shadow content at the current level (nesting is not available for parts).

### Opening a source window

While possible it is kinda hard to edit shadow information using the default layout of LDCad, so lets make some changes to it.

Most important thing will be adding a source window. For this use "View/New source window", it is usually best to dock it to the right. (keep ctrl down when the window is near the target location)

The source window will (by default) scroll to shadow content for newly opened part edit sessions. This is indicated by the "--===Start of shadowfile: ...." line. This line will be visible even if there is no shadow file on disk for the corresponding LDraw library flle.

### Adding shadow information

You'll probably thinking "How about adding stuff?". This is done using a special part bin group called "LDCad meta's". You'll find it as part of the top level "Special parts" group (colored crosses icon). It's the blue wire frame of a stud one.

If you have a decent sized monitor you'll might consider opening this group in a second part bin window docked at the bottom of the screen. But you could just as easily assign a view to it in the default bin.

Explaining all meta's and their (many many) options falls outside the scope of this short introduction. You can find more information about them at the LDCad website (https://www.melkert.net/LDCad/tech/meta).

But it might be best to learn by example, just look for a similar part with existing information to get ideas. You can also search and ask questions about shadow editing on https://forums.ldraw.org

### Finding the best place to add shadow information

It is alsways best to add information to files high in the recursion tree. This way other (future) parts might inherit the same information without having to define them again.

LDCad has a special part bin group to help you find those files. It is located in the mostly MPD orientated "Model content overview" group. It has the "Deconstructed 1x1 plate" icon.

This group will list all recursively used LDraw files of the current session. When working with 3001.dat (2x4 brick) you'll see all of it's shadow information comes from the s\3001s01.dat file.

This ensures all future versions of the 2x4 brick will also have part snapping information without the need of a shadow library update.

## Additional tips

### Basic guide rules

- Use F11 to enable/disable rendering of part snapping information inside the bin and model editors. This will help you find parts in need of additional information.
- Use a transparent working color to see part shapes/place holder wire frames better.
- Don't add meta's to toplevel parts when they use subparts. Double click on things to go deeper into the part, and add new meta's only to the deepest level still containing the target 'shape'.
- Use a fine grid.
- Make use of the editors 2D view mode (v)

### Angles

Use plenty of digits for sin/cos values, or it WILL affect snapping precision in the y direction of the info.

for example:
- 45 deg sin: 0.70710678
- 60 deg sin: 0.86602544

### Rotation

All info points into the negative Y-axis when at rest.

Some alternative ori values are:

```
Neg Y (base)  1 0 0 0 1 0 0 0 1
Pos Y         1 0 0 0 -1 0 0 0 -1

Neg X         0 1 0 -1 0 0 0 0 1
Pos X         0 -1 0 1 0 0 0 0 1

Neg Z         1 0 0 0 0 -1 0 1 0
Pos Z         1 0 0 0 0 1 0 -1 0
```

## Meta properties

### ID's

Some (low level) shadow files use ID's in their meta's, this way the information can be dropped from higher parts if needed. The currently used ID's are:

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

Some off-beat shapes use group names to prevent unwanted matches, the currently used groups are:

- **bikeWheel**: Bicycle wheel.
- **bionicleChain**: Chain segment.
- **boat**: Boat segment connection.
- **boatMotor**: Boat motor connection.
- **buWizzExt**: buWizz extention connection.
- **buWizzUsb**: buWizz usb connection.
- **bucketArm**: Excavator arm bucket.
- **bumper**: Technic brick bumper connection.
- **clkRot**: Click rotation connection.
- **coffin**: Minifig coffin connection.
- **compass**: Minifig compass needle/disc.
- **cow**: Animal cow specific.
- **craneArmW16**: Slim technic beam based crane arm.
- **craneArmW20**: Normal technic beam based crane arm.
- **cylSlide**: Cylinder Tube Slide Connection.
- **diffHouse**: Technic differential housing.
- **door**: Generic door / frame connection.
- **door-1-3-4**: Specific door / frame connection.
- **dragon**: Animal dragon specific.
- **dragon1**: Dragon Body (Hungarian Horntail) conntection.
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
- **palmTree**: Palm tree brick connection.
- **pfLight**: Power functions led.
- **pfc**: Powerfunction 'wide elec stud'.
- **pneuCyl**: Pneumatic cylinder extension guide.
- **pwrFnc2Plg**: Power functions 2 plug/socket.
- **rim42_31**: See rims.
- **rim47_31**: See rims.
- **sglWhlAxle**: Single wheel axle / clips connector.
- **sharkHead**: Animal shark specific.
- **shooter**: Spring shooter.
- **shooter-2-6**: shooter brick halve.
- **shooter-btn**: shooter brick trigger button.
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

### Rim\* groups

The rim\8 groups are an encoded combination of tire/wheel shape parameters. The goal is to automatically perform 1 on n fitting without the need to research all possible combinations.
The format is: rimAA-BB, where AA is the smallest radius (spot rubber meets 'metal'), and BB is the distance between the ridges that keep the tire inbetween them measured using the 'rubber' insides.

## Snippets

0.5 connhole (there is no prim for it)
```
0 !LDCAD SNAP_CYL [gender=F] [caps=none] [secs=R 8 2  R 6 6  R 8 2] [center=true] [slide=true]
```
Technic ballpoint
```
0 !LDCAD SNAP_GEN [gender=M] [bounding=sph 12.7] [group=techBallJnt][match=size] [placement=free]
```
Technic ballsocket
```
0 !LDCAD SNAP_GEN [gender=F] [bounding=sph 12.7] [group=techBallJnt][match=size] [placement=free]
```
Towball balljoint
```
0 !LDCAD SNAP_GEN [gender=M] [bounding=sph 8] [match=size] [placement=free]
```
Towball socket
```
0 !LDCAD SNAP_GEN [gender=F] [bounding=sph 8] [match=size] [placement=free]
```
