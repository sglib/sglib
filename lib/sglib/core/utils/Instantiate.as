package sglib.core.utils 
{
	import flash.utils.getDefinitionByName;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class Instantiate
	{
		protected static var _visualClasses	: VisualClasses;
		protected static var _loaderClasses	: LoaderClasses;
		protected static var _playerClasses	: PlayerClasses;
		protected static var _layoutClasses	: LayoutClasses;
		
		public static function fromName(pname: String): Object {
			var cls : Class = getDefinitionByName(pname) as Class;
			if (cls) return new cls();
			return null;
		}
		
		public static function get Visual(): VisualClasses {
			if (!_visualClasses) _visualClasses = new VisualClasses();
			return _visualClasses;
		}
		
		public static function get Loader(): LoaderClasses {
			if (!_loaderClasses) _loaderClasses = new LoaderClasses();
			return _loaderClasses;
		} 
		
		public static function get Player(): PlayerClasses {
			if (!_playerClasses) _playerClasses = new PlayerClasses();
			return _playerClasses;
		}
		
		public static function get Layout(): LayoutClasses {
			if (!_layoutClasses) _layoutClasses = new LayoutClasses();
			return _layoutClasses;
		}
		
	}

}
import sglib.core.infs.layout.ILayoutGrid;
import sglib.core.infs.layout.ILayoutList;
import sglib.core.infs.load.ILoaderAudio;
import sglib.core.infs.load.ILoaderGraphic;
import sglib.core.infs.load.ILoaderVideo;
import sglib.core.infs.play.IPlayerAudio;
import sglib.core.infs.play.IPlayerGraphic;
import sglib.core.infs.play.IPlayerVideo;
import sglib.core.infs.visual.IGroupView;
import sglib.core.infs.visual.IMaskedView;
import sglib.core.infs.visual.IVisualGraphic;
import sglib.core.infs.visual.IVisualVideo;
import sglib.core.utils.Instantiate;

class VisualClasses {
	public function get video(): IVisualVideo {
		return Instantiate.fromName('sglib.display.base.VisualVideo') as IVisualVideo;
	}
	public function get graphic(): IVisualGraphic {
		return Instantiate.fromName('sglib.display.base.VisualGraphic') as IVisualGraphic;
	}
	public function get maskedView(): IMaskedView {
		return Instantiate.fromName('sglib.display.base.MaskedView') as IMaskedView;
	}
	public function get groupView(): IGroupView {
		return Instantiate.fromName('sglib.display.base.GroupView') as IGroupView;
	}
}


class LoaderClasses {
	public function get video(): ILoaderVideo {
		return Instantiate.fromName('sglib.service.load.LoaderVideo') as ILoaderVideo;
	}
	public function get graphic(): ILoaderGraphic {
		return Instantiate.fromName('sglib.service.load.LoaderGraphic') as ILoaderGraphic;
	}
	public function get audio(): ILoaderAudio {
		return Instantiate.fromName('sglib.service.load.LoaderAudio') as ILoaderAudio;
	}
}

class PlayerClasses {
	public function get video(): IPlayerVideo {
		return Instantiate.fromName('sglib.controller.play.PlayerVideo') as IPlayerVideo;
	}
	public function get graphic(): IPlayerGraphic {
		return Instantiate.fromName('sglib.controller.play.PlayerGraphic') as IPlayerGraphic;
	}
	public function get audio(): IPlayerAudio {
		return Instantiate.fromName('sglib.controller.play.PlayerAudio') as IPlayerAudio;
	}
}

class LayoutClasses {
	public function get list(): ILayoutList {
		return Instantiate.fromName('sglib.service.layout.LayoutList') as ILayoutList;
	}
	public function get grid(): ILayoutGrid {
		return Instantiate.fromName('sglib.service.layout.LayoutGrid') as ILayoutGrid;
	}
}