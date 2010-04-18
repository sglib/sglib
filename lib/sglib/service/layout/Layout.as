package sglib.service.layout 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note not any relavant to ILayout
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class Layout
	{
		protected var _width	: int;
		protected var _height	: int;
		
		public function Layout() 
		{
			
		}
		
		public function get width():int { return _width }
		
		public function get height():int { return _height }
		
	}

}