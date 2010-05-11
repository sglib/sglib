package sglib.core.debug {

    import flash.display.*;
    import flash.events.*;
    import flash.system.System;
    import flash.text.*;
    import flash.utils.getTimer;

	/**
	 * <b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a><br />
	 * <b>Class version:</b> 1.0<br />
	 * <b>Actionscript version:</b> 3.0<br />
	 * <b>Copyright:</b> Free to use and change (except to include in a framework), an notification email will be welcome for a commercial use (just for information).<br />
	 * <b>Date:</b> 04-2008<br /><br />
	 * <b>Usage:</b> Create a bar at the top of a swf file to display Frame Per Second and Memory usage.
	 * @example
	 * <listing version="3.0">addChild(new FPS());</listing>
	 * <listing version="3.0">addChild(new FPS(0xFF0000, 0xFFFF00, 0x000000, .5, FPS.MEMORY_MEGABYTES));</listing>
	 */
	
    public class FPS extends Sprite {
		
		//------------------------------------
		// private, protected properties
		//------------------------------------
		
		private var _barColor:uint;
		private var _bgColor:uint;
		private var _textColor:uint;
		private var _bgAlpha:uint;
        private var _bar:Sprite = new Sprite();
        private var _bg:Sprite = new Sprite();
        private var _text:TextField = new TextField();
        private var _time:Number;
        private var _frameTime:Number;
        private var _prevFrameTime:Number = getTimer();
        private var _secondTime:Number;
        private var _prevSecondTime:Number = getTimer();
        private var _frames:Number = 0;
        private var _fps:String = "...";
        private var _other:String = "";
        private var _memory:String;
        private var _typeMemory:uint;
		
		//------------------------------------
		// public properties
		//------------------------------------
		
		public static const MEMORY_BYTES:uint = 1;
		public static const MEMORY_KILOBYTES:uint = 2;
		public static const MEMORY_MEGABYTES:uint = 3;
		
		//------------------------------------
		// constructor
		//------------------------------------
        
		/**
		 * Constructor
		 * @param bgColor background color
		 * @param barColor color of the bar that displays the information
		 * @param textColor text color that displays the information
		 * @param bgAlpha alpha of the background
		 * @param typeMemory type of the memory displayed (bytes, kilobytes, megabytes)
		 */
        public function FPS(bgColor:uint = 0xCCCCCC, barColor:uint = 0xFFFFFF, textColor:uint = 0x333333, bgAlpha:Number = 1, typeMemory:uint = FPS.MEMORY_MEGABYTES) {
			buttonMode = true;
			mouseChildren = false;
			_bgColor = bgColor;
			_barColor = barColor;
			_textColor = textColor;
			_bgAlpha = bgAlpha;
            _typeMemory = typeMemory;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true);
        }
		
		//
		// PRIVATE, PROTECTED
		//________________________________________________________________________________________________
		
		private function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init, false);
            _bg.graphics.beginFill(_bgColor, 1);
            _bg.graphics.drawRect(0, 0, stage.stageWidth, 10);
            _bg.graphics.endFill();
            _bg.alpha = _bgAlpha;
            addChild(_bg);
            _bar.graphics.beginFill(_barColor, 1);
            _bar.graphics.drawRect(0, 0, 25, 10);
            _bar.graphics.endFill();
            addChild(_bar);
            _text.autoSize=TextFieldAutoSize.LEFT;
            _text.textColor = _textColor;
            _text.selectable = false;
            addChild(_text);
            scaleX = 2;
            scaleY = 2;
            addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}
		
		private function clickHandler(e:MouseEvent):void {
			if (e.target == e.currentTarget) {
				e.stopImmediatePropagation();
				removeEventListener(MouseEvent.CLICK, clickHandler, false);
				removeEventListener(Event.ENTER_FRAME, onEnterFrame, false);
				parent.removeChild(this);
			}
		}
		
        private function onEnterFrame(e:Event):void {
            _time = getTimer();
            _frameTime = _time - _prevFrameTime;
            _secondTime = _time - _prevSecondTime;
            if(_secondTime >= 1000){
                _fps = _frames.toString();
                _frames = 0;
                _prevSecondTime = _time;
			}
			else _frames++;
            _prevFrameTime = _time;
            if(_typeMemory == FPS.MEMORY_BYTES){
                _memory = flash.system.System.totalMemory.toPrecision(4) + " bytes";
            }
			else if(_typeMemory == FPS.MEMORY_KILOBYTES){
                _memory = (flash.system.System.totalMemory / 1000).toPrecision(4) + " kbs";
            }
			else if (_typeMemory ==  FPS.MEMORY_MEGABYTES){
                _memory = (flash.system.System.totalMemory / 1000000).toPrecision(4) + " mbs";
            }
            _text.htmlText = "<font face=\"arial\" size=\"5\"> FPS: "+ _fps +" fps / "+ _frameTime +"ms - Mem: "+ _memory +" - "+ _other.toString() +"</font>";
            _bar.scaleX = _bar.scaleX - ((_bar.scaleX - (_frameTime/10)) / 5);
        }
		
		// PUBLIC
		//________________________________________________________________________________________________
		
		/**
		 * Add a value to show in the bar
		 * @param value
		 */
        public function add(value:String):void {
            _other = value;
        }
		
    }
}
