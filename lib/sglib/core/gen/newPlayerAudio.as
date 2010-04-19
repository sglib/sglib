package sglib.core.gen 
{
	import sglib.core.infs.play.IPlayerAudio;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function newPlayerAudio() : IPlayerAudio
	{
		return instantiate('sglib.controller.play.PlayerAudio') as IPlayerAudio;
	}
	
}