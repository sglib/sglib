package sglib.core.infs.play
{
	import sglib.core.data.Info;
	import sglib.core.data.Numeric;
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IPlayer
	{
		/**
		 * play/resume the current media
		 * @param	purl change the media first, prestart won't have any effect if purl != null
		 * @param	preset seek to 0 before start playing
		 */
		function play(purl: String = null, preset: Boolean = false):void;
		
		/**
		 * pause the currently playing media
		 */
		function pause():void;
		
		/**
		 * toggle from play/pause, this will also restart playing the media if it is stopped/ended
		 */
		function toggle():void;
		
		/**
		 * pause the media at 0 and stop the loader
		 */
		function stop():void;
		
		/**
		 * seek to the nearest possible position 
		 * @param	ptime (seconds)
		 */
		function seek(ptime: Number):void;
		
		/**
		 * get the duration by seconds
		 */
		function get duration(): Number;
		
		/**
		 * force the duration to some value (seconds) (progress will use this duration instead of getting it from the meta data of the stream or from sound
		 * the set duration should always be <= the real duration of the stream / sound
		 * this can be helpful in sound's case because sound's duration won't available till the whole sound is loaded
		 * or in video's case while there is no metadata, or simply because we want to prevent user from viewing the whole video (a quick and dirty way, of course)
		 */
		function set duration(pvalue: Number): void;
		
		
		
		/**
		 * [Bindable] the playing progress, aka position of the play head
		 */
		function get playProgress():Numeric;
		
		/**
		 * [Bindable] the buffering level, aka % till fully buffered and media resume playing
		 */
		function get buffer(): Numeric;
		
		/**
		 * [Bindable] the volume of the player
		 */
		function get volume(): Numeric;
		
		/**
		 * [Bindable] the playing staus : STOP | PLAY | PAUSE | BUFER 
		*/
		function get playStatus():State;
		
		/**
		 * [Bindable]
		 */
		function get playInfo():Info;
		
		
		/**
		 * [HELPER] equivalent to playStatus.addLsn(phandler, pparams)
		 *  to remove use playStatus.remLsn(phandler)
		 */
		function onPlayStatus(phandler: Function, pparams: Array = null, once: Boolean = false): IPlayer;
		
		/**
		 * [HELPER] equivalent to playProgress.addLsn(phandler, pparams)
		 * to remove use playProgress.remLsn(phandler)
		 */
		function onPlayProgress(phandler: Function, pparams: Array = null, once: Boolean = false): IPlayer;
		
	}
	
}