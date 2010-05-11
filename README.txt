What already in in current build of SGLib

1. Video / Sound / Graphic loader / player (with cacher support for Graphic)
2. Uploader / Webcam / Data loader
3. Visual Buffer / Mask / Limit / Swap / State
4. Task / Layout

=============================================================================================

What need to be done in the very first library version

1.	Transition 		: Bitmap (?) / Swapper / ...
2.	Liquid			: Make SWF content resizable the easy way KAlign / KScale / ...
3.	Aim / Animate	: Making animations
4.	Events			: Wrapper to switch from events to Info ?
5.	MouseUtils		: Drag / Pan / Throw / DoubleClick / MouseBehavior ...
6.	utils			: addLsn, remLsn, func proxy, tint, filters, reflection, text brief ...
7.	UniqueList		: fast sorted linked list
8.	MediaView		: Composite video/sound/swf player ...
9.	Menu				: Support open / close based on state
10.	TextArea			: Support css loading / autosize / add scroller / selectable / copy text ...
11.	Input/Autocomplete	: Support hint, styling ...
12.	FormBuilder		: Making form + validators
13.	UserLogin		: login/logout/forgot pass/remember me/register ...
15.	MultiLanguage	: useDataID to manage all data
16.	Scale/Zoom/Rotate
17.	Pending action	: Delay / pooling action
18*	Instantiate intergrate with ClassesManager to load / unload all definitions + refactor all classes to use with Instantiate
19*	Some kind of memory classes footprint monitoring & performance / size profiling
		Using of package's function ?
		Using of Static Classes
20	Object Pooling / GC collectable for all classes ...
21	Chatbox, p2p send file
23	Large bitmap support (split into smaller ones and load as a map)
24	Static text markup

==================================================================================================

What demos will be done with the first version of the library

1. A multi-uploader
2. A Media Gallery with categories zoom / rotate / filters ...
3. A liquid multi-language website (+ use with GaiA ) with style, languages, user, shoutbox
4. A PDF reader

==================================================================================================

Road map for SGFLib version 1.0.0

1. Release version 1 alpha 0-3 (Fix bugs + improve usability)
2. Release version 1 beta 0-3 (Fix bugs + add more utilities + optimize for performane)
3. Release version 1 RC 0-3 (Build demos + fix bugs + add features )
4. Official release of version 1

==================================================================================================

What's next in 2.0.0

1. Rebuild flash/flex component set purely AS3 - ref : AsWing, LiquidComponents, minimalComponents
	(most importantly : Tree)
2. Air / Web / Component template - ref : Gaia

Demos to be build with 2.0.0

1. AS Viewer - ref : Flash MiniBuilder
2. AS3 UML
3. XML / HTML editor