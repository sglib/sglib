package sglib.service.load 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import sglib.core.data.Numeric;
	import flash.media.Sound;
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.infs.play.IPlayer;
	import sglib.core.infs.play.IPlayerAudio;
	import sglib.service.load.LoaderBase;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LoaderAudio extends LoaderBase implements ILoaderAudio
	{
		protected var _context		: SoundLoaderContext;
		protected var _sound		: Sound;
		protected var _player		: IPlayerAudio;
		
		
		public function LoaderAudio() 
		{
			_sound = new Sound();
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/
		
		override protected function _start():void 
		{
			_sound.load(new URLRequest(busterURL), _context);
		}
		
		override protected function _stop():void 
		{
			try {
				_sound.close();
			} catch (e: Error) {}
		}
		
		override protected function _addLsn(pdispatcher:IEventDispatcher = null):void 
		{
			_sound.addEventListener(Event.ID3, _onInfo);
			super._addLsn(_sound);
		}
		
		override protected function _remLsn(pdispatcher:IEventDispatcher = null):void 
		{
			_sound.removeEventListener(Event.ID3, _onInfo);
			super._remLsn(_sound);
		}
	 	
		override public function set iPlayer(pplayer: IPlayer): void {
			_player = pplayer as IPlayerAudio;
		}
		
	/******************************
	 *		PUBLIC METHODS
	 *****************************/	
		
		/**
		 * @inheritDoc
		 */
		public function context(pbuffer:Number = 1000, pcheckPolicy:Boolean = false):ILoaderAudio
		{
			_context = new SoundLoaderContext(pbuffer, pcheckPolicy);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get player():IPlayerAudio { return _player }
		
		/**
		 * @inheritDoc
		 */
		public function get sound():Sound { return _sound; }
		
		/**
		 * @inheritDoc
		 */
		//public function get buffer():Numeric { return _buffer }
		
	}

}