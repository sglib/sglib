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
		protected static var _visualList	: VisualList;
		protected static var _loaderList	: LoaderList;
		protected static var _playerList	: PlayerList;
		
		public static function fromName(pname: String): Object {
			var cls : Class = getDefinitionByName(pname) as Class;
			if (cls) return new cls();
			return null;
		}
		
		public static function get Visual(): VisualList {
			if (!_visualList) _visualList = new VisualList();
			return _visualList;
		}
		
		public static function get Loader(): LoaderList {
			if (!_loaderList) _loaderList = new LoaderList();
			return _loaderList;
		} 
		
		public static function get Player(): PlayerList {
			if (!_playerList) _playerList = new PlayerList();
			return _playerList;
		}
		
	}

}
import sglib.core.infs.load.ILoaderAudio;
import sglib.core.infs.load.ILoaderGraphic;
import sglib.core.infs.load.ILoaderVideo;
import sglib.core.infs.play.IPlayerAudio;
import sglib.core.infs.play.IPlayerGraphic;
import sglib.core.infs.play.IPlayerVideo;
import sglib.core.infs.visual.IMaskedView;
import sglib.core.infs.visual.IVisualGraphic;
import sglib.core.infs.visual.IVisualVideo;
import sglib.core.utils.Instantiate;

class VisualList {
	public function get video(): IVisualVideo {
		return Instantiate.fromName('sglib.display.base.VisualVideo') as IVisualVideo;
	}
	public function get graphic(): IVisualGraphic {
		return Instantiate.fromName('sglib.display.base.VisualGraphic') as IVisualGraphic;
	}
	public function get maskedView(): IMaskedView {
		return Instantiate.fromName('sglib.display.base.MaskedView') as IMaskedView;
	}
}


class LoaderList {
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

class PlayerList {
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