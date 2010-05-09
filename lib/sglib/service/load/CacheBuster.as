package sglib.service.load 
{
	import flash.utils.Dictionary;
	import sglib.core.constant.CacheBusterMode;
	import sglib.core.infs.load.ICacheBuster;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class CacheBuster implements ICacheBuster
	{
		protected var _mode : String;
		protected var _dict : Object; /* useful for FIRST mode */
		
		public function CacheBuster(pmode: String) 
		{
			_mode = pmode;
			_dict = { };
		}
		
		public function set mode(pvalue:String):void { _mode = pvalue; }
		
		public function fromURL(purl:String):String
		{
			if (mode == CacheBusterMode.NONE) return purl;
			
			var sign	: String = (purl.indexOf('?') == -1) ? '?' : '&';
			var rnd 	: String;
			
			switch (mode) {
				case CacheBusterMode.FIRST : 
					rnd = _dict[purl];
					if (!rnd) { /* not yet exist */
						rnd = Math.random();
						_dict[purl] = rnd;
					}
					break;
				case CacheBusterMode.ALWAYS :
					rnd = Math.random();
					break;
			}
			
			return purl + sign + 'cacheBuster=' + rnd;
		}
		
	}

}