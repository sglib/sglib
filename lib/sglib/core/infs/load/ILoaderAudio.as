package sglib.core.infs.load
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import sglib.core.data.Numeric;
	import sglib.core.infs.play.IPlayerAudio;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note	Remember that _sound.duration is changing over time while the audio is loading 
	 * 			(it will run from 0 from start to the correct duration when loading is completed)
	 * 
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public interface ILoaderAudio extends ILoader
	{
		/**
		 * set the sound loader context, remember to do this before call start()
		 * @param pbuffer buffer time before the audio start playing
		 * @param pcheckPolicy remember that checkPolicy == true will slow down download a little bit
		*/
		function context(pbuffer: Number = 1000, pcheckPolicy: Boolean = false): ILoaderAudio;
		
		/**
		 * the sound object that use to load the audio
		 */
		function get sound(): Sound;
		
		/**
		 * the player attached to this Audio - can be null
		 */
		function get player(): IPlayerAudio;
	}
	
}