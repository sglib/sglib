package sglib.core.infs.comp 
{
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IScroll 
	{
		public function setPosition(pvalue: Numeric):IScroll;
		public function setRelation(pvalue: Numeric):IScroll;
	}
	
}