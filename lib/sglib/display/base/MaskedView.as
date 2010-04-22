package sglib.display.base 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import sglib.core.constant.LoadStatus;
	import sglib.core.data.Numeric;
	import sglib.core.infs.ITransition;
	import sglib.core.infs.visual.IMaskedView;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.core.infs.visual.IVisualObject;
	import sglib.core.utils.drwRect;
	import sglib.core.utils.pct2Val;
	import sglib.core.utils.val2Pct;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 18 April 2010 (0.1.0)
	 */
	public class MaskedView extends VisualObject implements IMaskedView
	{
		protected var _mask		: DisplayObject;
		protected var _holder	: Sprite;
		
		protected var _content	: IVisualObject;
		
		protected var _hzPosition	: Numeric;
		protected var _hzRelation	: Numeric;
		protected var _vtPosition	: Numeric;
		protected var _vtRelation	: Numeric;
		
		public function MaskedView(ptarget: DisplayObject = null, pwidth: int = 100, pheight: int = 100) 
		{
			super(ptarget);
			
			_holder = (_view.getChildByName('mcHolder') as Sprite) || new Sprite();
			_mask = _view.getChildByName('mcMask') || drwRect(new Sprite(), 0xff0000, pwidth, pheight, 1);
			_holder.mask = _mask;
			
			_width = _mask.width;
			_height = _mask.height;
			
			_view.addChild(_holder);
			_view.addChild(_mask);
			
			_hzPosition = new Numeric(0);
			_vtPosition = new Numeric(0);
			_hzRelation = new Numeric(0);
			_vtRelation = new Numeric(0);
			
			_hzPosition.addLsn(_onHzPosition);
			_vtPosition.addLsn(_onVtPosition);
		}
		
		private function _onVtPosition():void
		{
			if (_content) _content.view.y = pct2Val(_height - _content.height, 0, 1 - _vtPosition.value, true);
		}
		
		private function _onHzPosition():void
		{
			if (_content) _content.view.x = pct2Val(_width - _content.width, 0, 1 - _hzPosition.value, true);
		}
		
		public function setContent(pcontent:DisplayObject):IMaskedView
		{
			setVisualContent(_fromDisplayObject(pcontent));
			return this;
		}
		
		public function setVisualContent(pcontent:IVisualObject):IMaskedView
		{
			_content = pcontent;
			_holder.addChild(_content.view);
			
			if (pcontent is IVisualGraphic) {
				var vg : IVisualGraphic = pcontent as IVisualGraphic;
				(vg.asLoader.loadStatus.value != LoadStatus.COMPLETED) ? vg.asLoader.onLoadStatus(_onChangedContent, null, true) : _onChangedContent();
			} else {
				_onChangedContent();
			}
			return this;
		}
		
		protected function _onChangedContent(): void {
			_hzRelation.value = val2Pct(0, _content.width, _width);
			_vtRelation.value = val2Pct(0, _content.height, _height);
			_onVtPosition();
			_onHzPosition();
		}
		
		public function setSize(pwidth:int, pheight:int):IMaskedView
		{
			_width = pwidth;
			_height = pheight;
			_mask.width = _width;
			_mask.height = _height;
			if (_content) _onChangedContent();
			return this;
		}
		
		
		public function get hzPosition():Numeric { return _hzPosition; }
		
		public function get hzRelation():Numeric { return _hzRelation; }
		
		public function get vtPosition():Numeric { return _vtPosition; }
		
		public function get vtRelation():Numeric { return _vtRelation; }
		
	}

}