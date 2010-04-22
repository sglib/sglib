package sglib.display.base
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import sglib.core.constant.VisualStatus;
	import sglib.core.data.State;
	import flash.display.Sprite;
	import sglib.core.infs.ITransition;
	import sglib.core.infs.visual.IVisualObject;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualObject implements IVisualObject
	{
		protected var _view			: Sprite; /* neccessary to change content's registration point */
		//protected var _bitmap		: Bitmap; /* swapable with content */
		//protected var _transition	: ITransition; /* show / hide content */
		
		protected var _width 	: int;
		protected var _height	: int;
		
		protected var _regX		: Number;
		protected var _regY		: Number;
		
		protected var _status	: State;
		
		private var _content	: DisplayObject;
		
		//Additional props 
		//protected var _tint			: Number; //0xAARRGGBB - AA : Tween amount 0-255
		//protected var _bright		: Number;
		//protected var _contrast		: Number;
		//protected var _saturation	: Number;
		
		public function VisualObject(pview: DisplayObject = null) { 
			_view = pview ? pview as Sprite : new Sprite();
			
			if (_view.numChildren == 1) {//timeline visual object
				_fromDisplayObject((pview as DisplayObjectContainer).getChildAt(0), this);
			} else {
				_regX = 0;
				_regY = 0;
			}
			_status = new State(VisualStatus.READY);
		}
		
	/************************
	 * 	INTERNAL METHODS
	 ***********************/	
		
		protected function _regAlign(obj : DisplayObject):void {
			obj.x = -_regX * _width;
			obj.y = -_regY * _height;
		}
	 
		protected function _updateReg():void
		{
			// align content
		}
		
		protected static function _fromDisplayObject(pdo : DisplayObject, vo : VisualObject = null): VisualObject {
			var p : DisplayObjectContainer = pdo.parent;
			
			if (vo == null) vo = new VisualObject();
			
			vo._content = pdo;
			vo._width = pdo.width;
			vo._height = pdo.height;
			vo._view.x = pdo.x;
			vo._view.y = pdo.y;
			vo._regX = - pdo.x / pdo.width;
			vo._regY = -pdo.y / pdo.height;
			
			pdo.x = 0;
			pdo.y = 0;
			vo._view.addChild(pdo);
			if (p) p.addChild(vo._view);
			
			vo._status.value = VisualStatus.READY;
			
			return vo;
		}
		
	/************************
	 * 	PUBLIC METHODS
	 ***********************/
		
		/**
		 * @inheritDoc
		 */
		public function setReg(px:Number, py:Number):IVisualObject { 
			_regX = px;
			_regY = py;
			_updateReg();
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get view():Sprite { return _view; }
		
		/**
		 * @inheritDoc
		 */
		public function get width():int{ return _width }
		
		/**
		 * @inheritDoc
		 */
		public function get height():int{ return _height }
		
		/**
		 * @inheritDoc
		 */
		public function get status():State{ return _status }
		
	}

}