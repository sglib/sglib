package display 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import sglib.core.gen.newStateView;
	import sglib.core.infs.visual.IStateView;
	import sglib.core.utils.drwRect;
	import sglib.display.base.StateView;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class StateViewTest extends Test
	{
		protected var sv : IStateView;
		
		public function StateViewTest() 
		{
			//import
			var a : StateView;
			
			sv = newStateView();
			sv.setContent(getTarget());
			sv.state.value = 'red';
			
			addChild(sv.view);
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			sv.state.value = ['red', 'green', 'blue'][int(Math.random() * 100) % 3];
		}
		
		protected function getTarget(): Sprite {
			var sprt : MovieClip = new MovieClip();
			
			var child : DisplayObject = drwRect(sprt.addChild(new Sprite()), 0xff0000, 200, 100);
			sprt['red'] = child;
			child = drwRect(sprt.addChild(new Sprite()), 0x00ff00, 200, 100);
			sprt['green'] = child;
			child = drwRect(sprt.addChild(new Sprite()), 0x0000ff, 200, 100);
			sprt['blue'] = child;
			
			return sprt;
		}
		
	}

}